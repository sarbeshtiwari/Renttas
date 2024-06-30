import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renttas/domain/models/user_model/model.dart';

class TenantProfileUserDetails extends StatelessWidget {
  const TenantProfileUserDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10.0, top: 5, bottom: 5),
          child: Text(
            'User Detail :-',
            style:
                GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w700),
          ),
        ),
        Card(
          surfaceTintColor: Colors.white,
          child: Column(
            children: [
              ListTile(
                leading: const Icon(Icons.person),
                title: Text(
                  userModel?.name ?? 'username',
                  style: GoogleFonts.rubik(
                      fontSize: 14, fontWeight: FontWeight.w500),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.email),
                title: Text(
                  userModel?.email ?? 'username@gmail.com',
                  style: GoogleFonts.rubik(
                      fontSize: 14, fontWeight: FontWeight.w500),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.phone),
                title: Text(
                  userModel?.mobileNo ?? '+91*********',
                  style: GoogleFonts.rubik(
                      fontSize: 14, fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
