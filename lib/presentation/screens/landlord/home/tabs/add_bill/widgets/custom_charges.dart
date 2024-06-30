import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renttas/presentation/screens/landlord/home/tabs/add_bill/custom_charges/charges.dart';
import 'package:renttas/presentation/screens/landlord/home/tabs/add_bill/widgets/addbutton.dart';

class AddBillCustomChargesScreen extends StatefulWidget {
  const AddBillCustomChargesScreen({super.key});

  @override
  State<AddBillCustomChargesScreen> createState() =>
      _AddBillCustomChargesScreenState();
}

class _AddBillCustomChargesScreenState
    extends State<AddBillCustomChargesScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(13.0),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Monthly Fixed Charges',
              style:
                  GoogleFonts.rubik(fontSize: 18, fontWeight: FontWeight.w700),
            ),
          ),
          Card(
              surfaceTintColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              color: Colors.white,
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(11.0),
                child: Column(
                  children: [
                    Row(children: [
                      Text(
                        'Custom Charges',
                        style: GoogleFonts.inter(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                      const Spacer(),
                      waterbillController.text.isEmpty
                          ? CustomAddButton(
                              containerWidth: 80,
                              onTap: () => customChargesBottomSheet(context),
                              text: 'Add',
                            )
                          : InkWell(
                              onTap: () => customChargesBottomSheet(context),
                              child: Text('Addedd')),
                      const SizedBox(
                        width: 5,
                      )
                    ])
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
