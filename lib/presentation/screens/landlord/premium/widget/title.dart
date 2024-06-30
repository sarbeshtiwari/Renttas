import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PremiumTitles extends StatelessWidget {
  const PremiumTitles({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        Text('Get More Features',
            style: GoogleFonts.poppins(
                fontSize: 25,
                color: Colors.black,
                fontWeight: FontWeight.w600)),
        Text('Currnet plan : Free Forever',
            style: GoogleFonts.poppins(
                fontSize: 14,
                color: Colors.black,
                fontWeight: FontWeight.w600)),
        const SizedBox(
          height: 22,
        ),
        const Divider(),
        const SizedBox(
          height: 12,
        ),
      ],
    );
  }
}
