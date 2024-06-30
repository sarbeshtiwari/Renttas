import 'dart:convert';

class AddPropertyModel {
  final String propertyName;
  final String location;
  final String subPropertyName;
  final String pincode;

  AddPropertyModel(
      {required this.propertyName,
      required this.location,
      required this.subPropertyName,
      required this.pincode});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'propertyName': propertyName,
      'location': location,
      'subPropertyName': subPropertyName,
      'pincode': pincode,
    };
  }

  factory AddPropertyModel.fromMap(Map<String, dynamic> map) {
    return AddPropertyModel(
      propertyName: map['propertyName'] as String,
      location: map['location'] as String,
      subPropertyName: map['subPropertyName'] as String,
      pincode: map['pincode'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AddPropertyModel.fromJson(String source) =>
      AddPropertyModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
