// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renttas/presentation/screens/user_type/widgets/custom_types.dart';

class UserTypeScreen extends StatelessWidget {
  const UserTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Select User Type',
                style: GoogleFonts.rubik(
                    fontSize: 35, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 60,
              ),
              CustomTypesContainer()
            ],
          ),
        ),
      ),
    );
  }
}
