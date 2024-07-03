import 'dart:convert';
import 'package:get/get.dart';
import 'package:renttas/application/property_select/propertyselecter_bloc.dart';
import 'package:renttas/core/api/apis.dart';
import 'package:http/http.dart' as http;
import 'package:renttas/presentation/screens/landlord/premium/widget/model.dart';

class BuyPremium extends GetxController {
  var isLoading = false.obs;

  Future<void> buyPremiumReq(packageid) async {
    isLoading.value = true;
    print(currentPropertyId);
    Map<String, dynamic> req = {
      "userid": currentPropertyId,
      "packageid": packageid
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

        if (responseBody['statuscode'] == 200) {
          print('object');
          Get.back();
        } else {}
      } else {
        print('Failed to load premiums: Status code ${response.statusCode}');

        throw Exception('Failed to load premiums');
      }
    } catch (e) {
      print('Exception caught: $e');
      throw Exception('Failed to load premiums');
    } finally {
      isLoading.value = false;
    }
  }
}
