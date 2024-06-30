import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renttas/main.dart';
import 'package:renttas/presentation/screens/tentant/home/profile/widget/others.dart';
import 'package:renttas/presentation/screens/tentant/home/profile/widget/user_details.dart';

class TenantHomeProfileScreen extends StatelessWidget {
  const TenantHomeProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 237, 237),
      appBar: AppBar(
        backgroundColor: contsGreen,
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
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
            children: [TenantUserDetailsProfileScreen(), OthersProfileTenant()],
          ),
        ),
      ),
    );
  }
}
