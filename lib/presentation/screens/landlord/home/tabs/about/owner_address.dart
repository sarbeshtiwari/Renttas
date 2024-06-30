import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renttas/main.dart';
import 'package:renttas/presentation/screens/landlord/home/tabs/about/owner_controller.dart';
import 'package:renttas/presentation/screens/landlord/home/tabs/about/widget/owner.dart';
import 'package:renttas/presentation/widgets/buttons/custom_button.dart';

void ownerAddressSheet(BuildContext context) {
  final ownerAddressController = TextEditingController();
  final pincodeController = TextEditingController();
  final AddOwner add = Get.put(AddOwner());
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return DraggableScrollableSheet(
            initialChildSize: 0.5,
            minChildSize: 0.5,
            maxChildSize: 0.5,
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
                                          'Add Address',
                                          style: GoogleFonts.urbanist(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        ),
                                        const SizedBox(
                                          height: 18,
                                        ),
                                        OwnerAddressAddScreenFields(
                                            ownerAddressController:
                                                ownerAddressController,
                                            pincodeController:
                                                pincodeController),
                                        const SizedBox(
                                          height: 40,
                                        ),
                                        CustomButton(
                                          isNetwork: false,
                                          isRow: false,
                                          onTap: () {
                                            add.addOwner(address: ownerAddressController.text, pin: pincodeController.text);
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
