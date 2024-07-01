import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:renttas/main.dart';
import 'package:renttas/presentation/screens/landlord/home/tabs/add_docs/widgets/addDocumnet.dart';
import 'package:renttas/presentation/screens/landlord/home/tabs/add_docs/widgets/fields.dart';
import 'package:renttas/presentation/widgets/buttons/custom_button.dart';

class AddDocumentsScreen extends StatefulWidget {
  @override
  _AddDocumentsScreenState createState() => _AddDocumentsScreenState();
}

class _AddDocumentsScreenState extends State<AddDocumentsScreen> {
  final AddDocument _addDocumentController = Get.put(AddDocument());
  File? _selectedFile;
  final descriptionController = TextEditingController();
  final documentnameController = TextEditingController();

  Future<void> _pickFile() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _selectedFile = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: contsGreen,
        title: Text(
          'Add Document',
          style: GoogleFonts.poppins(
              fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Upload a document file',
                style: GoogleFonts.urbanist(
                    fontSize: 18, fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    _pickFile;
                  },
                  child: Container(
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black)),
                    child: _selectedFile != null
                        ? Column(
                            children: [
                              Container(
                                width: double.infinity,
                                height: 250,
                                decoration: BoxDecoration(
                                  border: Border.all(),
                                ),
                                child: Image.file(
                                  _selectedFile!,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                  'File: ${path.basename(_selectedFile!.path)}'),
                            ],
                          )
                        : const Icon(
                            Icons.add,
                            size: 120,
                          ),
                  ),
                ),
              ),
              AddDocumentCustomFields(
                  documentnameController: documentnameController,
                  descriptionController: descriptionController),
              CustomButton(
                isNetwork: false,
                isRow: false,
                onTap: () async {
                  if (_selectedFile != null) {
                    await _addDocumentController.addDocument(
                      name: documentnameController.text,
                      description: descriptionController.text,
                      file: _selectedFile!,
                    );
                  } else {
                    print('No file selected');
                  }
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
            ],
          ),
        ),
      ),
    );

    //   Scaffold(
    //     appBar: AppBar(title: Text('Upload Document')),
    //     body: Padding(
    //       padding: const EdgeInsets.all(16.0),
    //       child: Column(
    //         children: [
    //           TextField(
    //             controller: _nameController,
    //             decoration: InputDecoration(labelText: 'Document Name'),
    //           ),
    //           TextField(
    //             controller: _descriptionController,
    //             decoration: InputDecoration(labelText: 'Description'),
    //           ),
    //           SizedBox(height: 20),
    //           _selectedFile == null
    //               ? GestureDetector(
    //                   onTap: _pickFile,
    //                   child: Container(
    //                     width: double.infinity,
    //                     height: 250,
    //                     decoration: BoxDecoration(border: Border.all()),
    //                     child: Icon(
    //                       Icons.add,
    //                       size: 200,
    //                     ),
    //                   ),
    //                 )
    //               : Column(
    //                   children: [
    //                     Container(
    //                       width: double.infinity,
    //                       height: 250,
    //                       decoration: BoxDecoration(
    //                         border: Border.all(),
    //                       ),
    //                       child: Image.file(
    //                         _selectedFile!,
    //                         fit: BoxFit.cover,
    //                       ),
    //                     ),
    //                     SizedBox(height: 10),
    //                     Text('File: ${path.basename(_selectedFile!.path)}'),
    //                   ],
    //                 ),
    //           SizedBox(height: 20),
    //           // ElevatedButton(
    //           //   onPressed: _pickFile,
    //           //   child: Text('Pick File'),
    //           // ),
    //           // SizedBox(height: 20),
    //           CustomButton(
    //             isNetwork: false,
    //             isRow: false,
    //             onTap: () async {
    //               if (_selectedFile != null) {
    //                 await _addDocumentController.addDocument(
    //                   name: _nameController.text,
    //                   description: _descriptionController.text,
    //                   file: _selectedFile!,
    //                 );
    //               } else {
    //                 print('No file selected');
    //               }
    //             },
    //             textclr: Colors.white,
    //             borderclr: contsGreen,
    //             color: contsGreen,
    //             fontweight: FontWeight.w500,
    //             name: 'Save',
    //             height: 50,
    //             radius: 10,
    //             textsize: 16,
    //             width: double.infinity,
    //           ),
    //           // ElevatedButton(
    //           //   onPressed: () async {
    //           //     if (_selectedFile != null) {
    //           //       await _addDocumentController.addDocument(
    //           //         name: _nameController.text,
    //           //         description: _descriptionController.text,
    //           //         file: _selectedFile!,
    //           //       );
    //           //     } else {
    //           //       print('No file selected');
    //           //     }
    //           //   },
    //           //   child: Obx(() => _addDocumentController.isLoading.value
    //           //       ? CircularProgressIndicator(color: Colors.white)
    //           //       : Text('Upload Document')),
    //           // ),
    //         ],
    //       ),
    //     ),
    //   );
  }
}
