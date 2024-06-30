// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:renttas/application/signup_bloc/auth_bloc.dart';
import 'package:renttas/domain/models/signup_models/models.dart';
import 'package:renttas/presentation/widgets/buttons/custom_button.dart';
import 'package:renttas/presentation/widgets/form_field/form_field.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class SignUpFields extends StatefulWidget {
  const SignUpFields({required this.req, super.key, required this.role});
  final String role;
  final bool req;
  @override
  State<SignUpFields> createState() => _SignUpFieldsState();
}

class _SignUpFieldsState extends State<SignUpFields> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final emailController = TextEditingController();
  dynamic phonecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(11.0),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.red[50]),
                  child: CustomTextFormField(
                    hintText: 'First Name',
                    controller: firstNameController,
                    labelText: 'First Name',
                  ),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.red[50]),
                  child: CustomTextFormField(
                    hintText: 'Last Name',
                    controller: lastNameController,
                    labelText: 'Last Name',
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15), color: Colors.red[50]),
            child: CustomTextFormField(
              hintText: 'Email',
              controller: emailController,
              labelText: 'Email',
            ),
          ),
          SizedBox(
            height: 20,
          ),
          IntlPhoneField(
            decoration: InputDecoration(
              fillColor: Colors.red[50], // Set your desired color here
              filled: true,
              hintText: 'Phone Number',
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(),
              ),
              prefixIcon: Text('+'),
            ),
            initialCountryCode: 'IN',
            onChanged: (phone) {
              setState(() {
                phonecontroller = phone.completeNumber;
              });
            },
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15), color: Colors.red[50]),
            child: CustomTextFormField(
              suffixIcon: Icon(
                Icons.visibility,
                color: Colors.black,
              ),
              obscureText: false,
              labelText: 'Password',
              controller: passwordController,
              hintText: '*******',
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15), color: Colors.red[50]),
            child: CustomTextFormField(
              suffixIcon: Icon(
                Icons.visibility,
                color: Colors.black,
              ),
              obscureText: false,
              hintText: 'Confirm Password',
              controller: confirmPasswordController,
              labelText: 'Confirm Password',
            ),
          ),
          SizedBox(
            height: 10,
          ),
          widget.req
              ? CircularProgressIndicator()
              : Padding(
                  padding:
                      const EdgeInsets.only(top: 15.0, left: 10, right: 10),
                  child: CustomButton(
                    isNetwork: false,
                    isRow: false,
                    borderclr: Color.fromARGB(255, 73, 148, 74),
                    color: Color.fromARGB(255, 82, 144, 83),
                    fontweight: FontWeight.w500,
                    height: 60,
                    name: 'Create Your Account',
                    // onTap: () => customNavPush(context, UserTypeScreen()),

                    onTap: () {
                      SignUpModels models = SignUpModels(
                          role: widget.role,
                          name: (firstNameController.text) +
                              (lastNameController.text),
                          mobileNo: phonecontroller,
                          currency: "INR",
                          email: emailController.text,
                          address: 'address',
                          password: confirmPasswordController.text);
                      BlocProvider.of<AuthBloc>(context)
                          .add(SignUpRequestEvent(user: models));
                    },
                    radius: 30,
                    textclr: Colors.white,
                    textsize: 20,
                  ),
                )
        ],
      ),
    );
  }
}
