import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renttas/main.dart';
import 'package:renttas/presentation/screens/landlord/home/tabs/add_bill/bottomsheets/rent_cycle/rent_cycle.dart';

class RentCyclePaymentRequired extends StatefulWidget {
  const RentCyclePaymentRequired({super.key});

  @override
  State<RentCyclePaymentRequired> createState() =>
      _RentCyclePaymentRequiredState();
}

class _RentCyclePaymentRequiredState extends State<RentCyclePaymentRequired> {
  bool threeplus = false;
  bool fiveplus = false;
  bool sevenplus = false;
  bool tenplus = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 20,
        ),
        Text(
          'Rent Payment Required by',
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
                  paymentRequiredDays = '+3 Days';
                  threeplus = true;
                  fiveplus = false;
                  sevenplus = false;
                  tenplus = false;
                }),
                child: Container(
                  decoration: BoxDecoration(
                      color: threeplus ? contsGreen : Colors.black,
                      borderRadius: BorderRadius.circular(10)),
                  height: 37,
                  width: 75,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        '+3 Days',
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
                  paymentRequiredDays = '+5 Days';
                  fiveplus = true;
                  threeplus = false;
                  sevenplus = false;
                  tenplus = false;
                }),
                child: Container(
                  decoration: BoxDecoration(
                      color: fiveplus ? contsGreen : Colors.black,
                      borderRadius: BorderRadius.circular(10)),
                  height: 37,
                  width: 75,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        '+5 Days',
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
                  paymentRequiredDays = '+ 7 Days';
                  fiveplus = false;
                  threeplus = false;
                  sevenplus = true;
                  tenplus = false;
                }),
                child: Container(
                  decoration: BoxDecoration(
                      color: sevenplus ? contsGreen : Colors.black,
                      borderRadius: BorderRadius.circular(10)),
                  height: 37,
                  width: 75,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        '+7 Days',
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
                  paymentRequiredDays = '+ 10 Days';
                  fiveplus = false;
                  threeplus = false;
                  sevenplus = false;

                  tenplus = true;
                }),
                child: Container(
                  decoration: BoxDecoration(
                      color: tenplus ? contsGreen : Colors.black,
                      borderRadius: BorderRadius.circular(10)),
                  height: 37,
                  width: 75,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        '+10 Days',
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
