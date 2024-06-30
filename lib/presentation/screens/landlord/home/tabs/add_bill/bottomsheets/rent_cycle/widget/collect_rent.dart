import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renttas/main.dart';
import 'package:renttas/presentation/screens/landlord/home/tabs/add_bill/bottomsheets/rent_cycle/rent_cycle.dart';
import 'package:renttas/presentation/screens/landlord/home/tabs/add_bill/widgets/rent_cycle.dart';

class CollectRentCycle extends StatefulWidget {
  const CollectRentCycle({
    super.key,
  });

  @override
  State<CollectRentCycle> createState() => _CollectRentCycleState();
}

class _CollectRentCycleState extends State<CollectRentCycle> {
  bool monthly = false;
  bool quarterly = false;
  bool halfyearly = false;
  bool annually = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 20,
        ),
        Text(
          'When do you collect rent',
          style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w400),
        ),
        const SizedBox(
          height: 20,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              InkWell(
                onTap: () => setState(() {
                  rentCycle = "Monthly";
                  collectRent = 'Monthly';
                  monthly = true;
                  quarterly = false;
                  halfyearly = false;
                  annually = false;
                }),
                child: Container(
                  decoration: BoxDecoration(
                      color: monthly ? contsGreen : Colors.black,
                      borderRadius: BorderRadius.circular(10)),
                  height: 37,
                  width: 100,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Monthly',
                        style: GoogleFonts.urbanist(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 13,
              ),
              InkWell(
                onTap: () => setState(() {
                  rentCycle = "Quarterly";
                  collectRent = 'Quarterly';
                  quarterly = true;
                  monthly = false;
                  halfyearly = false;
                  annually = false;
                }),
                child: Container(
                  decoration: BoxDecoration(
                      color: quarterly ? contsGreen : Colors.black,
                      borderRadius: BorderRadius.circular(10)),
                  height: 37,
                  width: 100,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Quarterly',
                        style: GoogleFonts.urbanist(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 13,
              ),
              InkWell(
                onTap: () => setState(() {
                  collectRent = 'Half Yearly';
                  rentCycle = "Half Yearly";
                  quarterly = false;
                  monthly = false;
                  halfyearly = true;
                  annually = false;
                }),
                child: Container(
                  decoration: BoxDecoration(
                      color: halfyearly ? contsGreen : Colors.black,
                      borderRadius: BorderRadius.circular(10)),
                  height: 37,
                  width: 100,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Half Yearly',
                        style: GoogleFonts.urbanist(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 13,
              ),
              InkWell(
                onTap: () => setState(() {
                  rentCycle = "Annually";
                  collectRent = 'Annually';
                  quarterly = false;
                  monthly = false;
                  annually = true;
                }),
                child: Container(
                  decoration: BoxDecoration(
                      color: annually ? contsGreen : Colors.black,
                      borderRadius: BorderRadius.circular(10)),
                  height: 37,
                  width: 100,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Annually',
                        style: GoogleFonts.urbanist(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
