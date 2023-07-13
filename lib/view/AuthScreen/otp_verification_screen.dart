import 'package:erm_web/Model/Api/api_response.dart';
import 'package:erm_web/Model/ResponseModel/verify_user_res_model.dart';
import 'package:erm_web/Model/Service/get_storage_service.dart';
import 'package:erm_web/Utils/colors.dart';
import 'package:erm_web/Utils/common_snackbar.dart';
import 'package:erm_web/Utils/common_string.dart';
import 'package:erm_web/Utils/image_path.dart';
import 'package:erm_web/Utils/loader.dart';
import 'package:erm_web/ViewModel/auth_view_model.dart';
import 'package:erm_web/responsive.dart';
import 'package:erm_web/router/app_rout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({Key? key}) : super(key: key);

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  AuthViewModel authViewModel = Get.put(AuthViewModel());
  @override
  void initState() {
    authViewModel.resetCount();
    authViewModel.updateCountTimer(context);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = Responsive.isDesktop(context)
        ? windowWith
        : Responsive.isTablet(context)
            ? tabletWidth
            : mobileWith;

    final size = MediaQuery.of(context).size.width / width;
    double font = size * 0.97;
    return SafeArea(child: GetBuilder<AuthViewModel>(
      builder: (controller) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: Responsive.isDesktop(context)
              ? WebView(size, font, controller)
              : Container(
                  height: Get.height,
                  width: Get.width,
                  color: CommonColor.mainColor,
                  padding: EdgeInsets.symmetric(horizontal: 20.sp),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset(
                        WebImagePath.webOtp,
                        height: 375.sp,
                        width: Get.width,
                      ),
                      SizedBox(
                        height: 8.sp,
                      ),
                      Align(
                          alignment: Alignment.center,
                          child: Text(
                            'OTP Verification',
                            style: TextStyle(
                                fontSize: 24.sp,
                                fontWeight: FontWeight.w700,
                                color: Color(0xffFFFFFF)),
                          )),
                      SizedBox(
                        height: 8.sp,
                      ),
                      Align(
                          alignment: Alignment.center,
                          child: Text(
                            'We Sent OTP code to verify your Number',
                            style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                                color: Color(0xffD4D8E3)),
                          )),
                      SizedBox(
                        height: 15.sp,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Pinput(
                          defaultPinTheme: controller.defaultPinTheme,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          keyboardType: TextInputType.number,
                          controller: controller.pinController,
                          length: 6,

                          // inputFormatters: [Formatter()],
                        ),
                      ),
                      SizedBox(
                        height: 20.sp,
                      ),
                      Align(
                          alignment: Alignment.topRight,
                          child: Text(
                            controller.count == 0
                                ? 'Otp Expired!'
                                : '00:${controller.count}',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: controller.count == 0
                                  ? CommonColor.redColor
                                  : Colors.white,
                            ),
                          )),
                      SizedBox(
                        height: 10.sp,
                      ),
                      Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Didn't receive OTP Code?",
                            style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          )),
                      SizedBox(
                        height: 10.sp,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: TextButton(
                          onPressed: () {
                            resendCodeOnTap(controller, context);
                          },
                          child: Text(
                            'Resend code',
                            style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                                decoration: TextDecoration.underline),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25.sp,
                      ),
                      InkWell(
                        onTap: () {
                          otpOnSubmit(controller);
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 47.sp),
                          height: 50.sp,
                          width: Get.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.sp),
                            gradient: LinearGradient(
                              end: Alignment.topCenter,
                              begin: Alignment.bottomCenter,
                              colors: [
                                Color(0xff0F5ECB),
                                Color.fromRGBO(255, 255, 255, 0.15)
                              ],
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'Submit',
                              style: TextStyle(
                                fontSize: 20.sp,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30.sp,
                      )
                    ],
                  ),
                ),
        );
      },
    ));
  }

  /// WEB VIEW

  WebView(double size, double font, AuthViewModel controller) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Container(
            color: CommonColor.mainColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  LogInPageString.crm,
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                Text(
                  LogInPageString.weblogInInfo,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                Image.asset(
                  WebImagePath.webOtp,
                  height: 581 * size,
                  width: 660 * size,
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            color: Colors.white,
            padding: EdgeInsets.only(left: 100 * size, right: 86 * size),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  OtpPageString.otpVerification,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 12 * size,
                ),
                Text(
                  OtpPageString.otpInfo,
                  style: TextStyle(
                    fontSize: 18,
                    color: CommonColor.textColor,
                  ),
                ),
                SizedBox(
                  height: 50 * size,
                ),
                Pinput(
                  defaultPinTheme: controller.webPinTheme,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  keyboardType: TextInputType.number,
                  controller: controller.pinController,
                  length: 6,
                ),
                SizedBox(
                  height: 40 * size,
                ),
                Text(
                  controller.count == 0
                      ? 'Otp Expired'
                      : "00:${controller.count}",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: controller.count == 0
                        ? CommonColor.redColor
                        : CommonColor.textColor,
                  ),
                ),
                SizedBox(
                  height: 40 * size,
                ),
                Text(
                  "Didn`t receive OTP Code?",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: CommonColor.textColor,
                  ),
                ),
                SizedBox(
                  height: 8 * size,
                ),
                TextButton(
                  onPressed: () {
                    resendCodeOnTap(controller, context);
                  },
                  child: Text(
                    'Resend code',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: CommonColor.textColor,
                    ),
                  ),
                ),
                SizedBox(
                  height: 38 * size,
                ),
                SizedBox(
                  height: 50 * size,
                  width: 222 * size,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: CommonColor.mainColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      otpOnSubmit(controller);
                    },
                    child: Text(
                      'Submit',
                      style: TextStyle(
                        fontSize: 20 * font,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  /// RESEND CODE
  resendCodeOnTap(AuthViewModel controller, BuildContext context) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return CommonWidget.CircularIndicator;
      },
    );
    try {
      await controller.resendOtpViewModel(
          model: {"id": "${PreferenceManager.getUserId()}"});
      if (controller.resendOtpApiResponse.status == Status.COMPLETE) {
        Get.back();
        CommonSnackBar.getSuccessSnackBar(context, 'Otp resend Successfully');
        controller.timer?.cancel();
        controller.resetCount();
        controller.updateCountTimer(context);
      }
      if (controller.resendOtpApiResponse.status == Status.ERROR) {
        Get.back();
        CommonSnackBar.getFailedSnackBar(context, 'Something went wrong!');
      }
    } catch (e) {
      Get.back();
      print('------RESEND OTP ERROR----$e');
      CommonSnackBar.getFailedSnackBar(context, 'Otp send failed!');
    }
  }

  /// ON SUBMIT
  otpOnSubmit(AuthViewModel controller) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return CommonWidget.CircularIndicator;
      },
    );
    try {
      await controller.verifyUserViewModel(
          model: {"id": "${PreferenceManager.getUserId()}", "otp": "123456"});

      if (controller.logInverifyUserApiResponse.status == Status.COMPLETE) {
        VerifyUserResponseModel verifyUserResponseModel =
            controller.logInverifyUserApiResponse.data;

        await PreferenceManager.setToken(
            verifyUserResponseModel.token.toString());
        print('----TOKEN----${PreferenceManager.getToken()}');

        Get.back();
        CommonSnackBar.getSuccessSnackBar(context, 'User Login Successfully');
        Get.offNamed(AppRoutes.homeScreen);
      }

      if (controller.logInverifyUserApiResponse.status == Status.ERROR) {
        Get.back();
        CommonSnackBar.getFailedSnackBar(context, 'Something went wrong!');
      }
    } catch (e) {
      Get.back();
      print('------VERIFY USER ERROR----$e');
      CommonSnackBar.getFailedSnackBar(context, 'User verification failed!');
    }
  }

  @override
  void dispose() {
    authViewModel.timer?.cancel();
    super.dispose();
  }
}
