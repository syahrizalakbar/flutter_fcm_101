// To parse this JSON data, do
//
//     final resLogout = resLogoutFromJson(jsonString);

import 'dart:convert';

ResLogout resLogoutFromJson(String str) => ResLogout.fromJson(json.decode(str));

String resLogoutToJson(ResLogout data) => json.encode(data.toJson());

class ResLogout {
  ResLogout({
    this.isSuccess,
    this.message,
  });

  bool isSuccess;
  String message;

  factory ResLogout.fromJson(Map<String, dynamic> json) => ResLogout(
    isSuccess: json["is_success"] == null ? null : json["is_success"],
    message: json["message"] == null ? null : json["message"],
  );

  Map<String, dynamic> toJson() => {
    "is_success": isSuccess == null ? null : isSuccess,
    "message": message == null ? null : message,
  };
}
