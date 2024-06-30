import 'package:flutter/material.dart';
import 'package:renttas/presentation/screens/tentant/home/about/widget/electricity.dart';
import 'package:renttas/presentation/screens/tentant/home/about/widget/owner_details.dart';
import 'package:renttas/presentation/screens/tentant/home/about/widget/property_details.dart';
import 'package:renttas/presentation/screens/tentant/home/about/widget/rent_details.dart';

class AboutDetailsTenant extends StatelessWidget {
  const AboutDetailsTenant({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            PropertyDetailsTenantHome(),
            TenantAboutOwnerDetails(),
            TenantAboutRentDetails(),
            TenantAboutElectricityDetails()
          ],
        ),
      ),
    );
  }
}
