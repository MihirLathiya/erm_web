import 'dart:convert';

import 'package:erm_web/Model/ResponseModel/all_user_res_model.dart';
import 'package:erm_web/Model/Service/api_service.dart';
import 'package:erm_web/Model/Service/url.dart';

class AllUserRepo {
  Future<List<AllUserResponseModel>> allUserRepo() async {
    var response = await APIService().getResponse(
        url: '${BaseUrl.baseUrl}user/allUsers', apitype: APIType.aGet);
    List<AllUserResponseModel> allUserList =
        allUserResponseModelFromJson(jsonEncode(response));
    return allUserList;
  }
}
