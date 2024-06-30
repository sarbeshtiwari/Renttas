// ignore_for_file: must_be_immutable

import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renttas/main.dart';
import 'package:renttas/presentation/screens/landlord/home/tabs/add_expense/widget/custom_cart_fields.dart';

class PropertyAddressAddScreenFields extends StatefulWidget {
  PropertyAddressAddScreenFields(
      {required this.ownerAddressController,
      required this.pincodeController,
      super.key});
  TextEditingController ownerAddressController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();

  @override
  State<PropertyAddressAddScreenFields> createState() =>
      _PropertyAddressAddScreenFieldsState();
}

class _PropertyAddressAddScreenFieldsState
    extends State<PropertyAddressAddScreenFields> {
  

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      AddExpenseFields(
        keyboardType: TextInputType.name,
        controller: widget.ownerAddressController,
        hitText: 'Property Owner',
        icon: Icon(
          Icons.person,
          color: contsGreen,
        ),
        name: 'Property Owner*',
      ),
      AddExpenseFields(
        keyboardType: TextInputType.name,
        controller: widget.pincodeController,
        hitText: 'Document Name',
        icon: Icon(
          Icons.document_scanner,
          color: contsGreen,
        ),
        name: 'Document Name*',
      ),
      const SizedBox(
        height: 6,
      ),
      Text(
        'Select Upload File',
        style: GoogleFonts.urbanist(fontSize: 18, fontWeight: FontWeight.w700),
      ),
      const SizedBox(
        height: 9,
      ),
      
      // InkWell(
      //   onTap: () => _pickFile(),
      //   child: Container(
      //     width: double.infinity,
      //     height: 130,
      //     decoration: BoxDecoration(
      //         border: Border.all(color: Colors.black),
      //         borderRadius: BorderRadius.circular(10)),
      //     child: pdfFilePath != null
      //         ? PDFView(
      //             filePath: pdfFilePath,
      //           )
      //         : Icon(
      //             Icons.add,
      //             size: 80,
      //           ),
      //   ),
      // )
    ]);
  }
}
