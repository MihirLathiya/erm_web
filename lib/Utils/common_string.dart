import 'package:flutter/material.dart';

Widget CommonSizedBox({double? height, double? width, Widget? child}) {
  return SizedBox(
    height: height,
    width: width,
    child: child,
  );
}

class LogInPageString {
  static String logInAccount = 'Login Account';
  static String crm = 'CRM';
  static String helloAgain = 'Hello Again!';
  static String logInInfo = 'Hello,Welcome back to our account';
  static String weblogInInfo =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit.';
}

class OtpPageString {
  static String otpVerification = 'OTP Verification';
  static String otpInfo = 'We sent OTP code to verify your Number';
}

class MediaPageString {
  static String followUps = 'Follow Ups';
  static String assignUser = 'Assign User';
  static String attachment = 'Attachment :';
  static String addAttachment = 'Add Attachment';
}

class HomePageString {
  static String leadDetails = 'Lead Details';
  static String taskManagment = 'Task managment ';
  static String leaddDiscussion = 'Lead Discussion';
  static String mediaView = 'Media View';
  static String crm = 'CRM';
  static String moreFilter = 'More Filter';
  static String createLead = ' CREATE lEAD fORM ';
  static String taskManagement = 'Task Managment';
  static String accountSearchText = 'Search lead ,Contact, and more';
}
