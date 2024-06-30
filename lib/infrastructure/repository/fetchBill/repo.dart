// import 'dart:convert';
// import 'package:renttas/core/api/apis.dart';
// import 'package:renttas/domain/models/bill_fetch/model.dart';
// import 'package:http/http.dart' as http;

// class FetchBillRepo {
//   static Future<List<PropertyBillFetchModel>> billFetch(
//       String propertyId, String subPropertyId) async {
//     Map<String, dynamic> request = {
//       "propertyId": propertyId,
//       "subPropertyId": subPropertyId
//     };
//     List<PropertyBillFetchModel> billList = [];
//     try {
//       final response = await http.post(
//         Uri.parse(Api.propertyBillFetch),
//         body: json.encode(request),
//       );
//       if (response.statusCode == 200) {
//         print('object');
//         final responseBody = json.decode(response.body);
//         if (responseBody['statuscode'] == 200 && responseBody["data"] is List) {
//           billList = (responseBody['data'] as List).map((item) {
//             return PropertyBillFetchModel.fromMap(item as Map<String, dynamic>);
//           }).toList();
//         }
//         return billList;
//       } else {
//         return [];
//       }
//     } catch (e) {
//       return [];
//     }
//   }
// }

import 'dart:convert';
import 'package:get/get.dart';
import 'package:renttas/core/api/apis.dart';
import 'package:renttas/domain/models/bill_fetch/model.dart';
import 'package:http/http.dart' as http;
import 'package:renttas/domain/models/user_model/model.dart';

class FetchBillRepo extends GetxController {
  var isLoading = false.obs;
  var billList = <PropertyBillFetchModel>[].obs;

  Future<void> billFetch(String propertyId, String subPropertyId) async {
    var isLoading = false.obs;
    Map<String, dynamic> request = {
      "propertyId": propertyId,
      "subPropertyId": subPropertyId
    };

    try {
      final response = await http.post(
        Uri.parse(Api.propertyBillFetch),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode(request),
      );
      print(response.statusCode);

      if (response.statusCode == 200) {
        final responseBody = json.decode(response.body);
        print(responseBody);

        if (responseBody['statuscode'] == 200 && responseBody["data"] is List) {
          billList.value = (responseBody['data'] as List).map((item) {
            return PropertyBillFetchModel.fromMap(item as Map<String, dynamic>);
          }).toList();
        } else {
          billList.clear();
        }
      } else {
        billList.clear();
      }
    } catch (e) {
      billList.clear();
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> billFetchByMobile() async {
    var isLoading = false.obs;
    Map<String, dynamic> request = {"mobileNumber": userModel!.mobileNo};

    try {
      final response = await http.post(
        Uri.parse(Api.getBillByMobile),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode(request),
      );
      print(response.body);

      if (response.statusCode == 200) {
        final responseBody = json.decode(response.body);

        if (responseBody['statuscode'] == 200 && responseBody["data"] is List) {
          billList.value = (responseBody['data'] as List).map((item) {
            return PropertyBillFetchModel.fromMap(item as Map<String, dynamic>);
          }).toList();
        } else {
          billList.clear();
        }
      } else {
        billList.clear();
      }
    } catch (e) {
      billList.clear();
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> deleteBill(String id) async {
    isLoading.value = true;
    Map<String, dynamic> req1 = {"billid": id};

    try {
      final response = await http.delete(
        Uri.parse(Api.deleteBill),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode(req1),
      );
      if (response.statusCode == 200) {
        billList.removeWhere((billList) => billList.billId == id);
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
}
