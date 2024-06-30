import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renttas/main.dart';

// ignore: must_be_immutable
class PremiumMoneyContainer extends StatelessWidget {
  PremiumMoneyContainer(
      {super.key,
      required this.currentPrize,
      required this.oldPrize,
      required this.validFor,
      this.onTap,
      required this.selected});
  final String currentPrize;
  final String oldPrize;
  final String validFor;
  final Function()? onTap;
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: selected ? Colors.green[50] : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                color: selected ? contsGreen : Colors.black,
                width: selected ? 4 : 1.5)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '₹$currentPrize',
                    style: GoogleFonts.poppins(
                        fontSize: 27, fontWeight: FontWeight.w800),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Stack(
                    children: [
                      LayoutBuilder(
                        builder: (context, constraints) {
                          return Text(
                            '₹$oldPrize',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                              color: const Color.fromARGB(255, 94, 93, 93),
                              fontSize: 15.5,
                            ),
                          );
                        },
                      ),
                      Positioned.fill(
                        child: Align(
                          alignment: Alignment.center,
                          child: Container(
                              margin: const EdgeInsets.symmetric(vertical: 5),
                              height: 1,
                              color: const Color.fromARGB(255, 94, 93, 93)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Text(
                validFor,
                style: GoogleFonts.urbanist(
                    fontSize: 19, fontWeight: FontWeight.w700),
              )
            ],
          ),
        ),
      ),
    );
  }
}
