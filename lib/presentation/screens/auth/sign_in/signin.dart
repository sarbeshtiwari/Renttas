// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:renttas/application/login_bloc/login_bloc.dart';
import 'package:renttas/main.dart';
import 'package:renttas/presentation/screens/auth/sign_in/widgets/fields.dart';
import 'package:renttas/presentation/screens/landlord/home/home.dart';
import 'package:renttas/presentation/screens/tentant/home/home.dart';
import 'package:renttas/presentation/screens/user_type/type.dart';
import 'package:renttas/presentation/widgets/alerts/alerts.dart';
import 'package:renttas/presentation/widgets/navigators/navs.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool req = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: BlocBuilder<LoginBloc, LoginState>(
            builder: (context, state) {
              if (state is LoginSuccesState) {
                if (state.user) {
                  saveinfo('user');
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    customNavRemoveuntil(
                        context, const TenantWelcomeHomeScreen());
                    BlocProvider.of<LoginBloc>(context).add(LoginEvent());
                  });
                } else {
                  saveinfo('admin');
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    customNavRemoveuntil(context, const LandlordHomeScreen());
                    BlocProvider.of<LoginBloc>(context).add(LoginEvent());
                  });
                }
              } else if (state is LoginErrorState) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  alerts(context, state.message);
                  BlocProvider.of<LoginBloc>(context).add(LoginEvent());
                });
              } else if (state is LoginRequsted) {
                req = true;
              } else if (state is LoginInitial) {
                req = false;
              }
              return Column(
                children: [
                  Image.asset('assets/images/signup.png'),
                  const SizedBox(
                    height: 10,
                  ),
                  const CircleAvatar(
                    radius: 80,
                    backgroundColor: Color.fromARGB(255, 82, 144, 83),
                    child: Icon(
                      // Icons.person,
                      Icons.person,
                      color: Colors.white,
                      size: 60,
                    ),
                  ),
                  SignInFields(
                    req: req,
                    emailController: emailController,
                    passwordController: passwordController,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Don\'t Have An Account?'),
                      TextButton(
                        onPressed: () =>
                            customNavRemoveuntil(context, UserTypeScreen()),
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                              decorationColor: Color.fromARGB(255, 255, 0, 0),
                              color: Color.fromARGB(255, 255, 0, 0),
                              decoration: TextDecoration.underline),
                        ),
                      ),
                    ],
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

void saveinfo(String value) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  await preferences.setString(loginTocken, value);
}

Future<void> clearLoginInfo() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.clear();
}
