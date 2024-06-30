import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:renttas/main.dart';
import 'package:renttas/presentation/screens/landlord/home/tabs/add_expense/widget/custom_cart_fields.dart';
import 'package:renttas/presentation/screens/landlord/home/tabs/add_tenant/add_tenant.dart';

class AddTenantsDatesScreen extends StatefulWidget {
  const AddTenantsDatesScreen({super.key});

  @override
  State<AddTenantsDatesScreen> createState() => _AddTenantsDatesScreenState();
}

class _AddTenantsDatesScreenState extends State<AddTenantsDatesScreen> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: AddExpenseFields(
          onTap: () async {
            DateTime? newDate = await showDatePicker(
                context: context,
                firstDate: DateTime(1945),
                initialDate: DateTime(2024),
                lastDate: DateTime(2026));
            if (newDate != null) {
              String formattedDate = DateFormat('yyyy-MM-dd').format(newDate);
              setState(() {
                addTenantstartDate.text = formattedDate;
              });
            }
          },
          keyboardType: TextInputType.none,
          controller: addTenantstartDate,
          hitText: 'Start',
          icon: Icon(
            Icons.calendar_month,
            color: contsGreen,
          ),
          name: 'Start - End Date',
        )),
        Expanded(
            child: AddExpenseFields(
          onTap: () async {
            DateTime? newDate = await showDatePicker(
                context: context,
                firstDate: DateTime(1945),
                initialDate: DateTime(2024),
                lastDate: DateTime(2026));
            if (newDate != null) {
              String formattedDate = DateFormat('yyyy-MM-dd').format(newDate);
              setState(() {
                addTenantendDate.text = formattedDate;
              });
            }
          },
          keyboardType: TextInputType.none,
          controller: addTenantendDate,
          hitText: 'End',
          icon: Icon(
            Icons.calendar_month,
            color: contsGreen,
          ),
          name: '',
        ))
      ],
    );
  }
}
