// To parse this JSON data, do
//
//     final resGetOtherUser = resGetOtherUserFromJson(jsonString);

import 'dart:convert';

List<OtherUser> resGetOtherUserFromJson(String str) => List<OtherUser>.from(json.decode(str).map((x) => OtherUser.fromJson(x)));

String resGetOtherUserToJson(List<OtherUser> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OtherUser {
  OtherUser({
    this.id,
    this.username,
    this.password,
    this.jabatan,
  });

  int id;
  String username;
  String password;
  String jabatan;

  factory OtherUser.fromJson(Map<String, dynamic> json) => OtherUser(
    id: json["id"] == null ? null : int.parse(json["id"].toString()),
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
