import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renttas/presentation/screens/auth/sign_in/signin.dart';
import 'package:renttas/presentation/screens/onboarding/onboarding2.dart';
import 'package:renttas/presentation/widgets/navigators/navs.dart';

class OnBoardingScreen1 extends StatelessWidget {
  const OnBoardingScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(11.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.all(35.0),
              child: Image.asset('assets/images/onboarding1.png'),
            ),
            Text(
              'Mange Properties',
              style:
                  GoogleFonts.inter(fontWeight: FontWeight.w900, fontSize: 28),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                width: 350,
                child: Text(
                  'Keep track of rent & tenants Living in multiple properties',
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w500, fontSize: 18),
                ),
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () =>
                          customNavRemoveuntil(context, SignInScreen()),
                      icon: const Icon(
                        Icons.skip_next,
                        color: Colors.indigo,
                        size: 40,
                      )),
                  Spacer(),
                  IconButton(
                      onPressed: () => customNavRemoveuntil(
                          context, const OnBoardingScreen2()),
                      icon: const Icon(
                        Icons.play_arrow,
                        color: Colors.blue,
                        size: 50,
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
