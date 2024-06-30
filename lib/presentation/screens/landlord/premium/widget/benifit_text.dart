import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class YourBenifitsCustomText extends StatelessWidget {
  const YourBenifitsCustomText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            'What you will get',
            style: GoogleFonts.rubik(fontSize: 20, fontWeight: FontWeight.w700),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            const Icon(Icons.check, color: Colors.green, size: 30),
            const SizedBox(
              width: 6,
            ),
            Text(
              'SMS & Email update to Tenant',
              style: GoogleFonts.rubik(fontSize: 13),
            )
          ],
        ),
        Row(
          children: [
            const Icon(Icons.check, color: Colors.green, size: 30),
            const SizedBox(
              width: 6,
            ),
            Text(
              'Auto Rent Reminders to Tenants via SMS & Email',
              style: GoogleFonts.rubik(fontSize: 13),
            )
          ],
        ),
        Row(
          children: [
            const Icon(Icons.check, color: Colors.green, size: 30),
            const SizedBox(
              width: 6,
            ),
            Text(
              'Priority On-Call Support',
              style: GoogleFonts.rubik(fontSize: 13),
            )
          ],
        ),
      ],
    );
  }
}
