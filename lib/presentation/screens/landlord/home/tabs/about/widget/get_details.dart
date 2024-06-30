import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:renttas/application/property_select/propertyselecter_bloc.dart';
import 'package:renttas/core/api/apis.dart';
import 'package:renttas/presentation/screens/landlord/home/tabs/about/OwnerAddressModel.dart';
import 'package:renttas/presentation/screens/landlord/home/tabs/about/OwnerDocsModel.dart';

class GetAbout extends GetxController {
  var isLoading = false.obs;
  var aboutOwner = <OwnerAddressModel>[].obs;
  var aboutDoc = <OwnerDocModel>[].obs;

  Future<void> getAddress() async {
    isLoading.value = true;
    Map<String, dynamic> req = {
      "selectedPropertyId": currentPropertyId,
      "selectedSubPropertyId": currentSubpropertyId,
    };

    try {
      final response = await http.post(
        Uri.parse(Api.getAddress),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode(req),
      );
      final responseBody = jsonDecode(response.body);

      if (response.statusCode == 200) {
        print(responseBody);
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        // Create a single OwnerAddressModel instance from the response and assign to aboutOwner
        aboutOwner.value = [OwnerAddressModel.fromJson(responseData)];
      } else {
        print('Failed to fetch: Status code ${response.statusCode}');
        throw Exception('Failed to fetch');
      }
    } catch (e) {
      print('Exception caught: $e');
      throw Exception('Failed to fetch');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getOwner() async {
    isLoading.value = true;
    Map<String, dynamic> req = {
      "selectedpropertyId": currentPropertyId,
      "selectedsubPropertyId": currentSubpropertyId,
    };

    try {
      final response = await http.post(
        Uri.parse(Api.getDocumentinAbout),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode(req),
      );
      final responseBody = jsonDecode(response.body);

      if (response.statusCode == 200) {
        aboutDoc.value = [OwnerDocModel.fromJson(responseBody)];
      } else {
        print('Failed to fetch: Status code ${response.statusCode}');
        throw Exception('Failed to fetch docs');
      }
    } catch (e) {
      print('Exception caught: $e');
      throw Exception('Failed to fetch docs');
    } finally {
      isLoading.value = false;
    }
  }
}
