// To parse this JSON data, do
//
//     final resGetTask = resGetTaskFromJson(jsonString);

import 'dart:convert';

ResGetTask resGetTaskFromJson(String str) => ResGetTask.fromJson(json.decode(str));

String resGetTaskToJson(ResGetTask data) => json.encode(data.toJson());

class ResGetTask {
  ResGetTask({
    this.isSuccess,
    this.message,
    this.data,
  });

  bool isSuccess;
  String message;
  List<Task> data;

  factory ResGetTask.fromJson(Map<String, dynamic> json) => ResGetTask(
    isSuccess: json["is_success"] == null ? null : json["is_success"],
    message: json["message"] == null ? null : json["message"],
    data: json["data"] == null ? null : List<Task>.from(json["data"].map((x) => Task.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "is_success": isSuccess == null ? null : isSuccess,
    "message": message == null ? null : message,
    "data": data == null ? null : List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Task {
  Task({
    this.id,
    this.title,
    this.description,
    this.idUser,
    this.createdBy,
    this.createdAt,
  });

  String id;
  String title;
  String description;
  String idUser;
  String createdBy;
  String createdAt;

  factory Task.fromJson(Map<String, dynamic> json) => Task(
    id: json["id"] == null ? null : json["id"],
    title: json["title"] == null ? null : json["title"],
    description: json["description"] == null ? null : json["description"],
    idUser: json["id_user"] == null ? null : json["id_user"],
    createdBy: json["created_by"] == null ? null : json["created_by"],
    createdAt: json["created_at"] == null ? null : json["created_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "title": title == null ? null : title,
    "description": description == null ? null : description,
    "id_user": idUser == null ? null : idUser,
    "created_by": createdBy == null ? null : createdBy,
    "created_at": createdAt == null ? null : createdAt,
  };
}
