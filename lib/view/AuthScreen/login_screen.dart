import 'package:erm_web/Model/Api/api_response.dart';
import 'package:erm_web/Model/ResponseModel/log_in_res_model.dart';
import 'package:erm_web/Model/Service/get_storage_service.dart';
import 'package:erm_web/Utils/colors.dart';
import 'package:erm_web/Utils/common_snackbar.dart';
import 'package:erm_web/Utils/common_string.dart';
import 'package:erm_web/Utils/common_text.dart';
import 'package:erm_web/Utils/image_path.dart';
import 'package:erm_web/Utils/loader.dart';
import 'package:erm_web/ViewModel/auth_view_model.dart';
import 'package:erm_web/responsive.dart';
import 'package:erm_web/router/app_rout.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  AuthViewModel authViewModel = Get.put(AuthViewModel());
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
          body: Responsive.isDesktop(context)
              ? WebView(size, font, controller)
              : MobileView(controller, size),
        );
      },
    ));
  }

  /// MOBILE VIEW
  MobileView(AuthViewModel controller, double size) {
    return Container(
      height: Get.height,
      width: Get.width,
      color: CommonColor.mainColor,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/images/loginpage.png'),
            SizedBox(
              height: 8.sp,
            ),
            Align(
              alignment: Alignment.center,
              child: CommonText(
                text: LogInPageString.logInAccount,
                fontSize: 24.sp,
                fontWeight: FontWeight.w700,
                color: Color(0xffFFFFFF),
              ),
            ),
            SizedBox(
              height: 8.sp,
            ),
            Align(
              alignment: Alignment.center,
              child: CommonText(
                text: LogInPageString.logInInfo,
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
                color: Color(0xffFFFFFF),
              ),
            ),
            SizedBox(
              height: 30.sp,
            ),
            Padding(
              padding: EdgeInsets.only(left: 30.sp),
              child: Text(
                'Enter Mobile number and login',
                style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
            ),
            SizedBox(
              height: 9.sp,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30.sp),
              height: 46.sp,
              width: Get.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.sp),
                color: Colors.white,
              ),
              child: Padding(
                padding: EdgeInsets.only(top: 13.sp, bottom: 13.sp),
                child: TextFormField(
                  controller: controller.mobileController,
                  cursorColor: Color(0xff0F5ECB),
                  maxLength: 10,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  keyboardType: TextInputType.number,
                  style: TextStyle(
                    color: Color(0xff0F5ECB),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(20 * size),
                    counter: Offstage(),
                    border: InputBorder.none,
                    prefixIcon: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: 15 * size,
                        ),
                        SvgPicture.asset(
                          ImagePath.call,
                          color: CommonColor.mainColor,
                          height: 20 * size,
                          width: 20 * size,
                        ),
                        SizedBox(
                          width: 8 * size,
                        ),
                        Container(
                          // line13GVs (7:30)
                          margin: EdgeInsets.fromLTRB(
                              0 * size, 0 * size, 6 * size, 0 * size),
                          width: 1 * size,
                          height: 25 * size,
                          decoration: BoxDecoration(
                            color: Color(0xffa3a5ab),
                          ),
                        ),
                        SizedBox(
                          width: 0 * size,
                        ),
                        Text(
                          '+91  ',
                          style: TextStyle(
                            color: Color(0xff0F5ECB),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 46.sp,
            ),
            InkWell(
              onTap: () {
                requestSendOtp(controller);
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
                    'Request OTP',
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
                  WebImagePath.webLogIn,
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  LogInPageString.helloAgain,
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 12 * size,
                ),
                Text(
                  LogInPageString.logInInfo,
                  style: TextStyle(
                    fontSize: 18,
                    color: CommonColor.textColor,
                  ),
                ),
                SizedBox(
                  height: 50 * size,
                ),
                Text(
                  'Enter Mobile number and login',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 10 * size,
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xffffffff),
                    borderRadius: BorderRadius.circular(8 * size),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x192865dc),
                        offset: Offset(0 * size, 4 * size),
                        blurRadius: 7.5 * size,
                      ),
                    ],
                  ),
                  child: TextFormField(
                    maxLength: 10,
                    controller: controller.mobileController,
                    cursorColor: Color(0xff0F5ECB),
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    style: TextStyle(
                      color: Color(0xff0F5ECB),
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: InputDecoration(
                      counter: Offstage(),
                      contentPadding: EdgeInsets.all(20 * size),
                      border: InputBorder.none,
                      prefixIcon: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            width: 15 * size,
                          ),
                          SvgPicture.asset(
                            ImagePath.call,
                            color: CommonColor.mainColor,
                            height: 20,
                            width: 20,
                          ),
                          SizedBox(
                            width: 8 * size,
                          ),
                          Container(
                            // line13GVs (7:30)
                            margin: EdgeInsets.fromLTRB(
                                0 * size, 0 * size, 6 * size, 0 * size),
                            width: 1 * size,
                            height: 25 * size,
                            decoration: BoxDecoration(
                              color: Color(0xffa3a5ab),
                            ),
                          ),
                          SizedBox(
                            width: 0 * size,
                          ),
                          Text(
                            '+91  ',
                            style: TextStyle(
                              color: Color(0xff0F5ECB),
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 95 * size,
                ),
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
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
                        requestSendOtp(controller);
                      },
                      child: Text(
                        'Request OTP',
                        style: TextStyle(
                          fontSize: 20 * font,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20 * size,
                ),
                Align(
                  alignment: Alignment.center,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Forgot Password',
                      style: TextStyle(
                        fontSize: 18 * font,
                        fontWeight: FontWeight.w400,
                        color: Color(0xffa3a5ab),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  /// REQUEST OTP
  requestSendOtp(AuthViewModel controller) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return CommonWidget.CircularIndicator;
      },
    );
    try {
      await controller.loginViewModel(model: {
        "mobileNo":
        // "9824022009"
        controller.mobileController.text.trim()
      });

      if (controller.logInApiResponse.status == Status.COMPLETE) {
        LogInResponseModel logInResponseModel =
            controller.logInApiResponse.data;
        await PreferenceManager.setUserId(logInResponseModel.id.toString());
        print('----USER ID---${PreferenceManager.getUserId()}');
        Get.back();
        CommonSnackBar.getSuccessSnackBar(
            context, logInResponseModel.message.toString());

        Get.toNamed(AppRoutes.otpVerificationScreen);
      }
      if (controller.logInApiResponse.status == Status.ERROR) {
        Get.back();
        CommonSnackBar.getFailedSnackBar(context, 'Something went wrong!');
      }
    } catch (e) {
      Get.back();
      print('------LOGIN ERROR----$e');
      CommonSnackBar.getFailedSnackBar(context, 'Something went wrong!');
    }
  }
}
// 9824022009
