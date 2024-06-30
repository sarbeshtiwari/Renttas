// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:intl/intl.dart';
// import 'package:renttas/application/bill_fetch/propertybillfetch_bloc.dart';
// import 'package:renttas/main.dart';
// import 'package:renttas/presentation/screens/landlord/home/widgets/appbar.dart';

// class PropertyBillBuilder extends StatelessWidget {
//   const PropertyBillBuilder({super.key, required this.state});
//   final BillLoadedSucussState state;

//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         return SizedBox(
//           height: constraints.maxHeight,
//           child: ListView.builder(
//             itemCount: state.billList.length,
//             itemBuilder: (context, index) {
//               DateTime dateTime =
//                   DateTime.parse(state.billList[index].createdAt);
//               DateFormat formatter = DateFormat('dd MMM');
//               String formattedDate = formatter.format(dateTime);
//               return Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Container(
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10),
//                     border: Border.all(color: Colors.black87),
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.all(0.0),
//                     child: Column(
//                       children: [
//                         Row(
//                           children: [
//                             const SizedBox(
//                               width: 10,
//                               height: 80,
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: SizedBox(
//                                 width: 35,
//                                 child: Text(
//                                   '$formattedDate',
//                                   // state.billList[index].createdAt,
//                                   style: GoogleFonts.inter(
//                                     color: Colors.black54,
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.w800,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             SizedBox(
//                               width: 120,
//                               child: Text(
//                                 "$selectedSubPropertyName",
//                                 style: GoogleFonts.inter(
//                                   color: Colors.black87,
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.w800,
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(
//                               width: 11,
//                             ),
//                             Container(
//                               decoration: BoxDecoration(color: Colors.red[100]),
//                               child: Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: Text(
//                                   ' ₹ ${state.billList[index].rentAmount}',
//                                   style: GoogleFonts.urbanist(
//                                     fontSize: 15,
//                                     fontWeight: FontWeight.w700,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             Container(
//                               decoration:
//                                   BoxDecoration(color: Colors.green[50]),
//                               child: Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: Text(
//                                   " ₹ ${state.billList[index].totalAmount.toString()}",
//                                   style: GoogleFonts.urbanist(
//                                     fontSize: 15,
//                                     fontWeight: FontWeight.w700,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(
//                               width: 8,
//                             ),
//                             const Icon(
//                               Icons.arrow_forward_ios_rounded,
//                               size: 30,
//                             ),
//                           ],
//                         ),
//                         Row(
//                           children: [
//                             Expanded(
//                               child: Container(
//                                 height: 50,
//                                 decoration: BoxDecoration(
//                                   borderRadius: const BorderRadius.only(
//                                     bottomLeft: Radius.circular(10),
//                                   ),
//                                   border: Border.all(color: Colors.black45),
//                                 ),
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Icon(
//                                       Icons.share,
//                                       size: 30,
//                                       color: contsGreen,
//                                     ),
//                                     const SizedBox(
//                                       width: 8,
//                                     ),
//                                     Text(
//                                       'Share',
//                                       style: GoogleFonts.urbanist(
//                                         fontSize: 15,
//                                         fontWeight: FontWeight.w700,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                             Expanded(
//                               child: Container(
//                                 height: 50,
//                                 decoration: BoxDecoration(
//                                   border: Border.all(color: Colors.black45),
//                                 ),
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Container(
//                                       width: 40,
//                                       child: Image.asset(
//                                         'assets/images/whatsapp icon.png',
//                                         fit: BoxFit.fill,
//                                       ),
//                                     ),
//                                     Text(
//                                       'WhatsApp',
//                                       style: GoogleFonts.urbanist(
//                                         fontSize: 15,
//                                         fontWeight: FontWeight.w700,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                             Expanded(
//                               child: Container(
//                                 height: 50,
//                                 decoration: BoxDecoration(
//                                   borderRadius: const BorderRadius.only(
//                                     bottomRight: Radius.circular(10),
//                                   ),
//                                   border: Border.all(color: Colors.black45),
//                                 ),
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Icon(
//                                       Icons.download,
//                                       size: 30,
//                                       color: contsGreen,
//                                     ),
//                                     const SizedBox(
//                                       width: 6,
//                                     ),
//                                     Text(
//                                       'Download',
//                                       style: GoogleFonts.urbanist(
//                                         fontSize: 15,
//                                         fontWeight: FontWeight.w700,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               );
//             },
//           ),
//         );
//       },
//     );
//   }
// }
