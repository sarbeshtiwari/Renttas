// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:renttas/main.dart';
import 'package:renttas/presentation/screens/landlord/home/tabs/add_expense/widget/custom_cart_fields.dart';

class AddDocumentCustomFields extends StatelessWidget {
  AddDocumentCustomFields(
      {required this.documentnameController,
      required this.descriptionController,
      super.key});
  TextEditingController documentnameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AddExpenseFields(
          keyboardType: TextInputType.name,
          controller: documentnameController,
          hitText: 'Document name',
          icon: Icon(
            Icons.description,
            color: contsGreen,
          ),
          name: 'Document name',
        ),
        AddExpenseFields(
          keyboardType: TextInputType.name,
          controller: descriptionController,
          hitText: 'Description',
          icon: Icon(
            Icons.description,
            color: contsGreen,
          ),
          name: 'Description',
        ),
        const SizedBox(
          height: 40,
        ),
      ],
    );
  }
}
