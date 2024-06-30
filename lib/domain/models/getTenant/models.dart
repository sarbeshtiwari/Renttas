import 'dart:convert';

class GetTenantModel {
  final String id;
  final String propertyId;
  final String subPropertyId;
  final String tenantName;
  final String phone;
  final String email;
  final String advanceAmount;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String landlordId;
  final DateTime startDate;
  final DateTime endDate;
  final String address;
  String? expensesDate;
  String? name;
  String? description;

  GetTenantModel({
    required this.id,
    required this.propertyId,
    required this.subPropertyId,
    required this.tenantName,
    required this.phone,
    required this.email,
    required this.advanceAmount,
    required this.createdAt,
    required this.updatedAt,
    required this.landlordId,
    required this.startDate,
    required this.endDate,
    required this.address,
    this.expensesDate,
    this.name,
    this.description,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'propertyId': propertyId,
      'subPropertyId': subPropertyId,
      'tenantName': tenantName,
      'phone': phone,
      'email': email,
      'advanceAmount': advanceAmount,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'landlordId': landlordId,
      'startDate': startDate.toIso8601String(),
      'endDate': endDate.toIso8601String(),
      'address': address,
      'expensesDate': expensesDate,
      'name': name,
      'description': description,
    };
  }

  factory GetTenantModel.fromMap(Map<String, dynamic> map) {
    return GetTenantModel(
      id: map['id'],
      propertyId: map['propertyId'],
      subPropertyId: map['subPropertyId'],
      tenantName: map['tenantName'],
      phone: map['phone'],
      email: map['email'],
      advanceAmount: map['advanceAmount'],
      createdAt: map['createdAt'] == "0000-00-00 00:00:00"
          ? DateTime(1970, 1, 1)
          : DateTime.parse(map['createdAt']),
      updatedAt: map['updatedAt'] == "0000-00-00 00:00:00"
          ? DateTime(1970, 1, 1)
          : DateTime.parse(map['updatedAt']),
      landlordId: map['landlordId'],
      startDate: DateTime.parse(map['startDate']),
      endDate: DateTime.parse(map['endDate']),
      address: map['address'],
      expensesDate: map['expensesDate'],
      name: map['name'],
      description: map['description'],
    );
  }

  String toJson() => json.encode(toMap());

  factory GetTenantModel.fromJson(String source) =>
      GetTenantModel.fromMap(json.decode(source));
}
