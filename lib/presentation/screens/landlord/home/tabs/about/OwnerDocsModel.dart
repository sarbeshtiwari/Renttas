// To parse this JSON data, do
//
//     final ownerDocModel = ownerDocModelFromJson(jsonString);

import 'dart:convert';

OwnerDocModel ownerDocModelFromJson(String str) => OwnerDocModel.fromJson(json.decode(str));

String ownerDocModelToJson(OwnerDocModel data) => json.encode(data.toJson());

class OwnerDocModel {
    int statuscode;
    List<Datum> data;

    OwnerDocModel({
        required this.statuscode,
        required this.data,
    });

    factory OwnerDocModel.fromJson(Map<String, dynamic> json) => OwnerDocModel(
        statuscode: json["statuscode"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "statuscode": statuscode,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    String id;
    String propertyid;
    String subPropertyid;
    String imageName;
    String docname;
    DateTime createdAt;
    DateTime updatedAt;
    String propertyownername;

    Datum({
        required this.id,
        required this.propertyid,
        required this.subPropertyid,
        required this.imageName,
        required this.docname,
        required this.createdAt,
        required this.updatedAt,
        required this.propertyownername,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        propertyid: json["propertyid"],
        subPropertyid: json["subPropertyid"],
        imageName: json["ImageName"],
        docname: json["docname"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        propertyownername: json["propertyownername"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "propertyid": propertyid,
        "subPropertyid": subPropertyid,
        "ImageName": imageName,
        "docname": docname,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "propertyownername": propertyownername,
    };
}
