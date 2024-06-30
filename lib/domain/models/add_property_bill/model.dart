// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AddPropertyBillModel {
  final String landlordId;
  final String propertyId;
  final String subpropertyId;
  final String rentCycle;
  final String rentAmount;
  final String maintananceAmount;
  final String totalamount;
  final String electricityType;
  final String waterbillType;
  final String gasBillType;
  final String extraCharges;
  final String mobileNumber;

  AddPropertyBillModel(
      {required this.landlordId,
      required this.propertyId,
      required this.subpropertyId,
      required this.rentCycle,
      required this.rentAmount,
      required this.maintananceAmount,
      required this.totalamount,
      required this.electricityType,
      required this.waterbillType,
      required this.gasBillType,
      required this.extraCharges, required this.mobileNumber});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'landlordId': landlordId,
      'propertyId': propertyId,
      'subpropertyId': subpropertyId,
      'rentCycle': rentCycle,
      'rentAmount': rentAmount,
      'maintananceAmount': maintananceAmount,
      'totalamount': totalamount,
      'electricityType': electricityType,
      'waterbillType': waterbillType,
      'gasBillType': gasBillType,
      'extraCharges': extraCharges,
      'mobileNumber': mobileNumber
    };
  }

  factory AddPropertyBillModel.fromMap(Map<String, dynamic> map) {
    return AddPropertyBillModel(
      landlordId: map['landlordId'] as String,
      propertyId: map['propertyId'] as String,
      subpropertyId: map['subpropertyId'] as String,
      rentCycle: map['rentCycle'] as String,
      rentAmount: map['rentAmount'] as String,
      maintananceAmount: map['maintananceAmount'] as String,
      totalamount: map['totalamount'] as String,
      electricityType: map['electricityType'] as String,
      waterbillType: map['waterbillType'] as String,
      gasBillType: map['gasBillType'] as String,
      extraCharges: map['extraCharges'] as String,
      mobileNumber: map['mobileNumber'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AddPropertyBillModel.fromJson(String source) =>
      AddPropertyBillModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
