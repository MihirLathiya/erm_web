// To parse this JSON data, do
//
//     final verifyUserResponseModel = verifyUserResponseModelFromJson(jsonString);

import 'dart:convert';

VerifyUserResponseModel verifyUserResponseModelFromJson(String str) =>
    VerifyUserResponseModel.fromJson(json.decode(str));

String verifyUserResponseModelToJson(VerifyUserResponseModel data) =>
    json.encode(data.toJson());

class VerifyUserResponseModel {
  String? token;
  User? user;

  VerifyUserResponseModel({
    this.token,
    this.user,
  });

  factory VerifyUserResponseModel.fromJson(Map<String, dynamic> json) =>
      VerifyUserResponseModel(
        token: json["token"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "user": user?.toJson(),
      };
}

class User {
  String? id;
  String? userId;
  String? mobileNo;
  String? userName;
  String? firstName;
  String? lastName;
  String? description;
  String? title;
  String? photo;
  String? addressStreet;
  String? addressCity;
  String? addressState;
  String? addressCountry;
  String? addressPostalcode;
  String? userType;
  String? deviceType;
  String? oeplDocumentType;
  String? oeplLoginIp;
  String? oeplSelectCompany;
  String? oeplEmployeeCode;
  String? userDivision;
  String? whatsappNumber;
  String? userBranchName;
  bool? isVerified;
  bool? isActive;
  bool? isDeleted;
  DateTime? createdAt;
  DateTime? updatedAt;

  User({
    this.id,
    this.userId,
    this.mobileNo,
    this.userName,
    this.firstName,
    this.lastName,
    this.description,
    this.title,
    this.photo,
    this.addressStreet,
    this.addressCity,
    this.addressState,
    this.addressCountry,
    this.addressPostalcode,
    this.userType,
    this.deviceType,
    this.oeplDocumentType,
    this.oeplLoginIp,
    this.oeplSelectCompany,
    this.oeplEmployeeCode,
    this.userDivision,
    this.whatsappNumber,
    this.userBranchName,
    this.isVerified,
    this.isActive,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        userId: json["userId"],
        mobileNo: json["mobileNo"],
        userName: json["userName"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        description: json["description"],
        title: json["title"],
        photo: json["photo"],
        addressStreet: json["addressStreet"],
        addressCity: json["addressCity"],
        addressState: json["addressState"],
        addressCountry: json["addressCountry"],
        addressPostalcode: json["addressPostalcode"],
        userType: json["userType"],
        deviceType: json["deviceType"],
        oeplDocumentType: json["oeplDocumentType"],
        oeplLoginIp: json["oeplLoginIp"],
        oeplSelectCompany: json["oeplSelectCompany"],
        oeplEmployeeCode: json["oeplEmployeeCode"],
        userDivision: json["userDivision"],
        whatsappNumber: json["whatsappNumber"],
        userBranchName: json["userBranchName"],
        isVerified: json["isVerified"],
        isActive: json["isActive"],
        isDeleted: json["isDeleted"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "mobileNo": mobileNo,
        "userName": userName,
        "firstName": firstName,
        "lastName": lastName,
        "description": description,
        "title": title,
        "photo": photo,
        "addressStreet": addressStreet,
        "addressCity": addressCity,
        "addressState": addressState,
        "addressCountry": addressCountry,
        "addressPostalcode": addressPostalcode,
        "userType": userType,
        "deviceType": deviceType,
        "oeplDocumentType": oeplDocumentType,
        "oeplLoginIp": oeplLoginIp,
        "oeplSelectCompany": oeplSelectCompany,
        "oeplEmployeeCode": oeplEmployeeCode,
        "userDivision": userDivision,
        "whatsappNumber": whatsappNumber,
        "userBranchName": userBranchName,
        "isVerified": isVerified,
        "isActive": isActive,
        "isDeleted": isDeleted,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}
