import 'dart:convert';

import 'package:renttas/core/api/apis.dart';
import 'package:renttas/domain/models/signin_models/model.dart';
import 'package:http/http.dart' as http;

class LoginRepo {
  Future loginRequest(LoginModel model) async {
    Map<String, dynamic> requstLogin = {
      'email': model.email,
      'password': model.password
    };
    try {
      final response = await http.post(Uri.parse(Api.loginApi),
          headers: {
            'Content-Type': 'application/json',
          },
          body: jsonEncode(requstLogin));
      final responseBody = jsonDecode(response.body);
      if (responseBody['statuscode'] == 200) {
        return responseBody;
      } else {
        return 'Invalid inputs';
      }
    } catch (e) {
      return 'Invalid inputs';
    }
  }
}
