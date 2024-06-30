import 'dart:convert';
import 'package:get/get.dart';
import 'package:renttas/application/property_select/propertyselecter_bloc.dart';
import 'package:renttas/core/api/apis.dart';
import 'package:http/http.dart' as http;

class AddOwner extends GetxController {
  var isLoading = false.obs;

  AddOwner();

  Future<void> addOwner({required String address, required String pin}) async {
    isLoading.value = true;
    Map<String, dynamic> req = {
      "selectedPropertyId": currentPropertyId,
      "selectedsubPropertyId": currentSubpropertyId,
      "address": address,
      "pincode": pin,
    };

    try {
      final response = await http.post(
        Uri.parse(Api.addAddress),
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
