// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pin_code_fields/flutter_pin_code_fields.dart';
import 'package:renttas/application/forgetpassword/forgetpassword_bloc.dart';
import 'package:renttas/main.dart';
import 'package:renttas/presentation/widgets/buttons/custom_button.dart';

class ForgetPasswordOtpField extends StatelessWidget {
  ForgetPasswordOtpField({required this.otpController, super.key});
  TextEditingController otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 30,
        ),
        Padding(
            padding: const EdgeInsets.all(35.0),
            child: PinCodeFields(
                controller: otpController,
                length: 4,
                fieldBorderStyle: FieldBorderStyle.square,
                fieldHeight: 60,
                borderWidth: 1.0,
                activeBorderColor: contsGreen,
                borderRadius: BorderRadius.circular(12),
                textStyle: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 18),
                keyboardType: TextInputType.number,
                onComplete: (value) {
                  BlocProvider.of<ForgetpasswordBloc>(context)
                      .add(ForgetOtpChecking(otp: otpController.text));
                })),
        Padding(
          padding: const EdgeInsets.all(25.0),
          child: CustomButton(
            isNetwork: false,
            isRow: false,
            borderclr: const Color.fromARGB(255, 76, 135, 77),
            color: const Color.fromARGB(255, 82, 144, 83),
            fontweight: FontWeight.w500,
            height: 50,
            name: 'Verify',
            onTap: () {},
            radius: 30,
            textclr: Colors.white,
            textsize: 20,
          ),
        )
      ],
    );
  }
}
