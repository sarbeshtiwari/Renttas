import 'dart:convert';

class AddTenantModel {
  final String propertyid;
  final String subPropertyId;
  final String tenantName;
  final String tenantEmail;
  final String advanceAmount;
  final String mobileNumber;
  final String startDate;
  final String endDate;
  final String uid;

  AddTenantModel(
      {required this.propertyid,
      required this.subPropertyId,
      required this.tenantName,
      required this.tenantEmail,
      required this.advanceAmount,
      required this.mobileNumber,
      required this.startDate,
      required this.endDate,
      required this.uid});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'propertyid': propertyid,
      'subPropertyId': subPropertyId,
      'tenantName': tenantName,
      'tenantEmail': tenantEmail,
      'advanceAmount': advanceAmount,
      'mobileNumber': mobileNumber,
      'startDate': startDate,
      'endDate': endDate,
      'uid': uid,
    };
  }

  factory AddTenantModel.fromMap(Map<String, dynamic> map) {
    return AddTenantModel(
      propertyid: map['propertyid'] as String,
      subPropertyId: map['subPropertyId'] as String,
      tenantName: map['tenantName'] as String,
      tenantEmail: map['tenantEmail'] as String,
      advanceAmount: map['advanceAmount'] as String,
      mobileNumber: map['mobileNumber'] as String,
      startDate: map['startDate'] as String,
      endDate: map['endDate'] as String,
      uid: map['uid'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AddTenantModel.fromJson(String source) =>
      AddTenantModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
