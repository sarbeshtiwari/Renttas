import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renttas/application/property_select/propertyselecter_bloc.dart';
import 'package:renttas/core/api/apis.dart';
import 'package:http/http.dart' as http;
import 'package:renttas/domain/models/add_property_bill/model.dart';

class AddExpenses extends GetxController {
  var isLoading = false.obs;

  AddExpenses();

  Future<void> addExpense(
      {required String category,
      required String name,
      required String amount,
      required String date,
      required String description}) async {
    isLoading.value = true;
    Map<String, dynamic> req = {
      "landlordId": "cf8b7bf5-a84d-49dd-b25e-f02a6ae5f748",
      "propertyId": currentPropertyId,
      "subPropertyId": currentSubpropertyId,
      "category": category,
      "name": name,
      "amount": amount,
      "expensesDate": date,
      "description": description
    };

    try {
      final response = await http.post(
        Uri.parse(Api.addExpenses),
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
        print('Failed to add expanses: Status code ${response.statusCode}');

        throw Exception('Failed to add expanses');
      }
    } catch (e) {
      print('Exception caught: $e');
      throw Exception('Failed to add expanses');
    } finally {
      isLoading.value = false;
    }
  }
}
