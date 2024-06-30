import 'package:flutter/material.dart';
import 'package:renttas/presentation/screens/landlord/home/profile/manage_property/widget/dropdown.dart';

class CustomDropDownFields extends StatelessWidget {
  const CustomDropDownFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ManageDropDownFields(
            period: false,
            name: 'Property/Unit',
            hintText: 'All Properties',
            icon: const Icon(Icons.home),
            // keyboardType: keyboardType,
            items: const ['1', '2']),
        const SizedBox(
          height: 8,
        ),
        ManageDropDownFields(
            period: true,
            name: 'Selected Period',
            hintText: 'Selected Period',
            icon: const Icon(Icons.watch_later_outlined),
            // keyboardType: keyboardType,
            items: const ['1', '2']),
        const SizedBox(
          height: 14,
        ),
      ],
    );
  }
}
