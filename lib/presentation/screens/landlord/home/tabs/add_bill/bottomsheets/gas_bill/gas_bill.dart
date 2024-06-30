import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renttas/main.dart';
import 'package:renttas/presentation/screens/landlord/home/tabs/add_bill/bottomsheets/gas_bill/widgets/charges.dart';
import 'package:renttas/presentation/widgets/buttons/custom_button.dart';

void gasBillBottomSheet(context) {
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return DraggableScrollableSheet(
            initialChildSize: 0.6,
            minChildSize: 0.6,
            maxChildSize: 0.6,
            expand: false,
            builder: (context, scrollController) {
              return LayoutBuilder(builder: (context, constraints) {
                final bottomPadding = MediaQuery.of(context).viewInsets.bottom;
                return AnimatedPadding(
                    padding: EdgeInsets.only(bottom: bottomPadding),
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOut,
                    child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.green[50],
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                          ),
                        ),
                        child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: SingleChildScrollView(
                                controller: scrollController,
                                child: Padding(
                                  padding: const EdgeInsets.all(7.0),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'How Gas Is charged from tenants',
                                          style: GoogleFonts.urbanist(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        ),
                                        const SizedBox(
                                          height: 18,
                                        ),
                                        const GasBillChargesScreen(),
                                        CustomButton(
                                          isNetwork: false,
                                          isRow: false,
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                          textclr: Colors.white,
                                          borderclr: contsGreen,
                                          color: contsGreen,
                                          fontweight: FontWeight.w500,
                                          name: 'Save',
                                          height: 50,
                                          radius: 10,
                                          textsize: 16,
                                          width: double.infinity,
                                        )
                                      ]),
                                )))));
              });
            });
      });
}
