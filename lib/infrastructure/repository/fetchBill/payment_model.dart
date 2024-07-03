import 'dart:convert';

PaymentRecieve paymentRecieveFromJson(String str) => PaymentRecieve.fromJson(json.decode(str));

String paymentRecieveToJson(PaymentRecieve data) => json.encode(data.toJson());

class PaymentRecieve {
    int statuscode;
    List<Datum> data;

    PaymentRecieve({
        required this.statuscode,
        required this.data,
    });

    factory PaymentRecieve.fromJson(Map<String, dynamic> json) => PaymentRecieve(
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
    String billid;
    String transferthrough;
    DateTime date;
    String receivedamount;

    Datum({
        required this.id,
        required this.billid,
        required this.transferthrough,
        required this.date,
        required this.receivedamount,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["Id"],
        billid: json["billid"],
        transferthrough: json["transferthrough"],
        date: DateTime.parse(json["date"]),
        receivedamount: json["receivedamount"],
    );

    Map<String, dynamic> toJson() => {
        "Id": id,
        "billid": billid,
        "transferthrough": transferthrough,
        "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "receivedamount": receivedamount,
    };
}
