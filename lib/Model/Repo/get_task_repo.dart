import 'dart:convert';

import 'package:erm_web/Model/ResponseModel/get_all_task_res_model.dart';
import 'package:erm_web/Model/ResponseModel/get_single_task_res_model.dart';
import 'package:erm_web/Model/Service/api_service.dart';
import 'package:erm_web/Model/Service/url.dart';

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

// /// GET ALL TASK VIEW MODEL
// ApiResponse _getAllTaskApiResponse =
// ApiResponse.initial(message: 'Initialization');
//
// ApiResponse get getAllTaskApiResponse => _getAllTaskApiResponse;
//
// Future<void> getAllTaskViewModel({String? userId}) async {
//   _getAllTaskApiResponse = ApiResponse.loading(message: 'Loading');
//   try {
//    List<GetAllTaskResponseModel> getAllTaskResponse =
//     await GetUserRepo().getUserRepo(userId: userId);
//     print("GetAllTaskResponseModel=response==>getAllTaskResponse");
//
//     _getAllTaskApiResponse = ApiResponse.complete(getAllTaskResponse);
//   } catch (e) {
//     print("GetAllTaskResponseModel=e==>$e");
//
//     _getAllTaskApiResponse = ApiResponse.error(message: 'error');
//   }
//   update();
// }//
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
