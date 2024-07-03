// To parse this JSON data, do
//
//     final premiumModel = premiumModelFromJson(jsonString);

import 'dart:convert';

List<PremiumModel> premiumModelFromJson(String str) => List<PremiumModel>.from(json.decode(str).map((x) => PremiumModel.fromJson(x)));

String premiumModelToJson(List<PremiumModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PremiumModel {
    String id;
    String userid;
    String amount;
    String validity;
    String mostpopular;

    PremiumModel({
        required this.id,
        required this.userid,
        required this.amount,
        required this.validity,
        required this.mostpopular,
    });

    factory PremiumModel.fromJson(Map<String, dynamic> json) => PremiumModel(
        id: json["Id"],
        userid: json["userid"],
        amount: json["amount"],
        validity: json["validity"],
        mostpopular: json["mostpopular"],
    );

    Map<String, dynamic> toJson() => {
        "Id": id,
        "userid": userid,
        "amount": amount,
        "validity": validity,
        "mostpopular": mostpopular,
    };
}
