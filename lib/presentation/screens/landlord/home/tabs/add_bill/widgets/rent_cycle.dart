import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renttas/presentation/screens/landlord/home/tabs/add_bill/bottomsheets/rent_cycle/rent_cycle.dart';
import 'package:renttas/presentation/screens/landlord/home/tabs/add_bill/widgets/addbutton.dart';

String rentCycle = '';

class AddbillRentCycle extends StatefulWidget {
  const AddbillRentCycle({super.key});

  @override
  State<AddbillRentCycle> createState() => _AddbillRentCycleState();
}

class _AddbillRentCycleState extends State<AddbillRentCycle> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(microseconds: 1), () {
      setState(() {});
    });
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Text(
          'When Do You Collect Rent',
          style: GoogleFonts.rubik(fontSize: 18, fontWeight: FontWeight.w700),
        ),
        Padding(
          padding: const EdgeInsets.all(11.0),
          child: Card(
            surfaceTintColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            color: Colors.white,
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(11.0),
              child: Row(
                children: [
                  Text(
                    'Rent Cycle',
                    style: GoogleFonts.inter(
                        fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                  const Spacer(),
                  rentCycle.isEmpty
                      ? CustomAddButton(
                          containerWidth: 80,
                          onTap: () {
                            rentCycleBottomSheet(context);
                          },
                          text: 'Add',
                        )
                      : InkWell(
                          onTap: () {
                            rentCycleBottomSheet(context);
                          },
                          child: Text(rentCycle)),
                  const SizedBox(
                    width: 5,
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
