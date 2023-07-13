import 'package:erm_web/Model/Api/api_response.dart';
import 'package:erm_web/Model/Repo/all_user_repo.dart';
import 'package:erm_web/Model/ResponseModel/all_user_res_model.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  String dropdownValue = '5 Task';
  String reminderValue = '5';
  var taskList = [
    '5 Task',
    '10 Task',
    '15 Task',
    '20 Task',
    '25 Task',
  ];
  var reminderList = [
    '5',
    '10',
    '15',
    '20',
    '25',
  ];
  updateDropDownValue(String val) {
    dropdownValue = val;
    update();
  }

  updateReminderValue(String val) {
    reminderValue = val;
    update();
  }

  /// All User VIEW MODEL
  ApiResponse _allUserApiResponse =
      ApiResponse.initial(message: 'Initialization');

  ApiResponse get allUserApiResponse => _allUserApiResponse;

  Future<void> allUserViewModel() async {
    _allUserApiResponse = ApiResponse.loading(message: 'Loading');
    try {
      List<AllUserResponseModel> allUserList =
          await AllUserRepo().allUserRepo();
      print("AllUserResponseModel=response==>$allUserList");

      _allUserApiResponse = ApiResponse.complete(allUserList);
    } catch (e) {
      print("AllUserResponseModel=e==>$e");

      _allUserApiResponse = ApiResponse.error(message: 'error');
    }
    update();
  }
}
