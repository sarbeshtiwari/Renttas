// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:renttas/application/forgetpassword/forgetpassword_bloc.dart';
import 'package:renttas/presentation/screens/auth/forget_password/widget/change_password.dart';
import 'package:renttas/presentation/screens/auth/forget_password/widget/email_input.dart';
import 'package:renttas/presentation/screens/auth/forget_password/widget/otp_screen.dart';
import 'package:renttas/presentation/screens/auth/forget_password/widget/top.dart';
import 'package:renttas/presentation/screens/auth/sign_in/signin.dart';
import 'package:renttas/presentation/widgets/alerts/alerts.dart';
import 'package:renttas/presentation/widgets/navigators/navs.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({super.key});
  final forgetController = TextEditingController();
  final otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    bool requsted = false;
    bool otpSuccess = true;
    return Scaffold(
      body: SingleChildScrollView(
        child: BlocBuilder<ForgetpasswordBloc, ForgetpasswordState>(
          builder: (context, state) {
            if (state is ForgetPasswordErrorState) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                BlocProvider.of<ForgetpasswordBloc>(context)
                    .add(ForgetpasswordEvent());
                alerts(context, state.msg);
              });
            } else if (state is OtpSendSuccessState) {
              otpSuccess = true;
            } else if (state is ForgetRequestedState) {
              requsted = true;
            } else if (state is ForgetpasswordInitial) {
              requsted = false;
              otpSuccess = false;
            } else if (state is OtpVerifiedState) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                changePassword(context);
                BlocProvider.of<ForgetpasswordBloc>(context)
                    .add(ForgetpasswordEvent());
              });
            } else if (state is PasswordResentSuccessState) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                customNavRemoveuntil(context, SignInScreen());
                BlocProvider.of<ForgetpasswordBloc>(context)
                    .add(ForgetpasswordEvent());
              });
            }
            return Column(
              children: [
                const ForgetPasswordTopImages(),
                otpSuccess
                    ? ForgetPasswordOtpField(
                        otpController: otpController,
                      )
                    : ForgetPasswordEmailInput(
                        requested: requsted,
                        forgetController: forgetController,
                      ),
              ],
            );
          },
        ),
      ),
    );
  }
}
