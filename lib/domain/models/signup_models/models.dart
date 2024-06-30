// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SignUpModels {
  String name;
  String mobileNo;
  String currency;
  String email;
  String address;
  String password;
  String role;
  SignUpModels({
    required this.name,
    required this.mobileNo,
    required this.currency,
    required this.email,
    required this.address,
    required this.password,
    required this.role,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'mobileNo': mobileNo,
      'currency': currency,
      'email': email,
      'address': address,
      'password': password,
      'role': role,
    };
  }

  factory SignUpModels.fromMap(Map<String, dynamic> map) {
    return SignUpModels(
      name: map['name'] as String,
      mobileNo: map['mobileNo'] as String,
      currency: map['currency'] as String,
      email: map['email'] as String,
      address: map['address'] as String,
      password: map['password'] as String,
      role: map['role'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SignUpModels.fromJson(String source) =>
      SignUpModels.fromMap(json.decode(source) as Map<String, dynamic>);
}
