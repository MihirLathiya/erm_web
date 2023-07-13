import 'package:erm_web/Model/ResponseModel/get_user_res_model.dart';
import 'package:erm_web/Model/Service/api_service.dart';
import 'package:erm_web/Model/Service/url.dart';

class GetUserRepo {
  Future<GetUserResponseModel> getUserRepo({String? userId}) async {
    var response = await APIService()
        .getResponse(url: '${BaseUrl.baseUrl}$userId', apitype: APIType.aGet);
    GetUserResponseModel getUserResponseModel =
        GetUserResponseModel.fromJson(response);
    return getUserResponseModel;
  }

  // /// VIEW MODEL
  // ApiResponse _getUserApiResponse =
  // ApiResponse.initial(message: 'Initialization');
  //
  // ApiResponse get getUserApiResponse => _getUserApiResponse;
  //
  // Future<void> getUserViewModel({String? userId}) async {
  //   _getUserApiResponse = ApiResponse.loading(message: 'Loading');
  //   try {
  //     GetUserResponseModel logInResponse =
  //     await GetUserRepo().getUserRepo(userId: userId);
  //     print("GetUserResponseModel=response==>$logInResponse");
  //
  //     _getUserApiResponse = ApiResponse.complete(logInResponse);
  //   } catch (e) {
  //     print("GetUserResponseModel=e==>$e");
  //
  //     _getUserApiResponse = ApiResponse.error(message: 'error');
  //   }
  //   update();
  // }
}
