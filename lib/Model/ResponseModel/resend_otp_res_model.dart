// To parse this JSON data, do
//
//     final resendOtpResponseModel = resendOtpResponseModelFromJson(jsonString);

import 'dart:convert';

ResendOtpResponseModel resendOtpResponseModelFromJson(String str) =>
    ResendOtpResponseModel.fromJson(json.decode(str));

String resendOtpResponseModelToJson(ResendOtpResponseModel data) =>
    json.encode(data.toJson());

class ResendOtpResponseModel {
  String? message;

  ResendOtpResponseModel({
    this.message,
  });

  factory ResendOtpResponseModel.fromJson(Map<String, dynamic> json) =>
      ResendOtpResponseModel(
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
      };
}
