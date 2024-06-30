import 'dart:convert';

class NewPasswordModel {
  final String newpassword;
  final String conformPassword;

  NewPasswordModel({required this.newpassword, required this.conformPassword});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'newpassword': newpassword,
      'conformPassword': conformPassword,
    };
  }

  factory NewPasswordModel.fromMap(Map<String, dynamic> map) {
    return NewPasswordModel(
      newpassword: map['newpassword'] as String,
      conformPassword: map['conformPassword'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory NewPasswordModel.fromJson(String source) =>
      NewPasswordModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
