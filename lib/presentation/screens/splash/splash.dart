import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renttas/domain/models/user_model/model.dart';
import 'package:renttas/infrastructure/repository/getTenant/repo.dart';
import 'package:renttas/main.dart';
import 'package:renttas/presentation/screens/landlord/home/home.dart';
import 'package:renttas/presentation/screens/onboarding/onboarding.dart';
import 'package:renttas/presentation/screens/tentant/home/home.dart';
import 'package:renttas/presentation/widgets/navigators/navs.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tenantManagementController = Get.put(GetTenantRepo());

    // Fetch tenant data
    tenantManagementController.getTenantReq();
    getUserModel();
    Future.delayed(const Duration(seconds: 2), () {
      checkUserLogin(context);
    });
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset('assets/images/splash.png'),
      ),
    );
  }

  Future<void> checkUserLogin(context) async {
    final sharedpreference = await SharedPreferences.getInstance();
    final userlogin = sharedpreference.getString(loginTocken);

    if (userlogin == 'user') {
      customNavRemoveuntil(context, const TenantWelcomeHomeScreen());
    } else if (userlogin == "admin") {
      customNavRemoveuntil(context, const LandlordHomeScreen());
    } else {
      customNavRemoveuntil(context, const OnBoardingScreen1());
    }
  }
}
