import 'dart:convert';

class PropertyBillFetchModel {
  final String billId;
  final String landlordID;
  final String propertyID;
  final String subpropertyID;
  final String rentCycle;
  final String rentStartDate;
  final String? rentEndDate;
  final String? collectedBy;
  final String previousBalance;
  final String rentAmount;
  final String maintenanceAmount;
  final String totalAmount;
  final String electricityType;
  final String? electricCharge;
  final String waterBillType;
  final String? waterBillCharge;
  final String gasBillType;
  final String? gasBillCharge;
  final String createdAt;
  final String updatedAt;
  final String mobileNumber;

  PropertyBillFetchModel({
    required this.billId,
    required this.landlordID,
    required this.propertyID,
    required this.subpropertyID,
    required this.rentCycle,
    required this.rentStartDate,
    this.rentEndDate,
    this.collectedBy,
    required this.previousBalance,
    required this.rentAmount,
    required this.maintenanceAmount,
    required this.totalAmount,
    required this.electricityType,
    this.electricCharge,
    required this.waterBillType,
    this.waterBillCharge,
    required this.gasBillType,
    this.gasBillCharge,
    required this.createdAt,
    required this.updatedAt,
    required this.mobileNumber,
  });

  Map<String, dynamic> toMap() {
    return {
      'billId': billId,
      'landlordID': landlordID,
      'propertyID': propertyID,
      'subpropertyID': subpropertyID,
      'rentCycle': rentCycle,
      'rentStartDate': rentStartDate,
      'rentEndDate': rentEndDate,
      'collectedBy': collectedBy,
      'previousBalance': previousBalance,
      'rentAmount': rentAmount,
      'maintenanceAmount': maintenanceAmount,
      'totalAmount': totalAmount,
      'electricityType': electricityType,
      'electricCharge': electricCharge,
      'waterBillType': waterBillType,
      'waterBillCharge': waterBillCharge,
      'gasBillType': gasBillType,
      'gasBillCharge': gasBillCharge,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'mobileNumber': mobileNumber,
    };
  }

  factory PropertyBillFetchModel.fromMap(Map<String, dynamic> map) {
    return PropertyBillFetchModel(
      billId: map['id'] as String,
      landlordID: map['landlordId'] as String,
      propertyID: map['propertyId'] as String,
      subpropertyID: map['subpropertyId'] as String,
      rentCycle: map['rentCycle'] as String,
      rentStartDate: map['rentStartData'] as String,
      rentEndDate: map['rentEndDate'] as String?,
      collectedBy: map['collectdBy'] as String?,
      previousBalance: map['perviousBalance'] as String,
      rentAmount: map['rentAmount'] as String,
      maintenanceAmount: map['maintenanceAmount'] as String,
      totalAmount: map['totalAmount'] as String,
      electricityType: map['electricityType'] as String,
      electricCharge: map['electricCharge'] as String?,
      waterBillType: map['waterBillType'] as String,
      waterBillCharge: map['waterBillCharge'] as String?,
      gasBillType: map['gasBillType'] as String,
      gasBillCharge: map['gasBillCharge'] as String?,
      createdAt: map['createdAt'] as String,
      updatedAt: map['updatedAt'] as String,
      mobileNumber: map['mobileNumber'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PropertyBillFetchModel.fromJson(String source) =>
      PropertyBillFetchModel.fromMap(
          json.decode(source) as Map<String, dynamic>);
}
