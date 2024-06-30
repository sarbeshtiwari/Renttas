import 'dart:convert';
import 'package:renttas/core/api/apis.dart';
import 'package:renttas/domain/models/add_property/models.dart';
import 'package:renttas/domain/models/user_model/model.dart';
import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';

class AddPropertyRepo {
  Future addProperty(AddPropertyModel model) async {
    Map<String, dynamic> addPropertyReq = {
      "landlordId": userModel!.uid,
      "propertyName": model.propertyName,
      "location": model.location,
      "subPropertyName": model.subPropertyName,
      "pin": model.pincode,
      "propertyTypeId": const Uuid().v1(),
    };

    try {
      final response = await http.post(Uri.parse(Api.postProperty),
          headers: {
            'Content-Type': 'application/json',
          },
          body: jsonEncode(addPropertyReq));
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return 'Some Error found $e';
    }
  }
}
