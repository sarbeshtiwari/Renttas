import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:renttas/core/api/apis.dart';

class DeletePropertyRepo {
  static Future<bool> deleteProperty(String id) async {
    Map<String, dynamic> request = {"id": id};

    try {
      final response = await http.post(Uri.parse(Api.deleteProperty),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(request));
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
