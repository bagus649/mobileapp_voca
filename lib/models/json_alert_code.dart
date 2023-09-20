// To parse this JSON data, do
//
//     final alertcode = alertcodeFromJson(jsonString);

import 'dart:convert';

Alertcode alertcodeFromJson(String str) => Alertcode.fromJson(json.decode(str));

String alertcodeToJson(Alertcode data) => json.encode(data.toJson());

class Alertcode {
  int? statusCode;
  String? message;
  String? error;
  String? data;

  Alertcode({
    this.statusCode,
    this.message,
    this.error,
    this.data,
  });

  factory Alertcode.fromJson(Map<String, dynamic> json) => Alertcode(
        statusCode: json["statusCode"],
        message: json["message"],
        error: json["error"],
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "message": message,
        "error": error,
        "data": data,
      };
}
