import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renttas/main.dart';
import 'package:renttas/presentation/screens/landlord/home/profile/widgets/help.dart';
import 'package:renttas/presentation/screens/landlord/home/profile/widgets/other.dart';
import 'package:renttas/presentation/screens/landlord/home/profile/widgets/user_details.dart';

class TenantProfileScreen extends StatelessWidget {
  const TenantProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 237, 237),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        backgroundColor: contsGreen,
        title: Text(
          'My Account',
          style: GoogleFonts.poppins(
              color: Colors.white, fontWeight: FontWeight.w600),
        ),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(11.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TenantProfileUserDetails(),
              TenantProfileHelpAndSupport(),
              TenantProfileOther()
            ],
          ),
        ),
      ),
    );
  }
}
