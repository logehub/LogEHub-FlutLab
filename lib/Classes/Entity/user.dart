import 'package:shared_preferences/shared_preferences.dart';

class LoginUser {
  static final LoginUser _singleton = LoginUser._internal();
  factory LoginUser() {
    return _singleton;
  }
  LoginUser._internal();

  String id = "";
  String phoneNo = "";
  String name = "";
  String address = "";
  String pinCode = "";
  String city = "";
  String district = "";
  String state = "";
  String email = "";
  String companyId = "";
  String companyName = "";
  String authemailid = "";

  fromJson(Map<String, dynamic> json) {
    authemailid = "${json["authemailid"]}";
    id = json["id"];
    phoneNo = json["phoneno"];
    name = json["name"] == null ? "" : "${json["name"]}";
    email = json["email"] == null ? "" : "${json["email"]}";
    address = json["address"] == null ? "" : "${json["address"]}";
    pinCode = json["pincode"] == null ? "" : "${json["pincode"]}";
    city = json["city"] == null ? "" : "${json["city"]}";
    district = json["district"] == null ? "" : "${json["district"]}";
    state = json["state"] == null ? "" : "${json["state"]}";
  }

  clear() async {
    id = "";
    phoneNo = "";
    name = "";
    email = "";
    companyId = "";
    companyName = "";

    //Clear the details from Shared Preferences
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("phoneno", "");
    prefs.setString("username", "");
    prefs.setString("companyId", "");
    prefs.setString("companyName", "");
  }
}
