import 'package:shared_preferences/shared_preferences.dart';

class UserModel {
  String name;
  String uid;
  String mobileNo;
  String email;
  String? role;
  UserModel(
      {required this.name,
      required this.uid,
      required this.mobileNo,
      required this.email,
      this.role});
}

// storing the user credential to sharedpreference
UserModel? userModel;

void addValuesToUserModel(response) async {
  userModel = UserModel(
    name: response['data']['name'],
    uid: response['data']['id'],
    mobileNo: response['data']['mobileNo'],
    email: response['data']['email'],
    // role: '',
  );
  await storeUserModel(userModel!);
}

Future<void> storeUserModel(UserModel userModel) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  prefs.setString('name', userModel.name);
  prefs.setString('uid', userModel.uid);
  prefs.setString('mobileNo', userModel.mobileNo);
  prefs.setString('email', userModel.email);
  // prefs.setString('role', userModel.role);
}

Future<void> getUserModel() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  String? name = prefs.getString('name');
  String? uid = prefs.getString('uid');
  String? mobileNo = prefs.getString('mobileNo');
  String? email = prefs.getString('email');
  // String? role = prefs.getString('role');

  if (name != null && uid != null && mobileNo != null && email != null) {
    userModel = UserModel(
      name: name,
      uid: uid,
      mobileNo: mobileNo,
      email: email,
      // role: role,
    );
  }
}
