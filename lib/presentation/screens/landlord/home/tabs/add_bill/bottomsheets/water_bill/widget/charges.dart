import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renttas/presentation/screens/landlord/home/tabs/add_bill/bottomsheets/water_bill/water_bill.dart';

class WaterBillChargesScreen extends StatefulWidget {
  const WaterBillChargesScreen({super.key});

  @override
  State<WaterBillChargesScreen> createState() => _WaterBillChargesScreenState();
}

class _WaterBillChargesScreenState extends State<WaterBillChargesScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            setState(() {
              waterBill = 'Government/Company Metered';
              Navigator.pop(context);
            });
          },
          child: Card(
            surfaceTintColor: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Government/Company Metered',
                        style: GoogleFonts.urbanist(
                            fontSize: 16, fontWeight: FontWeight.w800),
                      ),
                      const Spacer(),
                      const Icon(Icons.double_arrow_rounded)
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Tenants directly pay null bill',
                    style: GoogleFonts.poppins(
                        color: Colors.black54,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text('to Government/Company',
                      style: GoogleFonts.poppins(
                          color: Colors.black54,
                          fontSize: 14,
                          fontWeight: FontWeight.w500))
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 3,
        ),
        InkWell(
          onTap: () {
            setState(() {
              waterBill = 'Fixed Charges';
              Navigator.pop(context);
            });
          },
          child: Card(
            surfaceTintColor: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Fixed Charges',
                        style: GoogleFonts.urbanist(
                            fontSize: 16, fontWeight: FontWeight.w800),
                      ),
                      const Spacer(),
                      const Icon(Icons.double_arrow_rounded)
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    'You charge a fixed amount',
                    style: GoogleFonts.poppins(
                        color: Colors.black54,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text('to Government/Company',
                      style: GoogleFonts.poppins(
                          color: Colors.black54,
                          fontSize: 14,
                          fontWeight: FontWeight.w500))
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 3,
        ),
        InkWell(
          onTap: () {
            setState(() {
              waterBill = "No charges";
              Navigator.pop(context);
            });
          },
          child: Card(
            surfaceTintColor: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'No Charges',
                        style: GoogleFonts.urbanist(
                            fontSize: 16, fontWeight: FontWeight.w800),
                      ),
                      const Spacer(),
                      const Icon(Icons.double_arrow_rounded)
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'You Do Not charge',
                    style: GoogleFonts.poppins(
                        color: Colors.black54,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text('to Government/Company',
                      style: GoogleFonts.poppins(
                          color: Colors.black54,
                          fontSize: 14,
                          fontWeight: FontWeight.w500))
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
      ],
    );
  }
}
