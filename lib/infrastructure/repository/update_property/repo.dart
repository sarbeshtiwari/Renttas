import 'dart:convert';

import 'package:renttas/core/api/apis.dart';
import 'package:renttas/domain/models/update_property/model.dart';
import 'package:http/http.dart' as http;

class UpdatePropertyRepo {
  static Future<String> updateProperty(UpdatePropertyModel model) async {
    Map<String, dynamic> updateReq = {
      "landlordId": model.landlordId,
      "propertyName": model.propertyName,
      "location": model.location,
      "propertyTypeId": model.propertyTypeId,
      "subPropertyName": model.subPropertyName,
      "pin": model.pin,
      "id": model.id
    };

    try {
      final response = await http.post(Uri.parse(Api.updateProperty),
          body: jsonEncode(updateReq));
      if (response.statusCode == 200) {
        return 'done';
      } else {
        return 'faild';
      }
    } catch (e) {
      return "some error occur $e";
    }
  }
}
