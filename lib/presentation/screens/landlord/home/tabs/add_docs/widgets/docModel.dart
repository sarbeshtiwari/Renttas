// To parse this JSON data, do
//
//     final getDocumentModel = getDocumentModelFromJson(jsonString);

import 'dart:convert';

List<GetDocumentModel> getDocumentModelFromJson(String str) => List<GetDocumentModel>.from(json.decode(str).map((x) => GetDocumentModel.fromJson(x)));

String getDocumentModelToJson(List<GetDocumentModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetDocumentModel {
    String id;
    String propertyid;
    String subPropertyid;
    String imageName;
    String doctype;
    String docname;
    String createdAt;
    String updatedAt;

    GetDocumentModel({
        required this.id,
        required this.propertyid,
        required this.subPropertyid,
        required this.imageName,
        required this.doctype,
        required this.docname,
        required this.createdAt,
        required this.updatedAt,
    });

    factory GetDocumentModel.fromJson(Map<String, dynamic> json) => GetDocumentModel(
        id: json["id"],
        propertyid: json["propertyid"],
        subPropertyid: json["subPropertyid"],
        imageName: json["ImageName"],
        doctype: json["doctype"],
        docname: json["docname"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "propertyid": propertyid,
        "subPropertyid": subPropertyid,
        "ImageName": imageName,
        "doctype": doctype,
        "docname": docname,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
    };
}
