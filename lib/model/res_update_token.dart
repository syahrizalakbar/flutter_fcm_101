// To parse this JSON data, do
//
//     final resUpdateToken = resUpdateTokenFromJson(jsonString);

import 'dart:convert';

ResUpdateToken resUpdateTokenFromJson(String str) => ResUpdateToken.fromJson(json.decode(str));

String resUpdateTokenToJson(ResUpdateToken data) => json.encode(data.toJson());

class ResUpdateToken {
  ResUpdateToken({
    this.isSuccess,
    this.message,
  });

  bool isSuccess;
  String message;

  factory ResUpdateToken.fromJson(Map<String, dynamic> json) => ResUpdateToken(
    isSuccess: json["is_success"] == null ? null : json["is_success"],
    message: json["message"] == null ? null : json["message"],
  );

  Map<String, dynamic> toJson() => {
    "is_success": isSuccess == null ? null : isSuccess,
    "message": message == null ? null : message,
  };
}
