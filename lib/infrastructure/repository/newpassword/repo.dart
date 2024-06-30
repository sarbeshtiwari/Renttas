import 'dart:convert';

import 'package:renttas/core/api/apis.dart';
import 'package:renttas/domain/models/newpassword/model.dart';
import 'package:http/http.dart' as http;

class NewPasswordRepo {
  Future updatePassword(NewPasswordModel model, String email) async {
    Map<String, dynamic> resetReq = {
      "email": email,
      "new_password": model.newpassword,
      "confirm_password": model.conformPassword
    };
    try {
      final response = await http.post(Uri.parse(Api.newPassword),
          headers: {
            'Content-Type': 'application/json',
          },
          body: jsonEncode(resetReq));

      final responseBody = jsonDecode(response.body);
      if (responseBody['statuscode'] == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
