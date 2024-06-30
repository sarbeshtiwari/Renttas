// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UpdatePropertyModel {
  final String landlordId;
  final String propertyName;
  final String location;
  final String propertyTypeId;
  final String subPropertyName;
  final String pin;
  final String id;

  UpdatePropertyModel(
      {required this.landlordId,
      required this.propertyName,
      required this.location,
      required this.propertyTypeId,
      required this.subPropertyName,
      required this.pin,
      required this.id});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'landlordId': landlordId,
      'propertyName': propertyName,
      'location': location,
      'propertyTypeId': propertyTypeId,
      'subPropertyName': subPropertyName,
      'pin': pin,
      'id': id,
    };
  }

  factory UpdatePropertyModel.fromMap(Map<String, dynamic> map) {
    return UpdatePropertyModel(
      landlordId: map['landlordId'] as String,
      propertyName: map['propertyName'] as String,
      location: map['location'] as String,
      propertyTypeId: map['propertyTypeId'] as String,
      subPropertyName: map['subPropertyName'] as String,
      pin: map['pin'] as String,
      id: map['id'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UpdatePropertyModel.fromJson(String source) =>
      UpdatePropertyModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
