// To parse this JSON data, do
//
//     final logInResponseModel = logInResponseModelFromJson(jsonString);

import 'dart:convert';

LogInResponseModel logInResponseModelFromJson(String str) =>
    LogInResponseModel.fromJson(json.decode(str));

String logInResponseModelToJson(LogInResponseModel data) =>
    json.encode(data.toJson());

class LogInResponseModel {
  String? id;
  String? message;

  LogInResponseModel({
    this.id,
    this.message,
  });

  factory LogInResponseModel.fromJson(Map<String, dynamic> json) =>
      LogInResponseModel(
        id: json["id"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "message": message,
      };
}
