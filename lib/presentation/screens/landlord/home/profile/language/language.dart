import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renttas/main.dart';
import 'package:renttas/presentation/screens/landlord/home/profile/language/widgets/fields.dart';
import 'package:renttas/presentation/screens/landlord/home/tabs/add_bill/widgets/floating_button.dart';

class LanguageChooseScreen extends StatelessWidget {
  const LanguageChooseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: AddBillCustomFloatingButton(
          ontap: () {},
        ),
        appBar: AppBar(
          backgroundColor: contsGreen,
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
          title: Text(
            'Choose Language',
            style: GoogleFonts.rubik(color: Colors.white),
          ),
        ),
        body: const LanguageFields());
  }
}
