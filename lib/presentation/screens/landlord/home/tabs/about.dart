import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renttas/presentation/screens/landlord/home/tabs/about/owner_address.dart';
import 'package:renttas/presentation/screens/landlord/home/tabs/about/property_address.dart';
import 'package:renttas/presentation/screens/landlord/home/tabs/about/widget/get_details.dart';
import 'package:renttas/presentation/widgets/buttons/custom_button.dart';

class HomeAboutTab extends StatefulWidget {
  const HomeAboutTab({super.key});

  @override
  State<HomeAboutTab> createState() => _HomeAboutTabState();
}

class _HomeAboutTabState extends State<HomeAboutTab> {
  final GetAbout geta = Get.put(GetAbout());

  @override
  void initState() {
    super.initState();
    geta.getOwner();

    geta.getAddress();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Obx(() {
            if (geta.isLoading.value) {
              return CircularProgressIndicator(); // Show loading indicator
            } else if (geta.aboutOwner.isEmpty) {
              return Center(
                child: Column(
                  children: [
                    Text('No data available'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () => propertyAddressSheet(context),
                          child: Container(
                              height: 35,
                              width: 120,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: Colors.black)),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.add,
                                      size: 20,
                                      color: Color.fromARGB(255, 82, 144, 83),
                                    ),
                                    Text(
                                      "Address",
                                      style: GoogleFonts.poppins(
                                          fontSize: 13,
                                          color:
                                              Color.fromARGB(255, 82, 144, 83)),
                                    ),
                                  ])),
                        ),
                        SizedBox(width: 30),
                        InkWell(
                          onTap: () => ownerAddressSheet(context),
                          child: Container(
                              height: 35,
                              width: 150,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: Colors.black)),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.add,
                                      size: 20,
                                      color: Color.fromARGB(255, 82, 144, 83),
                                    ),
                                    Text(
                                      "Owner details",
                                      style: GoogleFonts.poppins(
                                          fontSize: 13,
                                          color:
                                              Color.fromARGB(255, 82, 144, 83)),
                                    ),
                                  ])),
                        ),
                      ],
                    )
                  ],
                ),
              );
            } else {
              // Render UI based on data in aboutOwner
              return ListView.builder(
                itemCount: geta.aboutOwner.length,
                itemBuilder: (context, index) {
                  var owner = geta.aboutOwner[index];
                  return Center(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                        const SizedBox(height: 15),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 100, right: 100, top: 30, bottom: 30),
                          child: CustomButton(
                            isNetwork: false,
                            isRow: false,
                            onTap: () {},
                            borderclr: Colors.green,
                            color: const Color.fromARGB(255, 82, 144, 83),
                            fontweight: FontWeight.w500,
                            radius: 10,
                            textclr: Colors.white,
                            name: 'Property Details',
                            height: 45,
                            textsize: 16,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 7, bottom: 7),
                          child: Text(
                            'Details :',
                            style: GoogleFonts.inter(
                                fontWeight: FontWeight.w700, fontSize: 17),
                          ),
                        ),
                        Divider(color: Colors.black),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Property name :-',
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                                Divider(color: Colors.black),
                                Text(
                                  'Address :-',
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                                Divider(color: Colors.black),
                                Text(
                                  'Renting Type :-',
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                                Divider(color: Colors.black),
                                Text(
                                  'Flat Name :-',
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'N/A',
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                                Divider(color: Colors.black),
                                Text(
                                  owner.address ?? 'N/A',
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                                Divider(color: Colors.black),
                                Text(
                                  'N/A',
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                                Divider(color: Colors.black),
                                Text(
                                  'N/A',
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: 30)
                          ],
                        ),
                        // buildDetailRow('Property name :-', 'N/A'),
                        // Divider(color: Colors.black),
                        // buildDetailRow('Address :-', owner.address ?? 'N/A'),
                        // Divider(color: Colors.black),
                        // buildDetailRow('Renting Type :-', 'N/A'),
                        // Divider(color: Colors.black),
                        // buildDetailRow('Flat Name :-', 'N/A'),
                        // Divider(color: Colors.black),
                        // buildDetailRow('Beds :-', 'N/A'),
                        // Divider(color: Colors.black),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 7, bottom: 7),
                          child: Text(
                            'Property Owner Details :',
                            style: GoogleFonts.inter(
                                fontWeight: FontWeight.w700, fontSize: 17),
                          ),
                        ),
                        Divider(color: Colors.black),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Owner name :-',
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                                Divider(color: Colors.black),
                                Text(
                                  'Document Number :-',
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'N/A',
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                                Divider(color: Colors.black),
                                Text(
                                  'N/A',
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        // buildDetailRow(
                        //     'Owner name :-',
                        //     //geta.aboutDoc[0].data[0].propertyownername ??
                        //     'N/A'),
                        // Divider(color: Colors.black),
                        // buildDetailRow(
                        //     'Document Number :-',
                        //     //geta.aboutDoc[0].data[0].docname ??
                        //     'N/A'),
                        SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () => propertyAddressSheet(context),
                              child: Container(
                                  height: 35,
                                  width: 120,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(color: Colors.black)),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.add,
                                          size: 20,
                                          color:
                                              Color.fromARGB(255, 82, 144, 83),
                                        ),
                                        Text(
                                          "Address",
                                          style: GoogleFonts.poppins(
                                              fontSize: 13,
                                              color: Color.fromARGB(
                                                  255, 82, 144, 83)),
                                        ),
                                      ])),
                            ),
                            SizedBox(width: 30),
                            InkWell(
                              onTap: () => ownerAddressSheet(context),
                              child: Container(
                                  height: 35,
                                  width: 150,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(color: Colors.black)),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.add,
                                          size: 20,
                                          color:
                                              Color.fromARGB(255, 82, 144, 83),
                                        ),
                                        Text(
                                          "Owner details",
                                          style: GoogleFonts.poppins(
                                              fontSize: 13,
                                              color: Color.fromARGB(
                                                  255, 82, 144, 83)),
                                        ),
                                      ])),
                            ),
                          ],
                        )
                      ]));
                },
              );
            }
          })),
    );
  }

  // Widget buildDetailRow(String title, String value) {
  //   return Padding(
  //     padding: const EdgeInsets.only(left: 20, right: 20, top: 7, bottom: 7),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       children: [
  //         Text(
  //           '$title',
  //           style: TextStyle(
  //             fontSize: 15,
  //           ),
  //         ),
  //         Text(
  //           '$value',
  //           style: TextStyle(
  //             fontSize: 14,
  //           ),
  //         ),
  //         SizedBox(width: 30)
  //       ],
  //     ),
  //   );
  // }
}
