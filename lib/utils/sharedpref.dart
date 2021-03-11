import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../model/res_login.dart';

Future<bool> persistUser(User user) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return await prefs.setString("user", jsonEncode(user.toJson()));
}

Future<User> getUser() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var user = prefs.getString("user");

  if (user != null) {
    return User.fromJson(jsonDecode(user));
  } else {
    return null;
  }
}

Future<bool> clearPrefs() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return await prefs.clear();
}