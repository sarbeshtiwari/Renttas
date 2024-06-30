import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_launcher_icons/xml_templates.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renttas/application/forgetpassword/forgetpassword_bloc.dart';
import 'package:renttas/domain/models/newpassword/model.dart';
import 'package:renttas/main.dart';
import 'package:renttas/presentation/widgets/alerts/alerts.dart';
import 'package:renttas/presentation/widgets/buttons/custom_button.dart';
import 'package:renttas/presentation/widgets/form_field/form_field.dart';

final resetPasswordController1 = TextEditingController();
final resetPasswordController2 = TextEditingController();
void changePassword(context) {
  bool obsecure1 = false;
  bool obasecure2 = false;
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return DraggableScrollableSheet(
            initialChildSize: 0.6,
            minChildSize: 0.6,
            maxChildSize: 0.8,
            expand: false,
            builder: (context, scrollController) {
              return LayoutBuilder(builder: (context, constraints) {
                final bottomPadding = MediaQuery.of(context).viewInsets.bottom;
                return AnimatedPadding(
                    padding: EdgeInsets.only(bottom: bottomPadding),
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOut,
                    child: BlocBuilder<ForgetpasswordBloc, ForgetpasswordState>(
                        builder: (context, state) {
                      // if (state is ObsecureTextState) {
                      //   obasecure2 = state.obsecureText;
                      //   obsecure1 = state.obsecureText;
                      // }
                      return Container(
                          decoration: BoxDecoration(
                            color: Colors.green[50],
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                            ),
                          ),
                          child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: SingleChildScrollView(
                                  controller: scrollController,
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.only(
                                              left: 170,
                                              right: 170,
                                              top: 8,
                                              bottom: 8),
                                          child: Divider(
                                            color: Colors.black,
                                            thickness: 4,
                                          ),
                                        ),
                                        Text(
                                          'Reset Password',
                                          style: GoogleFonts.poppins(
                                              color: Colors.black,
                                              fontSize: 18),
                                        ),
                                        const SizedBox(
                                          height: 13,
                                        ),
                                        CustomTextFormField(
                                          // onTap: () {
                                          //   BlocProvider.of<AuthBloc>(context)
                                          //       .add(ObsecureTextEvent(
                                          //           obsecure: obsecure1));
                                          // },
                                          obscureText: obsecure1,
                                          suffixIcon: const Icon(
                                            Icons.visibility,
                                            color: Color.fromARGB(
                                                255, 243, 238, 238),
                                          ),
                                          labelColor: const Color.fromARGB(
                                              255, 0, 0, 0),
                                          labelText: "New Password",
                                          hintText: '******',
                                          controller: resetPasswordController2,
                                          hintTextcolor: const Color.fromARGB(
                                              255, 0, 0, 0),
                                          inputTextcolor: const Color.fromARGB(
                                              255, 0, 0, 0),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        CustomTextFormField(
                                          // onTap: () {
                                          //   BlocProvider.of<AuthBloc>(context)
                                          //       .add(ObsecureTextEvent(
                                          //           obsecure: obasecure2));
                                          // },
                                          obscureText: obasecure2,
                                          suffixIcon: const Icon(
                                            Icons.visibility,
                                            color: Color.fromARGB(
                                                255, 243, 238, 238),
                                          ),
                                          labelColor: const Color.fromARGB(
                                              255, 0, 0, 0),
                                          labelText: "Confirm New Password",
                                          hintText: '******',
                                          controller: resetPasswordController1,
                                          hintTextcolor: const Color.fromARGB(
                                              255, 0, 0, 0),
                                          inputTextcolor: const Color.fromARGB(
                                              255, 0, 0, 0),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(11.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              CustomButton(
                                                isNetwork: false,
                                                isRow: false,
                                                borderclr: Colors.blueGrey,
                                                color: const Color.fromARGB(
                                                    255, 3, 1, 9),
                                                height: 50,
                                                fontweight: FontWeight.w500,
                                                radius: 10,
                                                textclr: Colors.white,
                                                name: 'Cancel',
                                                onTap: () {
                                                  Navigator.pop(context);
                                                },
                                                textsize: 20,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    2.5,
                                              ),
                                              const SizedBox(
                                                width: 11,
                                              ),
                                              CustomButton(
                                                isNetwork: false,
                                                isRow: false,
                                                borderclr: Colors.blueGrey,
                                                color: contsGreen,
                                                height: 50,
                                                fontweight: FontWeight.w500,
                                                radius: 10,
                                                textclr: Colors.white,
                                                name: 'Reset Password',
                                                onTap: () {
                                                  if (resetPasswordController1
                                                          .text ==
                                                      resetPasswordController2
                                                          .text) {
                                                    NewPasswordModel model =
                                                        NewPasswordModel(
                                                            newpassword:
                                                                resetPasswordController1
                                                                    .text,
                                                            conformPassword:
                                                                resetPasswordController2
                                                                    .text);

                                                    BlocProvider.of<
                                                                ForgetpasswordBloc>(
                                                            context)
                                                        .add(
                                                            ResetPasswordRequest(
                                                                model: model));
                                                  } else {
                                                    alerts(
                                                        context, 'Worng input');
                                                  }
                                                },
                                                textsize: 18,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    2.5,
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Container(
                                          clipBehavior: Clip.antiAlias,
                                          height: 80,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          child: Image.asset(
                                            'assets/images/rateapp.png',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ]))));
                    }));
              });
            });
      });
}
