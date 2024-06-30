import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renttas/presentation/screens/landlord/home/tabs/add_bill/bottomsheets/previous_balance/previous_balance.dart';
import 'package:renttas/presentation/screens/landlord/home/tabs/add_bill/bottomsheets/rent_amount/rent.dart';
import 'package:renttas/presentation/screens/landlord/home/tabs/add_bill/widgets/addbutton.dart';

class AddBillMonthlyChargesScreen extends StatefulWidget {
  const AddBillMonthlyChargesScreen({super.key});

  @override
  State<AddBillMonthlyChargesScreen> createState() =>
      _AddBillMonthlyChargesScreenState();
}

class _AddBillMonthlyChargesScreenState
    extends State<AddBillMonthlyChargesScreen> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(microseconds: 1), () {
      setState(() {});
    });
    return Padding(
      padding:
          const EdgeInsets.only(top: 13.0, left: 13, right: 13, bottom: 13),
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
          const SizedBox(
            height: 5,
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
                  Row(
                    children: [
                      Text(
                        'Previous Balance',
                        style: GoogleFonts.inter(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                      const Spacer(),
                      previousBalance.isEmpty
                          ? CustomAddButton(
                              containerWidth: 80,
                              onTap: () => previoubillBottomSheet(context),
                              text: 'Add',
                            )
                          : InkWell(
                              onTap: () => previoubillBottomSheet(context),
                              child: Text(previousBalance)),
                      const SizedBox(
                        width: 5,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 9,
                  ),
                  Row(
                    children: [
                      Text(
                        'Rent Amount',
                        style: GoogleFonts.inter(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                      const Spacer(),
                      rentAmountController.text.isEmpty
                          ? CustomAddButton(
                              containerWidth: 80,
                              onTap: () => rentAmountBottomSheet(context),
                              text: 'Add',
                            )
                          : InkWell(
                              onTap: () => rentAmountBottomSheet(context),
                              child: Text("Added")),
                      const SizedBox(
                        width: 5,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
