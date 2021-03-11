// To parse this JSON data, do
//
//     final resAddTask = resAddTaskFromJson(jsonString);

import 'dart:convert';

ResAddTask resAddTaskFromJson(String str) => ResAddTask.fromJson(json.decode(str));

String resAddTaskToJson(ResAddTask data) => json.encode(data.toJson());

class ResAddTask {
  ResAddTask({
    this.isSuccess,
    this.message,
  });

  bool isSuccess;
  String message;

  factory ResAddTask.fromJson(Map<String, dynamic> json) => ResAddTask(
    isSuccess: json["is_success"] == null ? null : json["is_success"],
    message: json["message"] == null ? null : json["message"],
  );

  Map<String, dynamic> toJson() => {
    "is_success": isSuccess == null ? null : isSuccess,
    "message": message == null ? null : message,
  };
}
