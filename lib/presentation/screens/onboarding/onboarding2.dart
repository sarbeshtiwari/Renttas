import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renttas/presentation/screens/onboarding/onboarding3.dart';
import 'package:renttas/presentation/widgets/navigators/navs.dart';

class OnBoardingScreen2 extends StatelessWidget {
  const OnBoardingScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(11.0),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.all(35.0),
              child: Image.asset('assets/images/onboarding2.png'),
            ),
            Text(
              'Manage Expenses',
              style:
                  GoogleFonts.inter(fontWeight: FontWeight.w900, fontSize: 28),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Keep track of all the expenses occurred ',
                    style: GoogleFonts.inter(
                        fontWeight: FontWeight.w500, fontSize: 18),
                  ),
                  Text(
                    'property wise ',
                    style: GoogleFonts.inter(
                        fontWeight: FontWeight.w500, fontSize: 18),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.skip_next,
                        color: Colors.indigo,
                        size: 40,
                      )),
                  const Spacer(),
                  IconButton(
                      onPressed: () => customNavRemoveuntil(
                          context, const OnBoardingScreen3()),
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
