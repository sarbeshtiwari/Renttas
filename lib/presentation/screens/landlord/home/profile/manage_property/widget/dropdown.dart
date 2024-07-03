// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ManageDropDownFields extends StatefulWidget {
  const ManageDropDownFields({
    super.key,
    required this.name,
    required this.hintText,
    required this.icon,
    required this.items,
    required this.period,
    this.onTap,
  });

  final bool period;
  final String hintText;
  final String name;
  final Icon icon;
  final List<String> items;
  final Function(String)? onTap;

  @override
  _ManageDropDownFieldsState createState() => _ManageDropDownFieldsState();
}

class _ManageDropDownFieldsState extends State<ManageDropDownFields> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 6,
        ),
        Text(
          widget.name,
          style: GoogleFonts.urbanist(
            fontSize: 20,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(
          height: 6,
        ),
        Card(
          color: const Color.fromARGB(255, 255, 255, 255),
          surfaceTintColor: const Color.fromARGB(255, 255, 255, 255),
          elevation: 0,
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: DropdownButtonFormField<String>(
              value: selectedValue,
              onChanged: (String? newValue) {
                setState(() {
                  selectedValue = newValue;
                });
                if (widget.onTap != null && newValue != null) {
                  widget.onTap!(newValue);
                }
              },
              items: widget.items.map((String item) {
                return DropdownMenuItem<String>(
                  value: item,
                  child: Text(item),
                );
              }).toList(),
              decoration: InputDecoration(
                hintText: widget.hintText,
                border: UnderlineInputBorder(),
                prefixIcon: widget.icon,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
