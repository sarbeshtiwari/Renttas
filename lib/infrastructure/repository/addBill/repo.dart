import 'dart:convert';

import 'package:renttas/core/api/apis.dart';
import 'package:renttas/domain/models/add_property_bill/model.dart';
import 'package:http/http.dart' as http;

class AddPropertyBillLandlordRepo {
  static Future addPropertyBill(
    AddPropertyBillModel model,
  ) async {
    Map<String, dynamic> addRequst = {
      "landlordId": model.landlordId,
      "propertyId": model.propertyId,
      "subpropertyId": model.subpropertyId,
      "rentCycle": model.rentCycle,
      "rentAmount": model.rentAmount,
      "maintenanceAmount": model.maintananceAmount,
      // "totalAmount": "5000",
      "electricityType": model.electricityType,
      "waterBillType": model.waterbillType,
      "gasBillType": model.gasBillType,
      "extraCharge": model.extraCharges,
      "mobileNumber": model.mobileNumber,
    };
    print(addRequst);
    print(model.mobileNumber);
    try {
      final response = await http.post(Uri.parse(Api.addPropertyBill),
          body: jsonEncode(addRequst));
      final responseBody = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return true;
      } else {
        print(response.statusCode);
        return false;
      }
    } catch (e) {
      return "something went wrong $e";
    }
  }
}
