import 'dart:convert';

import 'package:renttas/core/api/apis.dart';
import 'package:renttas/domain/models/add_tenant/model.dart';
import 'package:http/http.dart' as http;

class AddTenantRepo {
  static Future addTenant(AddTenantModel model) async {
    Map<String, dynamic> request = {
      "propertyId": model.propertyid,
      "subPropertyId": model.subPropertyId,
      "tenantName": model.tenantName,
      "phone": model.mobileNumber,
      "email": model.tenantEmail,
      "advanceAmount": model.advanceAmount,
      "landlordId": model.uid,
      "startDate": model.startDate,
      "endDate": model.endDate,
    };

    try {
      final respose =
          await http.post(Uri.parse(Api.addTenant), body: json.encode(request));
      if (respose.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return "some error found $e";
    }
  }
}
