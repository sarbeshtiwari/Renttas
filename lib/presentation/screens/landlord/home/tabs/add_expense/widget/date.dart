import 'package:flutter/material.dart';
import 'package:renttas/main.dart';
import 'package:intl/intl.dart';
import 'package:renttas/presentation/screens/landlord/home/tabs/add_expense/expense.dart';
import 'package:renttas/presentation/screens/landlord/home/tabs/add_expense/widget/custom_cart_fields.dart';

class ExpenseDatePickingScren extends StatefulWidget {
  const ExpenseDatePickingScren({super.key});

  @override
  State<ExpenseDatePickingScren> createState() =>
      _ExpenseDatePickingScrenState();
}

class _ExpenseDatePickingScrenState extends State<ExpenseDatePickingScren> {
  @override
  Widget build(BuildContext context) {
    return AddExpenseFields(
      onTap: () async {
        DateTime? newDate = await showDatePicker(
            context: context,
            firstDate: DateTime(1945),
            initialDate: DateTime(2024),
            lastDate: DateTime(2026));
        if (newDate != null) {
          String formattedDate = DateFormat('yyyy-MM-dd').format(newDate);
          setState(() {
            expenseDate.text = formattedDate;
          });
        }
      },
      keyboardType: TextInputType.none,
      controller: expenseDate,
      hitText: 'Expense Date',
      icon: Icon(
        Icons.description,
        color: contsGreen,
      ),
      name: 'Expense Date',
    );
  }
}
