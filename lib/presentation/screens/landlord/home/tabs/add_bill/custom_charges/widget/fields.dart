import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:renttas/main.dart';
import 'package:renttas/presentation/screens/landlord/home/tabs/add_expense/widget/custom_cart_fields.dart';

class CustomRentScreenAddBill extends StatelessWidget {
  CustomRentScreenAddBill(
      {required this.valueController,
      required this.waterbillController,
      super.key});
  TextEditingController waterbillController = TextEditingController();
  TextEditingController valueController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: AddExpenseFields(
            keyboardType: TextInputType.name,
            controller: waterbillController,
            hitText: 'Ex: Water...',
            icon: Icon(
              Icons.water_drop_rounded,
              color: contsGreen,
            ),
            name: 'Ex: Water bill*',
          ),
        ),
        Expanded(
          child: AddExpenseFields(
            keyboardType: TextInputType.name,
            controller: valueController,
            hitText: 'Ex: Value...',
            icon: Icon(
              Icons.category,
              color: contsGreen,
            ),
            name: 'Ex: Value(00.0)*',
          ),
        ),
      ],
    );
  }
}
