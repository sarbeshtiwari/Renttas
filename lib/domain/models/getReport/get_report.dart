// To parse this JSON data, do
//
//     final getReport = getReportFromJson(jsonString);

import 'dart:convert';

GetReport getReportFromJson(String str) => GetReport.fromJson(json.decode(str));

String getReportToJson(GetReport data) => json.encode(data.toJson());

class GetReport {
  int revenueamount;
  int expenseamount;
  List<Expensedetail> expensedetail;

  GetReport({
    required this.revenueamount,
    required this.expenseamount,
    required this.expensedetail,
  });

  factory GetReport.fromJson(Map<String, dynamic> json) => GetReport(
    revenueamount: json["revenueamount"],
    expenseamount: json["expenseamount"],
    expensedetail: List<Expensedetail>.from(json["expensedetail"].map((x) => Expensedetail.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "revenueamount": revenueamount,
    "expenseamount": expenseamount,
    "expensedetail": List<dynamic>.from(expensedetail.map((x) => x.toJson())),
  };
}

class Expensedetail {
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

  Expensedetail({
    required this.id,
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
    required this.amount,
  });

  factory Expensedetail.fromJson(Map<String, dynamic> json) => Expensedetail(
    id: json["id"],
    landlordId: json["landlordId"],
    propertyId: json["propertyId"],
    subPropertyId: json["subPropertyId"],
    category: json["category"],
    name: json["name"],
    expensesDate: DateTime.parse(json["expensesDate"]),
    description: json["description"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    expenseType: json["expenseType"],
    amount: json["amount"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "landlordId": landlordId,
    "propertyId": propertyId,
    "subPropertyId": subPropertyId,
    "category": category,
    "name": name,
    "expensesDate": expensesDate,
    "description": description,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "expenseType": expenseType,
    "amount": amount,
  };
}
