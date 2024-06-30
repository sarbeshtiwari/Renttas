import 'dart:convert';
import 'package:get/get.dart';
import 'package:renttas/application/property_select/propertyselecter_bloc.dart';
import 'package:renttas/core/api/apis.dart';
import 'package:http/http.dart' as http;
import 'package:renttas/domain/models/getTenant/models.dart';

class GetTenantRepo extends GetxController {
  var isLoading = false.obs;
  var tenantList = <GetTenantModel>[].obs;

  Future<void> getTenantReq() async {
    isLoading.value = true;
    Map<String, dynamic> req = {
      "subPropertyId": currentSubpropertyId,
      "propertyId": currentPropertyId
    };

    try {
      final response = await http.post(
        Uri.parse(Api.getTenant),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode(req),
      );

      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);

        if (responseBody['statuscode'] == 200 && responseBody['data'] is List) {
          tenantList.value = (responseBody['data'] as List).map((item) {
            return GetTenantModel.fromMap(item as Map<String, dynamic>);
          }).toList();
        } else {
          tenantList.clear();
        }
      } else {
        print('Failed to load tenants: Status code ${response.statusCode}');
        tenantList.clear();
        throw Exception('Failed to load tenants');
      }
    } catch (e) {
      print('Exception caught: $e');
      tenantList.clear();
      throw Exception('Failed to load tenants');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> deleteTenant(String id) async {
    isLoading.value = true;
    Map<String, dynamic> req1 = {"tenantid": id};
    try {
      final response = await http.delete(
        Uri.parse(Api.deleteTenant),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode(req1),
      );
      if (response.statusCode == 200) {
        tenantList.removeWhere((tenantList) => tenantList.id == id);
      } else {
        print('Failed to delete document: Status code ${response.statusCode}');
        throw Exception('Failed to delete document');
      }
    } catch (e) {
      print('Exception caught: $e');
      throw Exception('Failed to delete document');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> updateTenant(tenantid, tenantName, phone, email,advanceAmount ) async {
    isLoading.value = true;
    Map<String, dynamic> req = {
      "tenantid": tenantid,
        "tenantName": tenantName,
        "phone": phone,
        "email": email,
        "advanceAmount": advanceAmount,
    };

    try {
      final response = await http.post(
        Uri.parse(Api.updateTenant),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode(req),
      );

      if (response.statusCode == 200) {
        Get.back();
      } else {
        print('Failed to update tenants: Status code ${response.statusCode}');
        tenantList.clear();
        throw Exception('Failed to update tenants');
      }
    } catch (e) {
      print('Exception caught: $e');
      tenantList.clear();
      throw Exception('Failed to update tenants');
    } finally {
      isLoading.value = false;
    }
  }
}
