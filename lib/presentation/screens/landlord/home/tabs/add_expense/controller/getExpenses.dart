import 'dart:convert';
import 'package:get/get.dart';
import 'package:renttas/application/property_select/propertyselecter_bloc.dart';
import 'package:renttas/core/api/apis.dart';
import 'package:http/http.dart' as http;
import 'package:renttas/presentation/screens/landlord/home/tabs/add_expense/controller/modelExpenses.dart';

class GetExpenses extends GetxController {
  var isLoading = false.obs;
  var expensesList = <GetExpensesModel>[].obs;

  Future<void> getExpense() async {
    isLoading.value = true;
    Map<String, dynamic> req = {
      "landlordId": "cf8b7bf5-a84d-49dd-b25e-f02a6ae5f748",
      "propertyId": currentPropertyId,
      "subPropertyId": currentSubpropertyId,
    };

    try {
      final response = await http.post(
        Uri.parse(Api.getExpenses),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode(req),
      );
      final responseBody = jsonDecode(response.body);

      if (response.statusCode == 200) {
        expensesList.value = (responseBody['data'] as List)
            .map((item) => GetExpensesModel.fromJson(item))
            .toList();
      } else {
        print('Failed to fetch expenses: Status code ${response.statusCode}');
        throw Exception('Failed to fetch expenses');
      }
    } catch (e) {
      print('Exception caught: $e');
      throw Exception('Failed to fetch expenses');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> deleteExpense(String id) async {
    isLoading.value = true;
    Map<String, dynamic> req1 = {"expenseid": id};

    try {
      final response = await http.delete(
        Uri.parse(Api.deleteExpenses),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode(req1),
      );
      if (response.statusCode == 200) {
        expensesList.removeWhere((expense) => expense.id == id);
      } else {
        print('Failed to delete expense: Status code ${response.statusCode}');
        throw Exception('Failed to delete expense');
      }
    } catch (e) {
      print('Exception caught: $e');
      throw Exception('Failed to delete expense');
    } finally {
      isLoading.value = false;
    }
  }
}
