// To parse this JSON data, do
//
//     final getExpensesModel = getExpensesModelFromJson(jsonString);

import 'dart:convert';

List<GetExpensesModel> getExpensesModelFromJson(String str) =>
    List<GetExpensesModel>.from(
        json.decode(str).map((x) => GetExpensesModel.fromJson(x)));

String getExpensesModelToJson(List<GetExpensesModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetExpensesModel {
  String id;
  String landlordId;
  String propertyId;
  String subPropertyId;
  String category;
  String name;
  DateTime expensesDate;
  String description;
  DateTime createdAt;
  DateTime updatedAt;
  String expenseType;
  String amount;

  GetExpensesModel(
      {required this.id,
      required this.landlordId,
      required this.propertyId,
      required this.subPropertyId,
      required this.category,
      required this.name,
      required this.expensesDate,
      required this.description,
      required this.createdAt,
      required this.updatedAt,
      required this.expenseType,
      required this.amount});

  factory GetExpensesModel.fromJson(Map<String, dynamic> json) =>
      GetExpensesModel(
          id: json["id"],
          landlordId: json["landlordId"],
          propertyId: json["propertyId"],
          subPropertyId: json["subPropertyId"],
          category: json["category"] ?? 'No Data',
          name: json["name"] ?? 'No Data',
          expensesDate: DateTime.parse(json["expensesDate"]),
          description: json["description"] ?? 'No Data',
          createdAt: DateTime.parse(json["createdAt"]),
          updatedAt: DateTime.parse(json["updatedAt"]),
          expenseType: json["expenseType"] ?? 'No Data',
          amount: json["amount"] ?? 'No Data');

  Map<String, dynamic> toJson() => {
        "id": id,
        "landlordId": landlordId,
        "propertyId": propertyId,
        "subPropertyId": subPropertyId,
        "category": category,
        "name": name,
        "expensesDate": expensesDate.toIso8601String(),
        "description": description,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "expenseType": expenseType,
        "amount": amount
      };
}
