import 'dart:convert';
import 'package:get/get.dart';
import 'package:renttas/application/property_select/propertyselecter_bloc.dart';
import 'package:renttas/core/api/apis.dart';
import 'package:http/http.dart' as http;
import 'package:renttas/domain/models/user_model/model.dart';
import 'package:renttas/presentation/screens/landlord/home/tabs/add_docs/widgets/docModel.dart';

class GetDocument extends GetxController {
  var isLoading = false.obs;
  var documentList = <GetDocumentModel>[].obs;

  Future<void> getDocument() async {
    isLoading.value = true;
    Map<String, dynamic> req = {
      // "landlordId": "cf8b7bf5-a84d-49dd-b25e-f02a6ae5f748",
      "propertyId": currentPropertyId,
      "subPropertyId": currentSubpropertyId,
    };

    try {
      final response = await http.post(
        Uri.parse(Api.getDocument),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode(req),
      );
      final responseBody = jsonDecode(response.body);

      if (response.statusCode == 200) {
        print("documnet fetched");
        documentList.value = (responseBody['data'] as List)
            .map((item) => GetDocumentModel.fromJson(item))
            .toList();
      } else {
        print('Failed to fetch documents: Status code ${response.statusCode}');
        throw Exception('Failed to fetch documents');
      }
    } catch (e) {
      print('Exception caught: $e');
      throw Exception('Failed to fetch documents');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getDocumentByMobile() async {
    isLoading.value = true;
    Map<String, dynamic> req = {
      "mobileNumber": userModel?.mobileNo,
    };

    try {
      final response = await http.post(
        Uri.parse(Api.getDocumentByMobile),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode(req),
      );
      final responseBody = jsonDecode(response.body);

      if (response.statusCode == 200) {
        print("documnet fetched");
        documentList.value = (responseBody['data'] as List)
            .map((item) => GetDocumentModel.fromJson(item))
            .toList();
      } else {
        print('Failed to fetch documents: Status code ${response.statusCode}');
        throw Exception('Failed to fetch documents');
      }
    } catch (e) {
      print('Exception caught: $e');
      throw Exception('Failed to fetch documents');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> deleteDocument(String id) async {
    isLoading.value = true;
    Map<String, dynamic> req1 = {"docid": id};
    try {
      final response = await http.delete(
        Uri.parse(Api.deleteDocument),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode(req1),
      );
      if (response.statusCode == 200) {
        documentList.removeWhere((document) => document.id == id);
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
