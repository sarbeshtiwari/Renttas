import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TenantAboutRentDetails extends StatelessWidget {
  const TenantAboutRentDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Rent Details :',
            style:
                GoogleFonts.urbanist(fontSize: 20, fontWeight: FontWeight.w800),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                    child: Text(
                  'Rent',
                  style: GoogleFonts.poppins(
                      fontSize: 16, fontWeight: FontWeight.w500),
                )),
                Expanded(
                    child: Text(
                  '₹ 2000.0',
                  style: GoogleFonts.poppins(
                      fontSize: 16, fontWeight: FontWeight.w500),
                ))
              ],
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                    child: Text(
                  'Maintenance ',
                  style: GoogleFonts.poppins(
                      fontSize: 16, fontWeight: FontWeight.w500),
                )),
                Expanded(
                    child: Text(
                  '₹ 1000.0',
                  style: GoogleFonts.poppins(
                      fontSize: 16, fontWeight: FontWeight.w500),
                ))
              ],
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                    child: Text(
                  'Rent Cycle',
                  style: GoogleFonts.poppins(
                      fontSize: 16, fontWeight: FontWeight.w500),
                )),
                Expanded(
                    child: Text(
                  'Monthly',
                  style: GoogleFonts.poppins(
                      fontSize: 16, fontWeight: FontWeight.w500),
                ))
              ],
            ),
          ),
          const Divider(),
          const SizedBox(
            height: 5,
          )
        ],
      ),
    );
  }
}
