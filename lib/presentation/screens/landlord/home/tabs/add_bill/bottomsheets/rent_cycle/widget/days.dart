import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renttas/main.dart';
import 'package:renttas/presentation/screens/landlord/home/tabs/add_bill/bottomsheets/rent_cycle/rent_cycle.dart';

class RentCycleDaysForMonth extends StatefulWidget {
  const RentCycleDaysForMonth({super.key});

  @override
  State<RentCycleDaysForMonth> createState() => _RentCycleDaysForMonthState();
}

class _RentCycleDaysForMonthState extends State<RentCycleDaysForMonth> {
  bool oneday = false;
  bool twoday = false;
  bool threeday = false;
  bool fourday = false;
  bool fiveday = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 20,
        ),
        Text(
          'Payment Day for the Month Rent Cycle',
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
                  dayfortheMounth = '1 Days';
                  oneday = true;
                  twoday = false;
                  fiveday = false;
                  threeday = false;
                  fourday = false;
                }),
                child: Container(
                  decoration: BoxDecoration(
                      color: oneday ? contsGreen : Colors.black,
                      borderRadius: BorderRadius.circular(10)),
                  height: 37,
                  width: 85,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        '1 Days',
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
                  dayfortheMounth = '2 Days';
                  twoday = true;
                  oneday = false;
                  threeday = false;
                  fourday = false;
                  fiveday = false;
                }),
                child: Container(
                  decoration: BoxDecoration(
                      color: twoday ? contsGreen : Colors.black,
                      borderRadius: BorderRadius.circular(10)),
                  height: 37,
                  width: 85,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        '2 Days',
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
                  dayfortheMounth = '3 Days';
                  twoday = false;
                  oneday = false;
                  threeday = true;
                  fourday = false;
                  fiveday = false;
                }),
                child: Container(
                  decoration: BoxDecoration(
                      color: threeday ? contsGreen : Colors.black,
                      borderRadius: BorderRadius.circular(10)),
                  height: 37,
                  width: 85,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        '3 Days',
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
                  dayfortheMounth = '4 Days';
                  twoday = false;
                  oneday = false;
                  threeday = false;
                  fiveday = false;
                  fourday = true;
                }),
                child: Container(
                  decoration: BoxDecoration(
                      color: fourday ? contsGreen : Colors.black,
                      borderRadius: BorderRadius.circular(10)),
                  height: 37,
                  width: 85,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        '4 Days',
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
                  dayfortheMounth = '5 Days';
                  twoday = false;
                  oneday = false;
                  threeday = false;
                  fiveday = true;
                  fourday = false;
                }),
                child: Container(
                  decoration: BoxDecoration(
                      color: fiveday ? contsGreen : Colors.black,
                      borderRadius: BorderRadius.circular(10)),
                  height: 37,
                  width: 85,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        '5 Days',
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
