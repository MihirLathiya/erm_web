import 'package:erm_web/Model/ResponseModel/log_in_res_model.dart';
import 'package:erm_web/Model/ResponseModel/resend_otp_res_model.dart';
import 'package:erm_web/Model/ResponseModel/verify_user_res_model.dart';
import 'package:erm_web/Model/Service/api_service.dart';
import 'package:erm_web/Model/Service/url.dart';

class AuthRepo {
  /// LOG IN
  Future<LogInResponseModel> logInRepo({Map<String, dynamic>? body}) async {
    var response = await APIService().getResponse(
        url: '${BaseUrl.baseUrl}${ApiUrl.logIn}',
        body: body,
        apitype: APIType.aPost);
    LogInResponseModel logInResponseModel =
        LogInResponseModel.fromJson(response);
    return logInResponseModel;
  }

  /// VERIFY USER
  Future<VerifyUserResponseModel> verifyUserRepo(
      {Map<String, dynamic>? body}) async {
    var response = await APIService().getResponse(
        url: '${BaseUrl.baseUrl}${ApiUrl.verifyUser}',
        body: body,
        apitype: APIType.aPost);
    VerifyUserResponseModel verifyUserResponseModel =
        VerifyUserResponseModel.fromJson(response);
    return verifyUserResponseModel;
  }

  /// RESEND OTP
  Future<ResendOtpResponseModel> resendOtpRepo(
      {Map<String, dynamic>? body}) async {
    var response = await APIService().getResponse(
        url: '${BaseUrl.baseUrl}${ApiUrl.resendOtp}',
        body: body,
        apitype: APIType.aPost);
    ResendOtpResponseModel resendOtpResponseModel =
        ResendOtpResponseModel.fromJson(response);
    return resendOtpResponseModel;
  }
}
