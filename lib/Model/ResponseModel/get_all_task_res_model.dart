// To parse this JSON data, do
//
//     final getAllTaskResponseModel = getAllTaskResponseModelFromJson(jsonString);

import 'dart:convert';

List<GetAllTaskResponseModel> getAllTaskResponseModelFromJson(String str) =>
    List<GetAllTaskResponseModel>.from(
        json.decode(str).map((x) => GetAllTaskResponseModel.fromJson(x)));

String getAllTaskResponseModelToJson(List<GetAllTaskResponseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetAllTaskResponseModel {
  String? id;
  String? title;
  dynamic description;
  DateTime? dueDate;
  String? taskCreatorId;
  List<String>? attachments;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  bool? isDeleted;
  AssignTo? assignTo;
  AssignTo? taskCreator;
  List<AssignTo>? watchers;
  List<TimelineDatum>? timelineData;

  GetAllTaskResponseModel({
    this.id,
    this.title,
    this.description,
    this.dueDate,
    this.taskCreatorId,
    this.attachments,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.isDeleted,
    this.assignTo,
    this.taskCreator,
    this.watchers,
    this.timelineData,
  });

  factory GetAllTaskResponseModel.fromJson(Map<String, dynamic> json) =>
      GetAllTaskResponseModel(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        dueDate:
            json["dueDate"] == null ? null : DateTime.parse(json["dueDate"]),
        taskCreatorId: json["taskCreatorId"],
        attachments: json["attachments"] == null
            ? []
            : List<String>.from(json["attachments"]!.map((x) => x)),
        status: json["status"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        isDeleted: json["isDeleted"],
        assignTo: json["assignTo"] == null
            ? null
            : AssignTo.fromJson(json["assignTo"]),
        taskCreator: json["taskCreator"] == null
            ? null
            : AssignTo.fromJson(json["taskCreator"]),
        watchers: json["watchers"] == null
            ? []
            : List<AssignTo>.from(
                json["watchers"]!.map((x) => AssignTo.fromJson(x))),
        timelineData: json["timelineData"] == null
            ? []
            : List<TimelineDatum>.from(
                json["timelineData"]!.map((x) => TimelineDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "dueDate": dueDate?.toIso8601String(),
        "taskCreatorId": taskCreatorId,
        "attachments": attachments == null
            ? []
            : List<dynamic>.from(attachments!.map((x) => x)),
        "status": status,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "isDeleted": isDeleted,
        "assignTo": assignTo?.toJson(),
        "taskCreator": taskCreator?.toJson(),
        "watchers": watchers == null
            ? []
            : List<dynamic>.from(watchers!.map((x) => x.toJson())),
        "timelineData": timelineData == null
            ? []
            : List<dynamic>.from(timelineData!.map((x) => x.toJson())),
      };
}

class AssignTo {
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

  AssignTo({
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

  factory AssignTo.fromJson(Map<String, dynamic> json) => AssignTo(
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

class TimelineDatum {
  String? id;
  String? status;
  String? taskId;
  DateTime? createdAt;
  DateTime? updatedAt;
  bool? isDeleted;
  DateTime? formationDate;
  AssignTo? userId;

  TimelineDatum({
    this.id,
    this.status,
    this.taskId,
    this.createdAt,
    this.updatedAt,
    this.isDeleted,
    this.formationDate,
    this.userId,
  });

  factory TimelineDatum.fromJson(Map<String, dynamic> json) => TimelineDatum(
        id: json["id"],
        status: json["status"],
        taskId: json["taskId"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        isDeleted: json["isDeleted"],
        formationDate: json["formationDate"] == null
            ? null
            : DateTime.parse(json["formationDate"]),
        userId:
            json["userId"] == null ? null : AssignTo.fromJson(json["userId"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "status": status,
        "taskId": taskId,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "isDeleted": isDeleted,
        "formationDate": formationDate?.toIso8601String(),
        "userId": userId?.toJson(),
      };
}
