import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renttas/presentation/screens/auth/sign_up/sign_up.dart';

import 'package:renttas/presentation/widgets/navigators/navs.dart';

class CustomTypesContainer extends StatelessWidget {
  const CustomTypesContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      InkWell(
        // const LandlordHomeScreen() landloard screen class
        // const LandlordHomeScreen()
        onTap: () => customNavRemoveuntil(
            context,
            SignUpScreen(
              role: '2',
            )),
        child: Container(
            height: 150,
            decoration: BoxDecoration(
                color: Colors.indigo[50],
                borderRadius: BorderRadius.circular(20)),
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Image.asset('assets/images/houseowner.png'),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Landlord',
                        style: GoogleFonts.poppins(
                            fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                      Text(
                        'CreateProperty and',
                        style: GoogleFonts.inter(
                            fontSize: 15, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        'Manage Property',
                        style: GoogleFonts.inter(
                            fontSize: 14, fontWeight: FontWeight.w600),
                      )
                    ],
                  )
                ]))),
      ),
      const SizedBox(
        height: 35,
      ),
      InkWell(
          onTap: () =>
//TenantWelcomeHomeScreen() for tenant
              // const TenantWelcomeHomeScreen()
              customNavRemoveuntil(
                  context,
                  SignUpScreen(
                    role: '1',
                  )),
          child: Container(
              height: 150,
              decoration: BoxDecoration(
                  color: Colors.indigo[50],
                  borderRadius: BorderRadius.circular(20)),
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/tandent.png'),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Tenant',
                                style: GoogleFonts.poppins(
                                    fontSize: 20, fontWeight: FontWeight.w700),
                              ),
                              Text(
                                'Veiw Info Added',
                                style: GoogleFonts.inter(
                                    fontSize: 15, fontWeight: FontWeight.w600),
                              ),
                              Text(
                                'By your landlord',
                                style: GoogleFonts.inter(
                                    fontSize: 14, fontWeight: FontWeight.w600),
                              )
                            ])
                      ]))))
    ]);
  }
}
