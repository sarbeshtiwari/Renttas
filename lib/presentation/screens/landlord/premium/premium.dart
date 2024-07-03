import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renttas/main.dart';
import 'package:renttas/presentation/screens/landlord/premium/widget/benifit_text.dart';
import 'package:renttas/presentation/screens/landlord/premium/widget/buy_premioum.dart';
import 'package:renttas/presentation/screens/landlord/premium/widget/get_premium.dart';
import 'package:renttas/presentation/screens/landlord/premium/widget/money.dart';
import 'package:renttas/presentation/screens/landlord/premium/widget/money_containers.dart';
import 'package:renttas/presentation/screens/landlord/premium/widget/title.dart';
import 'package:renttas/presentation/widgets/buttons/custom_button.dart';
import 'package:renttas/presentation/widgets/navigators/navs.dart';

class PremiumUpgradingScreen extends StatefulWidget {
  const PremiumUpgradingScreen({Key? key}) : super(key: key);

  @override
  State<PremiumUpgradingScreen> createState() => _PremiumUpgradingScreenState();
}

class _PremiumUpgradingScreenState extends State<PremiumUpgradingScreen> {
  final premium = Get.put(GetPremium());
  final buyPremium = Get.put(BuyPremium());
  String selectedDuration = ''; // Track the selected duration
  String selectedPrice = '';

  @override
  void initState() {
    premium.getPremiumReq();
  }

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
              MoneyCustomContainers(onDurationSelected: (duration) {
                setState(() {
                  selectedDuration = duration;
                });
              }, onPriceSelect: (price) {
                setState(() {
                  selectedPrice = price;
                });
              }),
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
                  onTap: () {
                    if (selectedDuration == '3 Months') {
                      String packageid = '2';
                      buyPremium.buyPremiumReq(packageid);
                    }
                    if (selectedDuration == '6 Months') {
                      String packageid = '3';
                      buyPremium.buyPremiumReq(packageid);
                    }
                    if (selectedDuration == '1 Year') {
                      String packageid = '4';
                      buyPremium.buyPremiumReq(packageid);
                    }
                    if (selectedDuration == '2 Year') {
                      String packageid = '5';
                      buyPremium.buyPremiumReq(packageid);
                    }
                    print(selectedDuration);
                    print(selectedPrice);
                  },
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
