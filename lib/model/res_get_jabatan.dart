// To parse this JSON data, do
//
//     final resGetJabatan = resGetJabatanFromJson(jsonString);

import 'dart:convert';

List<String> resGetJabatanFromJson(String str) => List<String>.from(json.decode(str).map((x) => x));

String resGetJabatanToJson(List<String> data) => json.encode(List<dynamic>.from(data.map((x) => x)));
