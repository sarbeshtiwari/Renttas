import 'dart:convert';

GetReport getReportFromJson(String str) => GetReport.fromJson(json.decode(str));

String getReportToJson(GetReport data) => json.encode(data.toJson());

class GetReport {
  Data data;
  int statuscode;

  GetReport({
    required this.data,
    required this.statuscode,
  });

  factory GetReport.fromJson(Map<String, dynamic> json) => GetReport(
        data: Data.fromJson(json["data"]),
        statuscode: json["statuscode"],
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "statuscode": statuscode,
      };
}

class Data {
  int revenueamount;
  int expenseamount;
  List<Map<String, String?>> expensedetail;
  List<Revenuedetail> revenuedetail;
  int totalamount;

  Data({
    required this.revenueamount,
    required this.expenseamount,
    required this.expensedetail,
    required this.revenuedetail,
    required this.totalamount,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        revenueamount: json["revenueamount"],
        expenseamount: json["expenseamount"],
        expensedetail: List<Map<String, String?>>.from(json["expensedetail"]
            .map((x) => Map.from(x).map((k, v) => MapEntry<String, String?>(k, v)))),
        revenuedetail: List<Revenuedetail>.from(
            json["revenuedetail"].map((x) => Revenuedetail.fromJson(x))),
        totalamount: json["totalamount"],
      );

  Map<String, dynamic> toJson() => {
        "revenueamount": revenueamount,
        "expenseamount": expenseamount,
        "expensedetail": List<dynamic>.from(
            expensedetail.map((x) => Map.from(x).map((k, v) => MapEntry<String, dynamic>(k, v)))),
        "revenuedetail": List<dynamic>.from(revenuedetail.map((x) => x.toJson())),
        "totalamount": totalamount,
      };
}

class Revenuedetail {
  String id;
  String landlordId;
  String propertyId;
  String subpropertyId;
  String rentCycle;
  DateTime rentStartData;
  String rentEndDate;
  String collectdBy;
  String perviousBalance;
  String rentAmount;
  String maintenanceAmount;
  String totalAmount;
  String electricityType;
  String electricCharge;
  String waterBillType;
  String waterBillCharge;
  String gasBillType;
  String gasBillCharge;
  DateTime createdAt;
  DateTime updatedAt;
  String collectRentDate;
  String previousBalance;
  String extraCharge;

  Revenuedetail({
    required this.id,
    required this.landlordId,
    required this.propertyId,
    required this.subpropertyId,
    required this.rentCycle,
    required this.rentStartData,
    required this.rentEndDate,
    required this.collectdBy,
    required this.perviousBalance,
    required this.rentAmount,
    required this.maintenanceAmount,
    required this.totalAmount,
    required this.electricityType,
    required this.electricCharge,
    required this.waterBillType,
    required this.waterBillCharge,
    required this.gasBillType,
    required this.gasBillCharge,
    required this.createdAt,
    required this.updatedAt,
    required this.collectRentDate,
    required this.previousBalance,
    required this.extraCharge,
  });

  factory Revenuedetail.fromJson(Map<String, dynamic> json) => Revenuedetail(
        id: json["id"],
        landlordId: json["landlordId"],
        propertyId: json["propertyId"],
        subpropertyId: json["subpropertyId"],
        rentCycle: json["rentCycle"],
        rentStartData: DateTime.parse(json["rentStartData"]),
        rentEndDate: json["rentEndDate"],
        collectdBy: json["collectdBy"],
        perviousBalance: json["perviousBalance"],
        rentAmount: json["rentAmount"],
        maintenanceAmount: json["maintenanceAmount"],
        totalAmount: json["totalAmount"],
        electricityType: json["electricityType"],
        electricCharge: json["electricCharge"],
        waterBillType: json["waterBillType"],
        waterBillCharge: json["waterBillCharge"],
        gasBillType: json["gasBillType"],
        gasBillCharge: json["gasBillCharge"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        collectRentDate: json["collectRentDate"],
        previousBalance: json["previousBalance"],
        extraCharge: json["extraCharge"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "landlordId": landlordId,
        "propertyId": propertyId,
        "subpropertyId": subpropertyId,
        "rentCycle": rentCycle,
        "rentStartData":
            "${rentStartData.year.toString().padLeft(4, '0')}-${rentStartData.month.toString().padLeft(2, '0')}-${rentStartData.day.toString().padLeft(2, '0')}",
        "rentEndDate": rentEndDate,
        "collectdBy": collectdBy,
        "perviousBalance": perviousBalance,
        "rentAmount": rentAmount,
        "maintenanceAmount": maintenanceAmount,
        "totalAmount": totalAmount,
        "electricityType": electricityType,
        "electricCharge": electricCharge,
        "waterBillType": waterBillType,
        "waterBillCharge": waterBillCharge,
        "gasBillType": gasBillType,
        "gasBillCharge": gasBillCharge,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "collectRentDate": collectRentDate,
        "previousBalance": previousBalance,
        "extraCharge": extraCharge,
      };
}
