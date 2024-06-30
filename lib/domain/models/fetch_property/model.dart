// import 'dart:convert';

// class FetchPropertyModel {
//   final String id;
//   final String uid;
//   final String propertyName;
//   final String location;
//   final String createdAt;
//   final String updatedAt;
//   final String propertyTypeId;
//   final String pin;
//   final String subPrpertyName;
//   final String subpropertyId;

//   FetchPropertyModel(
//       {required this.id,
//       required this.uid,
//       required this.propertyName,
//       required this.location,
//       required this.createdAt,
//       required this.updatedAt,
//       required this.propertyTypeId,
//       required this.pin,
//       required this.subPrpertyName,
//       required this.subpropertyId});

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'id': id,
//       'uid': uid,
//       'propertyName': propertyName,
//       'location': location,
//       'createdAt': createdAt,
//       'updatedAt': updatedAt,
//       'propertyTypeId': propertyTypeId,
//       'pin': pin,
//       'subPrpertyName': subPrpertyName,
//       'subpropertyId': subpropertyId,
//     };
//   }

//   factory FetchPropertyModel.fromMap(Map<String, dynamic> map) {
//     return FetchPropertyModel(
//       id: map['id'] as String,
//       uid: map['uid'] as String,
//       propertyName: map['propertyName'] as String,
//       location: map['location'] as String,
//       createdAt: map['createdAt'] as String,
//       updatedAt: map['updatedAt'] as String,
//       propertyTypeId: map['propertyTypeId'] as String,
//       pin: map['pin'] as String,
//       subPrpertyName: map['subPrpertyName'] as String,
//       subpropertyId: map['subpropertyId'] as String,
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory FetchPropertyModel.fromJson(String source) =>
//       FetchPropertyModel.fromMap(json.decode(source) as Map<String, dynamic>);
// }
import 'dart:convert';

class FetchPropertyModel {
  final String id;
  final String uid;
  final String propertyName;
  final String location;
  final String createdAt;
  final String updatedAt;
  final String propertyTypeId;
  final String pin;
  final String subPrpertyName;
  final String subpropertyId;

  FetchPropertyModel({
    required this.id,
    required this.uid,
    required this.propertyName,
    required this.location,
    required this.createdAt,
    required this.updatedAt,
    required this.propertyTypeId,
    required this.pin,
    required this.subPrpertyName,
    required this.subpropertyId,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'uid': uid,
      'propertyName': propertyName,
      'location': location,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'propertyTypeId': propertyTypeId,
      'pin': pin,
      'subPrpertyName': subPrpertyName,
      'subpropertyId': subpropertyId,
    };
  }

  factory FetchPropertyModel.fromMap(Map<String, dynamic> map) {
    return FetchPropertyModel(
      id: map['id'] as String,
      uid: map['landlordId'] as String,
      propertyName: map['propertyName'] as String,
      location: map['location'] as String,
      createdAt: map['createdAt'] as String,
      updatedAt: map['updatedAt'] as String,
      propertyTypeId: map['propertyTypeId'] as String,
      pin: map['pin'] as String,
      subPrpertyName:
          map['subproperty'] is List && map['subproperty'].isNotEmpty
              ? map['subproperty'][0]['subPropertyName'] as String
              : '',
      subpropertyId: map['subproperty'] is List && map['subproperty'].isNotEmpty
          ? map['subproperty'][0]['id'] as String
          : '',
    );
  }

  String toJson() => json.encode(toMap());

  factory FetchPropertyModel.fromJson(String source) =>
      FetchPropertyModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
