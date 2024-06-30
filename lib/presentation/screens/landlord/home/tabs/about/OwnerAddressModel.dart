import 'dart:convert';

OwnerAddressModel ownerAddressModelFromJson(String str) =>
    OwnerAddressModel.fromJson(json.decode(str));

String ownerAddressModelToJson(OwnerAddressModel data) =>
    json.encode(data.toJson());

class OwnerAddressModel {
  String id;
  String address;
  String pincode;
  int statuscode;

  OwnerAddressModel({
    required this.id,
    required this.address,
    required this.pincode,
    required this.statuscode,
  });

  factory OwnerAddressModel.fromJson(Map<String, dynamic> json) =>
      OwnerAddressModel(
        id: json["Id"],
        address: json["address"],
        pincode: json["pincode"],
        statuscode: json["statuscode"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "address": address,
        "pincode": pincode,
        "statuscode": statuscode,
      };
}
