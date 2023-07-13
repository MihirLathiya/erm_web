import 'dart:async';

import 'package:erm_web/Model/Api/api_response.dart';
import 'package:erm_web/Model/Repo/auth_repos.dart';
import 'package:erm_web/Model/ResponseModel/log_in_res_model.dart';
import 'package:erm_web/Model/ResponseModel/resend_otp_res_model.dart';
import 'package:erm_web/Model/ResponseModel/verify_user_res_model.dart';
import 'package:erm_web/Utils/common_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

class AuthViewModel extends GetxController {
  TextEditingController mobileController = TextEditingController();
  TextEditingController pinController = TextEditingController();
  final defaultPinTheme = PinTheme(
    margin: EdgeInsets.symmetric(horizontal: 5),
    width: 50.sp,
    height: 50.sp,
    textStyle: const TextStyle(
      fontSize: 22,
      // color: Color.fromRGBO(30, 60, 87, 1),
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.white,
    ),
  );
  final webPinTheme = PinTheme(
    margin: EdgeInsets.symmetric(horizontal: 5),
    width: 50.sp,
    height: 50.sp,
    textStyle: const TextStyle(
      fontSize: 22,
      // color: Color.fromRGBO(30, 60, 87, 1),
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Color(0x192865dc),
          offset: Offset(0, 4),
          blurRadius: 7.5,
        ),
      ],
    ),
  );

  /// UPDATE TIMER
  int count = 60;
  resetCount() {
    count = 60;
  }

  Timer? timer;
  updateCountTimer(BuildContext context) {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      count--;
      update();

      if (count == 0 || count < 0) {
        timer.cancel();
        CommonSnackBar.getWarningSnackBar(context, 'Otp Expired!');
      }
    });
  }

  /// LOGIN VIEW MODEL
  ApiResponse _logInApiResponse =
      ApiResponse.initial(message: 'Initialization');

  ApiResponse get logInApiResponse => _logInApiResponse;

  Future<void> loginViewModel({Map<String, dynamic>? model}) async {
    _logInApiResponse = ApiResponse.loading(message: 'Loading');
    update();
    try {
      LogInResponseModel logInResponse =
          await AuthRepo().logInRepo(body: model);
      print("LogInResponseModel=response==>$logInResponse");

      _logInApiResponse = ApiResponse.complete(logInResponse);
    } catch (e) {
      print("LogInResponseModel=e==>$e");

      _logInApiResponse = ApiResponse.error(message: 'error');
    }
    update();
  }

  /// VERIFY USER VIEW MODEL
  ApiResponse _logInverifyUserApiResponse =
      ApiResponse.initial(message: 'Initialization');

  ApiResponse get logInverifyUserApiResponse => _logInverifyUserApiResponse;

  Future<void> verifyUserViewModel({Map<String, dynamic>? model}) async {
    _logInverifyUserApiResponse = ApiResponse.loading(message: 'Loading');
    update();
    try {
      VerifyUserResponseModel verifyUserResponse =
          await AuthRepo().verifyUserRepo(body: model);
      print("VerifyUserResponseModel=response==>$verifyUserResponse");

      _logInverifyUserApiResponse = ApiResponse.complete(verifyUserResponse);
    } catch (e) {
      print("VerifyUserResponseModel=e==>$e");

      _logInverifyUserApiResponse = ApiResponse.error(message: 'error');
    }
    update();
  }

  /// RESEND OTP VIEW MODEL
  ApiResponse _resendOtpApiResponse =
      ApiResponse.initial(message: 'Initialization');

  ApiResponse get resendOtpApiResponse => _resendOtpApiResponse;

  Future<void> resendOtpViewModel({Map<String, dynamic>? model}) async {
    _resendOtpApiResponse = ApiResponse.loading(message: 'Loading');
    update();
    try {
      ResendOtpResponseModel resendOtpResponse =
          await AuthRepo().resendOtpRepo(body: model);
      print("ResendOtpResponseModel=response==>$resendOtpResponse");

      _resendOtpApiResponse = ApiResponse.complete(resendOtpResponse);
    } catch (e) {
      print("ResendOtpResponseModel=e==>$e");

      _resendOtpApiResponse = ApiResponse.error(message: 'error');
    }
    update();
  }
}
