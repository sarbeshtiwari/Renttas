import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renttas/domain/models/user_model/model.dart';
import 'package:renttas/main.dart';
import 'package:renttas/presentation/screens/landlord/home/tabs/add_bill/widgets/bill_viewer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../infrastructure/repository/fetchBill/repo.dart';
import '../../../../widgets/navigators/navs.dart';

class LatestBillTenant extends StatefulWidget {
  const LatestBillTenant({super.key});

  @override
  State<LatestBillTenant> createState() => _LatestBillTenantState();
}

class _LatestBillTenantState extends State<LatestBillTenant> {
  String _getInitials(String name) {
    List<String> parts = name.split(' ');
    if (parts.length >= 2) {
      String firstName = parts[0];
      String lastName = parts[parts.length - 1];
      return '${firstName[0]}${lastName[0]}'.toUpperCase();
    } else if (parts.length == 1) {
      return '${parts[0][0]}'.toUpperCase();
    } else {
      return '';
    }
  }

  final getbill = Get.put(FetchBillRepo());

  @override
  void initState() {
    super.initState();
    getbill.billFetchByMobile();
  }

  @override
  Widget build(BuildContext context) {
    String initials = userModel != null ? _getInitials(userModel!.name) : '';
    return Scaffold(
      body: Obx(() {
        if (getbill.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (getbill.billList.isEmpty) {
          return Center(
            child: Text('Bill Not found!'),
          );
        } else {
          return ListView.builder(
              itemCount: getbill.billList.length,
              itemBuilder: (context, index) {
                final bill = getbill.billList[index];
                //final tenant1 = tenant.tenantList[index];
                return GestureDetector(
                  onTap: () {
                    customNavPush(
                      context,
                      BillPaymentDetails(
                        bill: bill,
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(11.0),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.black87)),
                          child: Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    const SizedBox(
                                      width: 10,
                                      height: 80,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SizedBox(
                                        width: 35,
                                        child: Text(
                                          ' 08 Jun',
                                          style: GoogleFonts.inter(
                                              color: Colors.black54,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w800),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 120,
                                      child: Text(
                                          userModel?.name ?? 'USER NAME',
                                          style: GoogleFonts.inter(
                                              color: Colors.black87,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w800)),
                                    ),
                                    const SizedBox(
                                      width: 11,
                                    ),
                                    Container(
                                      decoration:
                                          BoxDecoration(color: Colors.red[100]),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text('₹ 20000',
                                            style: GoogleFonts.urbanist(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w700)),
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.green[50]),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text('₹ 0.0',
                                            style: GoogleFonts.urbanist(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w700)),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    const Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      size: 30,
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        height: 50,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                const BorderRadius.only(
                                              bottomLeft: Radius.circular(10),
                                            ),
                                            border: Border.all(
                                                color: Colors.black45)),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.share,
                                              size: 30,
                                              color: contsGreen,
                                            ),
                                            const SizedBox(
                                              width: 8,
                                            ),
                                            GestureDetector(
                                              onTap: () {},
                                              child: Text('Share',
                                                  style: GoogleFonts.urbanist(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w700)),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    // InkWell(
                                    //   onTap: () => openWhatsAppChat('+918943514279'),
                                    //   child: Expanded(
                                    //     child: Container(
                                    //       height: 50,
                                    //       decoration: BoxDecoration(
                                    //           border: Border.all(color: Colors.black45)),
                                    //       child: Row(
                                    //         mainAxisAlignment: MainAxisAlignment.center,
                                    //         children: [
                                    //           // Icon(
                                    //           //   Icons.wh,
                                    //           //   size: 30,
                                    //           //   color: contsGreen,
                                    //           // ),
                                    //           Container(
                                    //             width: 40,
                                    //             child: Image.asset(
                                    //               'assets/images/whatsapp icon.png',
                                    //               fit: BoxFit.fill,
                                    //             ),
                                    //           ),

                                    //           Text('WhatsApp',
                                    //               style: GoogleFonts.urbanist(
                                    //                   fontSize: 15,
                                    //                   fontWeight: FontWeight.w700))
                                    //         ],
                                    //       ),
                                    //     ),
                                    //   ),
                                    // ),
                                    Expanded(
                                      child: Container(
                                        height: 50,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                const BorderRadius.only(
                                              bottomRight: Radius.circular(10),
                                            ),
                                            border: Border.all(
                                                color: Colors.black45)),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.download,
                                              size: 30,
                                              color: contsGreen,
                                            ),
                                            const SizedBox(
                                              width: 6,
                                            ),
                                            Text('Download',
                                                style: GoogleFonts.urbanist(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w700))
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              });
        }
      }),
    );
  }
}
 // const SizedBox(
                              //   width: 8,
                              // ),