import 'dart:convert';
import 'package:get/get.dart';
import 'package:renttas/application/property_select/propertyselecter_bloc.dart';
import 'package:renttas/core/api/apis.dart';
import 'package:http/http.dart' as http;
import 'package:renttas/presentation/screens/landlord/premium/widget/model.dart';

class GetPremium extends GetxController {
  var isLoading = false.obs;
  var premiumList = <PremiumModel>[].obs;

  Future<void> getPremiumReq() async {
    isLoading.value = true;
    Map<String, dynamic> req = {
      "userid": currentPropertyId,
      "countrycode": "IN"
    };

    try {
      final response = await http.post(
        Uri.parse(Api.getPremiumPackages),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode(req),
      );

      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);

        if (responseBody['statuscode'] == 200 && responseBody['data'] is List) {
          // premiumList.value = (responseBody['data'] as List).map((item) {
          //   //return PremiumModel.fromMap(item as Map<String, dynamic>);
          // }).toList();
        } else {
          premiumList.clear();
        }
      } else {
        print('Failed to load premiums: Status code ${response.statusCode}');
        premiumList.clear();
        throw Exception('Failed to load premiums');
      }
    } catch (e) {
      print('Exception caught: $e');
      premiumList.clear();
      throw Exception('Failed to load premiums');
    } finally {
      isLoading.value = false;
    }
  }

  
}
