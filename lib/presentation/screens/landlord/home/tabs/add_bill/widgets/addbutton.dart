import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAddButton extends StatelessWidget {
  const CustomAddButton(
      {super.key,
      this.onTap,
      required this.text,
      required this.containerWidth});
  final Function()? onTap;
  final String text;
  final double? containerWidth;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          height: 35,
          width: containerWidth,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.black)),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Icon(
              Icons.add,
              size: 20,
              color: Color.fromARGB(255, 82, 144, 83),
            ),
            Text(
              text,
              style: GoogleFonts.poppins(
                  fontSize: 13, color: Color.fromARGB(255, 82, 144, 83)),
            ),
          ])),
    );
  }
}
