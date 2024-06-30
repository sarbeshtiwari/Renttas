import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renttas/presentation/screens/auth/sign_in/signin.dart';
import 'package:renttas/presentation/screens/landlord/home/profile/rate_app.dart/rate.dart';
import 'package:renttas/presentation/screens/landlord/home/profile/widgets/other.dart';
import 'package:renttas/presentation/widgets/alerts/alerts.dart';
import 'package:renttas/presentation/widgets/navigators/navs.dart';
import 'package:url_launcher/url_launcher.dart';

class OthersProfileTenant extends StatelessWidget {
  const OthersProfileTenant({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10.0, top: 5, bottom: 5),
          child: Text(
            'Others :-',
            style:
                GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w700),
          ),
        ),
        Card(
          surfaceTintColor: Colors.white,
          child: Column(
            children: [
              ListTile(
                leading: const Icon(Icons.message),
                title: Text(
                  'Live Chat',
                  style: GoogleFonts.rubik(
                      fontSize: 14, fontWeight: FontWeight.w500),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.email),
                title: Text(
                  'Share App',
                  style: GoogleFonts.rubik(
                      fontSize: 14, fontWeight: FontWeight.w500),
                ),
              ),
              ListTile(
                onTap: () => rateApp(context),
                leading: const Icon(Icons.star),
                title: Text(
                  'About US',
                  style: GoogleFonts.rubik(
                      fontSize: 14, fontWeight: FontWeight.w500),
                ),
              ),
              ListTile(
                onTap: () => termsConditions(),
                leading: const Icon(Icons.phone),
                title: Text(
                  'Terms & Conditions',
                  style: GoogleFonts.rubik(
                      fontSize: 14, fontWeight: FontWeight.w500),
                ),
              ),
              ListTile(
                onTap: () => termsConditions(),
                leading: const Icon(Icons.privacy_tip),
                title: Text(
                  'Privacy Policy',
                  style: GoogleFonts.rubik(
                      fontSize: 14, fontWeight: FontWeight.w500),
                ),
              ),
              ListTile(
                onTap: () => alertsWithButtons(
                    context, 'Are you sure want to logout?', () {
                  clearLoginInfo();
                  customNavRemoveuntil(context, SignInScreen());
                }, 'Confirmation'),
                leading: const Icon(
                  Icons.logout,
                  color: Colors.red,
                ),
                title: Text(
                  'Logout',
                  style: GoogleFonts.rubik(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.red),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  termsConditions() async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
