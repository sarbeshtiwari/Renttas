import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renttas/application/signup_bloc/auth_bloc.dart';
import 'package:renttas/presentation/screens/auth/sign_in/signin.dart';
import 'package:renttas/presentation/screens/auth/sign_up/widgets/fields.dart';
import 'package:renttas/presentation/screens/landlord/home/home.dart';
import 'package:renttas/presentation/screens/tentant/home/home.dart';
import 'package:renttas/presentation/widgets/alerts/alerts.dart';
import 'package:renttas/presentation/widgets/navigators/navs.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key, required this.role});
  final String role;
  bool req = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state is SignUpEventCalled) {
              req = true;
            } else if (state is AuthInitial) {
              req = false;
            } else if (state is AuthErrorState) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                alerts(context, state.message);
                BlocProvider.of<AuthBloc>(context).add(AuthEvent());
              });
            } else if (state is SignupSuccesState) {
              if (state.user) {
                saveinfo('user');
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  customNavRemoveuntil(
                      context, const TenantWelcomeHomeScreen());
                  BlocProvider.of<AuthBloc>(context).add(AuthEvent());
                });
              } else {
                saveinfo('admin');
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  customNavRemoveuntil(context, const LandlordHomeScreen());
                  BlocProvider.of<AuthBloc>(context).add(AuthEvent());
                });
              }
            }
            return SingleChildScrollView(
              child: Column(
                children: [
                  Image.asset('assets/images/signup.png'),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Sign Up',
                    style: GoogleFonts.inter(
                        fontSize: 36, fontWeight: FontWeight.w800),
                  ),
                  SignUpFields(
                    req: req,
                    role: role,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Already Have An Account?'),
                      TextButton(
                        onPressed: () =>
                            customNavRemoveuntil(context, SignInScreen()),
                        child: const Text(
                          'Sign In',
                          style: TextStyle(
                              decorationColor: Color.fromARGB(255, 255, 0, 0),
                              color: Color.fromARGB(255, 255, 0, 0),
                              decoration: TextDecoration.underline),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
