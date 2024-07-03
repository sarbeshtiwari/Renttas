import 'dart:convert';
import 'package:get/get.dart';
import 'package:renttas/application/property_select/propertyselecter_bloc.dart';
import 'package:renttas/core/api/apis.dart';
import 'package:http/http.dart' as http;
import 'package:renttas/domain/models/getReport/get_report.dart';

class GetReportController extends GetxController {
  var isLoading = false.obs;
  var reportList = <GetReport>[].obs;

  Future<void> getReportYear(duration) async {
    isLoading.value = true;
    Map<String, dynamic> req = {
      "userid": '1',
      "propertyid": currentPropertyId,
      "duration": duration,
    };

    try {
      final response = await http.post(
        Uri.parse(Api.getAccountReportBasedonYear),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode(req),
      );

      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);

        if (responseBody['statuscode'] == 200) {
          final data = GetReport.fromJson(responseBody);
          reportList.value = [data];
        } else {
          reportList.clear();
        }
      } else {
        print('Failed to load Data: Status code ${response.statusCode}');
        reportList.clear();
      }
    } catch (e) {
      print('Exception caught: $e');
      reportList.clear();
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getReportMonth(int duration) async {
    isLoading.value = true;
    Map<String, dynamic> req = {
      "userid": 'userid',
      "propertyid": currentPropertyId,
      "duration": duration,
    };

    try {
      final response = await http.post(
        Uri.parse(Api.getAccountReportBasedonYear),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode(req),
      );

      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);

        if (responseBody['statuscode'] == 200) {
          final data = GetReport.fromJson(responseBody);
          reportList.value = [data];
        } else {
          reportList.clear();
        }
      } else {
        print('Failed to load Data: Status code ${response.statusCode}');
        reportList.clear();
      }
    } catch (e) {
      print('Exception caught: $e');
      reportList.clear();
    } finally {
      isLoading.value = false;
    }
  }
}
