import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:renttas/application/property_select/propertyselecter_bloc.dart';
import 'package:renttas/core/api/apis.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:path/path.dart';
import 'package:renttas/presentation/screens/landlord/home/widgets/add_property/widget/property_builder.dart';

class AddDocument extends GetxController {
  var isLoading = false.obs;

  AddDocument();

  Future<void> addDocument({
    required String name,
    required String description,
    required File file,
  }) async {
    isLoading.value = true;

    try {
      var request = http.MultipartRequest('POST', Uri.parse(Api.createDocument))
        ..fields['docname'] = name
        ..fields['doctype'] = 'jpeg'
        ..fields['propertyid'] = currentPropertyId
        ..fields['subPropertyid'] = currentSubpropertyId
        ..fields['mobileNumber'] = '1234567890'
        ..fields['description'] = description
        ..files.add(await http.MultipartFile.fromPath(
          'file',
          file.path,
          contentType: MediaType('image', 'jpeg'),
        ));

      var response = await request.send();

      if (response.statusCode == 200) {
        print('Document uploaded successfully');
        Get.back(); // Navigate back after successful upload
      } else {
        print('Failed to upload document: Status code ${response.statusCode}');
        print('Response reason: ${response.reasonPhrase}');
        throw Exception('Failed to upload document');
      }
    } catch (e) {
      print('Exception caught: $e');
      throw Exception('Failed to upload document');
    } finally {
      isLoading.value = false;
    }
  }
}
