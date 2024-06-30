// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:renttas/application/forgetpassword/forgetpassword_bloc.dart';
import 'package:renttas/main.dart';
import 'package:renttas/presentation/screens/auth/forget_password/widget/email_field.dart';
import 'package:renttas/presentation/widgets/buttons/custom_button.dart';

class ForgetPasswordEmailInput extends StatelessWidget {
  ForgetPasswordEmailInput(
      {required this.requested, super.key, required this.forgetController});
  bool requested;
  TextEditingController forgetController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.all(11.0),
          child: ForgetEmailField(
            controller: forgetController,
            hitText: 'Enter your email',
            keyboardType: TextInputType.emailAddress,
            icon: const Icon(Icons.abc),
          ),
        ),
        requested
            ? CircularProgressIndicator(
                color: contsGreen,
              )
            : Padding(
                padding: const EdgeInsets.all(25.0),
                child: CustomButton(
                  isNetwork: false,
                  isRow: false,
                  borderclr: const Color.fromARGB(255, 76, 135, 77),
                  color: const Color.fromARGB(255, 82, 144, 83),
                  fontweight: FontWeight.w500,
                  height: 50,
                  name: 'Get Otp',
                  onTap: () => otpReq(context),
                  radius: 30,
                  textclr: Colors.white,
                  textsize: 20,
                ),
              )
      ],
    );
  }

  void otpReq(context) {
    BlocProvider.of<ForgetpasswordBloc>(context)
        .add(ForgetRequestEvent(email: forgetController.text));
  }
}
