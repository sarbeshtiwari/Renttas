import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:renttas/core/api/apis.dart';

class ForgetPasswordRepo {
  Future<String> forgetpassword(String email) async {
    Map<String, dynamic> requestData = {"email": email};
    try {
      final response = await http.post(
        Uri.parse(Api.forgetPasswordApi),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(requestData),
      );
      final responseBody = jsonDecode(response.body);
      if (responseBody['statuscode'] == 200) {
        return responseBody['otp'].toString();
      } else {
        return 'email not found';
      }
    } catch (e) {
      return 'email not found';
    }
  }
}
