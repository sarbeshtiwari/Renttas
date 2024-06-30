// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class ForgetEmailField extends StatelessWidget {
  ForgetEmailField(
      {required this.controller,
      super.key,
      required this.hitText,
      required this.icon,
      this.onTap,
      required this.keyboardType});
  TextEditingController controller = TextEditingController();
  final String hitText;
  final Function()? onTap;
  final TextInputType keyboardType;
  Icon icon;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
            color: Colors.pink[50],
            surfaceTintColor: Colors.pink[50],
            elevation: 0,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: TextField(
                onTapOutside: (event) {
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                onTap: onTap,
                keyboardType: keyboardType,
                controller: controller,
                decoration: InputDecoration(
                  hintText: '  $hitText',
                  border: InputBorder.none,
                  // prefixIcon: icon,
                ),
              ),
            )),
      ],
    );
  }
}
