import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renttas/main.dart';

void alerts(context, String msg) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(content: Text(msg), actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: Text('ok'))
        ]);
      });
}

void alertsWithButtons(context, String msg, Function function, String title) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        surfaceTintColor: Colors.white,
        title: Text(
          title,
          style:
              GoogleFonts.urbanist(fontSize: 20, fontWeight: FontWeight.w800),
        ),
        content: Text(
          msg,
          style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w500),
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                'No',
                style: GoogleFonts.poppins(
                    color: contsGreen,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              )),
          TextButton(
              onPressed: () {
                function();
              },
              child: Text(
                'Continue',
                style: GoogleFonts.poppins(
                    color: contsGreen,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ))
        ],
      );
    },
  );
}
