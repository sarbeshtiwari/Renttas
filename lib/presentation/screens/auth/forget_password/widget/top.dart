import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgetPasswordTopImages extends StatelessWidget {
  const ForgetPasswordTopImages({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('assets/images/signup.png'),
        const SizedBox(
          height: 20,
        ),
        Container(
          clipBehavior: Clip.antiAlias,
          height: 80,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Image.asset(
            'assets/images/rateapp.png',
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          'Forget Password',
          style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w800),
        ),
      ],
    );
  }
}
