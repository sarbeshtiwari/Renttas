import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:renttas/main.dart';
import 'package:renttas/presentation/screens/landlord/home/tabs/about/property_controller.dart';
import 'package:renttas/presentation/screens/landlord/home/tabs/about/widget/property.dart';
import 'package:renttas/presentation/widgets/buttons/custom_button.dart';

void propertyAddressSheet(BuildContext context) {
  final ownerAddressController = TextEditingController();
  final pincodeController = TextEditingController();
  final AddPropertyDetails add = Get.put(AddPropertyDetails());
  final Rx<File?> _selectedFile = Rx<File?>(null);

  Future<void> _pickFile() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      _selectedFile.value = File(pickedFile.path);
    }
  }

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (context) {
      return DraggableScrollableSheet(
        initialChildSize: 0.6,
        minChildSize: 0.6,
        maxChildSize: 0.7,
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Add Address',
                            style: GoogleFonts.urbanist(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(
                            height: 18,
                          ),
                          PropertyAddressAddScreenFields(
                            ownerAddressController: ownerAddressController,
                            pincodeController: pincodeController,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Obx(
                            () => _selectedFile.value == null
                                ? GestureDetector(
                                    onTap: _pickFile,
                                    child: Container(
                                      width: double.infinity,
                                      height: 200,
                                      decoration:
                                          BoxDecoration(border: Border.all()),
                                      child: Icon(
                                        Icons.add,
                                        size: 200,
                                      ),
                                    ),
                                  )
                                : Column(
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        height: 250,
                                        decoration: BoxDecoration(
                                          border: Border.all(),
                                        ),
                                        child: Image.file(
                                          _selectedFile.value!,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                          'File: ${_selectedFile.value!.path}'),
                                    ],
                                  ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          CustomButton(
                            isNetwork: false,
                            isRow: false,
                            onTap: () {
                              add.addProp(
                                propOwner: ownerAddressController.text,
                                docName: pincodeController.text,
                                file: _selectedFile.value!,
                              );
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
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          });
        },
      );
    },
  );
}
