// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:renttas/main.dart';
import 'package:renttas/presentation/screens/landlord/home/tabs/add_expense/widget/custom_cart_fields.dart';
import 'package:renttas/presentation/screens/landlord/home/tabs/add_expense/widget/date.dart';

class AddExpenseFields2 extends StatelessWidget {
  AddExpenseFields2(
      {required this.amountController,
      required this.categoryController,
      required this.descriptionController,
      required this.nameController,
      super.key});
  TextEditingController categoryController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AddExpenseFields(
          keyboardType: TextInputType.name,
          controller: categoryController,
          hitText: 'Category',
          icon: Icon(
            Icons.category,
            color: contsGreen,
          ),
          name: 'Category',
        ),
        AddExpenseFields(
          keyboardType: TextInputType.name,
          controller: nameController,
          hitText: 'Name',
          icon: Icon(
            Icons.person,
            color: contsGreen,
          ),
          name: 'Name',
        ),
        AddExpenseFields(
          keyboardType: TextInputType.number,
          controller: amountController,
          hitText: 'Amount',
          icon: Icon(
            Icons.attach_money_sharp,
            color: contsGreen,
          ),
          name: 'Amount',
        ),
        const ExpenseDatePickingScren(),
        AddExpenseFields(
          keyboardType: TextInputType.name,
          controller: descriptionController,
          hitText: 'Description',
          icon: Icon(
            Icons.description,
            color: contsGreen,
          ),
          name: 'Description',
        )
      ],
    );
  }
}
