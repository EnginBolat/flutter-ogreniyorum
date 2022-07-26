import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginService {
  Future<void> setUserLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool result = await prefs.setBool('isLogin', true);
    if (kDebugMode) print("Set User Login : ${result.toString()}");
  }

  Future<void> removeUserLogin() async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    bool result = await shared.remove('isLogin');
    if (kDebugMode) print("Remove User Login : ${result.toString()}");
  }

  Future<bool?> getLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? result = prefs.getBool('isLogin');
    if (kDebugMode) print("Get User Login : ${result.toString()}");
    return result;
    // print("Get Login Data : ${isLogin.toString()}");
  }
}
