import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renttas/main.dart';

class AddBillCustomFloatingButton extends StatelessWidget {
  const AddBillCustomFloatingButton({super.key, this.ontap});
  final Function()? ontap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40, right: 13, bottom: 6, top: 6),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: GestureDetector(
          onTap: ontap,
          child: Container(
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: contsGreen),
            child: Align(
              alignment: Alignment.center,
              child: Text('Save',
                  style: GoogleFonts.urbanist(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 16)),
            ),
          ),
        ),
      ),
    );
  }
}
