import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renttas/domain/models/user_model/model.dart';
import 'package:renttas/main.dart';
import 'package:renttas/presentation/screens/tentant/home/profile/profile.dart';
import 'package:renttas/presentation/widgets/navigators/navs.dart';

class TenantappBar extends StatelessWidget {
  const TenantappBar({super.key});
  String _getInitials(String name) {
    List<String> parts = name.split(' ');
    if (parts.length >= 2) {
      String firstName = parts[0];
      String lastName = parts[parts.length - 1];
      return '${firstName[0]}${lastName[0]}'.toUpperCase();
    } else if (parts.length == 1) {
      return '${parts[0][0]}'.toUpperCase();
    } else {
      return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    String initials = userModel != null ? _getInitials(userModel!.name) : '';
    // getUserModel();
    return AppBar(
      backgroundColor: contsGreen,
      title: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          children: [
            InkWell(
              onTap: () =>
                  customNavPush(context, const TenantHomeProfileScreen()),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(initials),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              'Welcome',
              style: GoogleFonts.inter(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
            const SizedBox(
              width: 5,
            ),
            Text(userModel?.name ?? 'USER NAME',
                style: GoogleFonts.poppins(
                    fontSize: 21,
                    fontWeight: FontWeight.w600,
                    color: Colors.white))
          ],
        ),
      ),
    );
  }
}
