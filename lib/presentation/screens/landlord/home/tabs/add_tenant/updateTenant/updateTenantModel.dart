// To parse this JSON data, do
//
//     final updateTenantModel = updateTenantModelFromJson(jsonString);

import 'dart:convert';

UpdateTenantModel updateTenantModelFromJson(String str) => UpdateTenantModel.fromJson(json.decode(str));

String updateTenantModelToJson(UpdateTenantModel data) => json.encode(data.toJson());

class UpdateTenantModel {
    String tenantid;
    String tenantName;
    String phone;
    String email;
    String advanceAmount;

    UpdateTenantModel({
        required this.tenantid,
        required this.tenantName,
        required this.phone,
        required this.email,
        required this.advanceAmount,
    });

    factory UpdateTenantModel.fromJson(Map<String, dynamic> json) => UpdateTenantModel(
        tenantid: json["tenantid"],
        tenantName: json["tenantName"],
        phone: json["phone"],
        email: json["email"],
        advanceAmount: json["advanceAmount"],
    );

    Map<String, dynamic> toJson() => {
        "tenantid": tenantid,
        "tenantName": tenantName,
        "phone": phone,
        "email": email,
        "advanceAmount": advanceAmount,
    };
}
