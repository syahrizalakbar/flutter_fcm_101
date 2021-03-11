// To parse this JSON data, do
//
//     final resLogin = resLoginFromJson(jsonString);

import 'dart:convert';

ResLogin resLoginFromJson(String str) => ResLogin.fromJson(json.decode(str));

String resLoginToJson(ResLogin data) => json.encode(data.toJson());

class ResLogin {
  ResLogin({
    this.isSuccess,
    this.message,
    this.data,
  });

  bool isSuccess;
  String message;
  User data;

  factory ResLogin.fromJson(Map<String, dynamic> json) => ResLogin(
    isSuccess: json["is_success"] == null ? null : json["is_success"],
    message: json["message"] == null ? null : json["message"],
    data: json["data"] == null ? null : User.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "is_success": isSuccess == null ? null : isSuccess,
    "message": message == null ? null : message,
    "data": data == null ? null : data.toJson(),
  };
}

class User {
  User({
    this.id,
    this.username,
    this.password,
    this.jabatan,
  });

  String id;
  String username;
  String password;
  String jabatan;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"] == null ? null : json["id"],
    username: json["username"] == null ? null : json["username"],
    password: json["password"] == null ? null : json["password"],
    jabatan: json["jabatan"] == null ? null : json["jabatan"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "username": username == null ? null : username,
    "password": password == null ? null : password,
    "jabatan": jabatan == null ? null : jabatan,
  };
}
