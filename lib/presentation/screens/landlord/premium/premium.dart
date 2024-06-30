import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renttas/main.dart';
import 'package:renttas/presentation/screens/landlord/premium/widget/benifit_text.dart';
import 'package:renttas/presentation/screens/landlord/premium/widget/money.dart';
import 'package:renttas/presentation/screens/landlord/premium/widget/money_containers.dart';
import 'package:renttas/presentation/screens/landlord/premium/widget/title.dart';
import 'package:renttas/presentation/widgets/buttons/custom_button.dart';
import 'package:renttas/presentation/widgets/navigators/navs.dart';

class PremiumUpgradingScreen extends StatefulWidget {
  const PremiumUpgradingScreen({super.key});

  @override
  State<PremiumUpgradingScreen> createState() => _PremiumUpgradingScreenState();
}

class _PremiumUpgradingScreenState extends State<PremiumUpgradingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        backgroundColor: contsGreen,
        title: Text(
          'Upgrade to Premium',
          style: GoogleFonts.poppins(
              color: Colors.white, fontWeight: FontWeight.w600),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const PremiumTitles(),
              const MoneyCustomContainers(),
              const YourBenifitsCustomText(),
              Padding(
                padding: const EdgeInsets.only(top: 29.0, left: 11, right: 11),
                child: CustomButton(
                  isNetwork: false,
                  isRow: false,
                  borderclr: const Color.fromARGB(255, 73, 148, 74),
                  color: const Color.fromARGB(255, 82, 144, 83),
                  fontweight: FontWeight.w500,
                  height: 50,
                  name: 'Subscribe',
                  onTap: () => customNavPush(context, () {}),
                  radius: 10,
                  textclr: Colors.white,
                  textsize: 20,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
