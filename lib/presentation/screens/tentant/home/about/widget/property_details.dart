import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PropertyDetailsTenantHome extends StatelessWidget {
  const PropertyDetailsTenantHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Property Details :',
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
                  'Property Name',
                  style: GoogleFonts.poppins(
                      fontSize: 16, fontWeight: FontWeight.w500),
                )),
                Expanded(
                    child: Text(
                  'lasjldfjslf',
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
                  'Flat Name',
                  style: GoogleFonts.poppins(
                      fontSize: 16, fontWeight: FontWeight.w500),
                )),
                Expanded(
                    child: Text(
                  'lasjldfjslf',
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
                  'Address',
                  style: GoogleFonts.poppins(
                      fontSize: 16, fontWeight: FontWeight.w500),
                )),
                Expanded(
                    child: Text(
                  'lasjldfjslf',
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
