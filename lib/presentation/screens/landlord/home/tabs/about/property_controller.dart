import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:renttas/application/property_select/propertyselecter_bloc.dart';
import 'package:renttas/core/api/apis.dart';
import 'package:http/http.dart' as http;

class AddPropertyDetails extends GetxController {
  var isLoading = false.obs;

  AddPropertyDetails();

  Future<void> addProp(
      {required String propOwner, required String docName, required File file}) async {
    isLoading.value = true;
    Map<String, dynamic> req = {
      "PropertyId": currentPropertyId,
      "subPropertyid": currentSubpropertyId,
      "propertyownername": propOwner,
      "docName": docName,
      "file": file,
    };

    try {
      final response = await http.post(
        Uri.parse(Api.addDocumentinAbout),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode(req),
      );
      final responseBody = jsonDecode(response.body);

      if (response.statusCode == 200) {
        print(responseBody);
        Get.back();
      } else {
        print('Failed to add address: Status code ${response.statusCode}');

        throw Exception('Failed to add address');
      }
    } catch (e) {
      print('Exception caught: $e');
      throw Exception('Failed to add address');
    } finally {
      isLoading.value = false;
    }
  }
}
