import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renttas/presentation/screens/landlord/home/profile/language/language.dart';
import 'package:renttas/presentation/screens/landlord/home/profile/manage_property/manage.dart';
import 'package:renttas/presentation/widgets/navigators/navs.dart';

class TenantProfileHelpAndSupport extends StatelessWidget {
  const TenantProfileHelpAndSupport({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 5, bottom: 5),
            child: Text(
              'Help & Support :-',
              style: GoogleFonts.poppins(
                  fontSize: 18, fontWeight: FontWeight.w700),
            ),
          ),
          Card(
            surfaceTintColor: Colors.white,
            child: Column(
              children: [
                ListTile(
                  onTap: () => customNavPush(context, LanguageChooseScreen()),
                  leading: const Icon(Icons.language),
                  title: Text(
                    'Choose language',
                    style: GoogleFonts.rubik(
                        fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                ),
                ListTile(
                  onTap: () =>
                      customNavPush(context, const ProfileManageProperty()),
                  leading: const Icon(Icons.merge),
                  title: Text(
                    'Manage Property',
                    style: GoogleFonts.rubik(
                        fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.message),
                  title: Text(
                    'Live Chat',
                    style: GoogleFonts.rubik(
                        fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
