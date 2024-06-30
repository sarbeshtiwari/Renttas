// import 'dart:convert';

// import 'package:http/http.dart' as http;
// import 'package:renttas/core/api/apis.dart';
// import 'package:renttas/domain/models/fetch_property/model.dart';

// // Map<String, dynamic> req = {"landlordId": uid};
// class FetchPropertyRepo {
//   Future<List<FetchPropertyModel>> fetchProperty(String uid) async {
//     List<FetchPropertyModel> propertyList = [];

//     try {
//       final response = await http.get(
//         Uri.parse(Api.getProperty),
//         headers: {"landlordId": uid},
//       );

//       if (response.statusCode == 200) {
//         final responseBody = json.decode(response.body);
//         propertyList.addAll(responseBody);
//         return propertyList;
//       } else {
//         return [];
//       }
//     } catch (e) {
//       return [];
//     }
//   }
// }
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:renttas/core/api/apis.dart';
import 'package:renttas/domain/models/fetch_property/model.dart';

class FetchPropertyRepo {
  Future<List<FetchPropertyModel>> fetchProperty(String uid) async {
    List<FetchPropertyModel> propertyList = [];

    try {
      final response = await http.post(
        Uri.parse(Api.getProperty),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'landlordId': uid}),
      );

      if (response.statusCode == 200) {
        final responseBody = json.decode(response.body);
        if (responseBody['respCode'] == "200" && responseBody['data'] is List) {
          propertyList = (responseBody['data'] as List).map((item) {
            return FetchPropertyModel.fromMap(item as Map<String, dynamic>);
          }).toList();
        }
        return propertyList;
      } else {
        return [];
      }
    } catch (e) {
      print('Error fetching properties: $e');
      return [];
    }
  }
}
