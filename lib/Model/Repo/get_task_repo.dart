import 'dart:convert';

import 'package:erm_web/Model/ResponseModel/get_all_task_res_model.dart';
import 'package:erm_web/Model/ResponseModel/get_single_task_res_model.dart';
import 'package:erm_web/Model/Service/api_service.dart';
import 'package:erm_web/Model/Service/get_storage_service.dart';
import 'package:erm_web/Model/Service/url.dart';
import 'package:http/http.dart' as http;

class TaskRepo {
  /// GET ALL TASK
  Future<List<GetAllTaskResponseModel>> getAllTaskRepo() async {
    var response = await APIService().getResponse(
        url: '${BaseUrl.baseUrl}${ApiUrl.getAllTask}', apitype: APIType.aGet);
    List<GetAllTaskResponseModel> getAllTask =
        getAllTaskResponseModelFromJson(jsonEncode(response));
    return getAllTask;
  }

  /// GET SINGLE TASK
  Future<GetSingleTaskResponseModel> getSingleTaskRepo({String? taskId}) async {
    var response = await APIService().getResponse(
        url: '${BaseUrl.baseUrl}${ApiUrl.getSingleTask}$taskId',
        apitype: APIType.aGet);
    GetSingleTaskResponseModel getSingleTaskResponseModel =
        GetSingleTaskResponseModel.fromJson(json.decode(response));
    return getSingleTaskResponseModel;
  }

  /// CREATE  TASK
  Future<bool> createTaskRepo({Map<String, String>? body}) async {
    var headers = {'Authorization': 'Bearer ${PreferenceManager.getToken()}'};

    try {
      var request = http.MultipartRequest(
          'POST', Uri.parse('${BaseUrl.baseUrl}${ApiUrl.createTask}'));
      request.fields.addAll(body!);
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode >= 200 && response.statusCode <= 299) {
        var data = jsonDecode(await response.stream.bytesToString());
        print('--Done------${data}');
        return true;
      } else {
        var data = jsonDecode(await response.stream.bytesToString());

        print('--ERROR------${data}');

        return false;
      }
    } catch (e) {
      print('--TRY ERROR------${e}');

      return false;
    }
  }

//
//
// / GET SINGLE TASK VIEW MODEL
// ApiResponse _getSingleTaskApiResponse=
// ApiResponse.initial(message: 'Initialization');
//
// ApiResponse get getSingleTaskApiResponse=> _getAllTaskApiResponse;
//
// Future<void> getAllTaskViewModel({String? taskId}) async {
//   _getSingleTaskApiResponse= ApiResponse.loading(message: 'Loading');
//   try {
//   GetSingleTaskResponseModel getSingleTaskResponse =
//     await TaskRepo().getSingleTaskRepo(taskId: taskId);
//     print("GetSingleTaskResponseModel=response==>getSingleTaskResponse");
//
//     _getSingleTaskApiResponse= ApiResponse.complete(getSingleTaskResponse);
//   } catch (e) {
//     print("GetSingleTaskResponseModel=e==>$e");
//
//     _getSingleTaskApiResponse= ApiResponse.error(message: 'error');
//   }
//   update();
// }
}
