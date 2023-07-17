import 'dart:math';

import 'package:another_stepper/another_stepper.dart';
import 'package:erm_web/Model/Api/api_response.dart';
import 'package:erm_web/Model/Repo/all_user_repo.dart';
import 'package:erm_web/Model/ResponseModel/all_user_res_model.dart';
import 'package:erm_web/Utils/image_path.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:get/get.dart';

class TaskManagmentController extends GetxController {
  int assignByMe = 0;
  updateAssign(int index) {
    assignByMe = index;
    update();
  }

  // Initial Selected Value
  String dropdownValue = '10';

  // List of items in our dropdown menu
  var items = [
    '10',
    '20',
    '30',
    '40',
    '50',
  ];

  updateDropDownValue(String val) {
    dropdownValue = val;
    update();
  }

  List<Map<String, dynamic>> userData = [
    {
      'account': {
        'image': 'https://wallpapercave.com/dwp1x/wp8262039.jpg',
        'name': 'Alex',
        'time': ' April 30 , 2023 at 2.40 pm'
      },
      'contact': {
        'email': '  DarleneRobertson@ mail.com',
        'phone': '  (891) 252-4969'
      },
      'lead': {'status': false},
      'date': {'create': 'Due in 5 days'},
      'assignUser': {
        'image': 'https://wallpapercave.com/fwp/wp12455757.jpg',
        'name': 'John Kuy'
      },
    },
    {
      'account': {
        'image': 'https://wallpapercave.com/dwp1x/wp8562124.jpg',
        'name': 'Naruto',
        'time': ' April 30 , 2023 at 2.40 pm'
      },
      'contact': {'email': '  Naruto@ mail.com', 'phone': '  (891) 252-4969'},
      'lead': {'status': true},
      'date': {'create': 'Completed by 5 days'},
      'assignUser': {
        'image': 'https://wallpapercave.com/fwp/wp12455757.jpg',
        'name': 'John Kuy'
      },
    },
    {
      'account': {
        'image': 'https://wallpapercave.com/dwp1x/wp5427844.jpg',
        'name': 'Kakashi',
        'time': ' April 30 , 2023 at 2.40 pm'
      },
      'contact': {'email': '  Kakashi@ mail.com', 'phone': '  (891) 252-4969'},
      'lead': {'status': true},
      'date': {'create': 'Completed by 5 days'},
      'assignUser': {
        'image': 'https://wallpapercave.com/fwp/wp12455757.jpg',
        'name': 'John Kuy'
      },
    },
    {
      'account': {
        'image': 'https://wallpapercave.com/dwp1x/wp8562126.png',
        'name': 'Pain',
        'time': ' April 30 , 2023 at 2.40 pm'
      },
      'contact': {'email': '  Pain@ mail.com', 'phone': '  (891) 252-4969'},
      'lead': {'status': false},
      'date': {'create': 'Due in 5 days'},
      'assignUser': {
        'image': 'https://wallpapercave.com/fwp/wp12455757.jpg',
        'name': 'John Kuy'
      },
    },
    {
      'account': {
        'image': 'https://wallpapercave.com/dwp1x/wp8262039.jpg',
        'name': 'Alex',
        'time': ' April 30 , 2023 at 2.40 pm'
      },
      'contact': {
        'email': '  DarleneRobertson@ mail.com',
        'phone': '  (891) 252-4969'
      },
      'lead': {'status': false},
      'date': {'create': 'Due in 5 days'},
      'assignUser': {
        'image': 'https://wallpapercave.com/fwp/wp12455757.jpg',
        'name': 'John Kuy'
      },
    },
    {
      'account': {
        'image': 'https://wallpapercave.com/dwp1x/wp8562124.jpg',
        'name': 'Naruto',
        'time': ' April 30 , 2023 at 2.40 pm'
      },
      'contact': {'email': '  Naruto@ mail.com', 'phone': '  (891) 252-4969'},
      'lead': {'status': true},
      'date': {'create': 'Completed by 5 days'},
      'assignUser': {
        'image': 'https://wallpapercave.com/fwp/wp12455757.jpg',
        'name': 'John Kuy'
      },
    },
    {
      'account': {
        'image': 'https://wallpapercave.com/dwp1x/wp5427844.jpg',
        'name': 'Kakashi',
        'time': ' April 30 , 2023 at 2.40 pm'
      },
      'contact': {'email': '  Kakashi@ mail.com', 'phone': '  (891) 252-4969'},
      'lead': {'status': true},
      'date': {'create': 'Completed by 5 days'},
      'assignUser': {
        'image': 'https://wallpapercave.com/fwp/wp12455757.jpg',
        'name': 'John Kuy'
      },
    },
    {
      'account': {
        'image': 'https://wallpapercave.com/dwp1x/wp8562126.png',
        'name': 'Pain',
        'time': ' April 30 , 2023 at 2.40 pm'
      },
      'contact': {'email': '  Pain@ mail.com', 'phone': '  (891) 252-4969'},
      'lead': {'status': false},
      'date': {'create': 'Due in 5 days'},
      'assignUser': {
        'image': 'https://wallpapercave.com/fwp/wp12455757.jpg',
        'name': 'John Kuy'
      },
    },
  ];

  List<StepperData> stepperData = [
    StepperData(
      iconWidget: Container(
        height: 60,
        width: 60,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30), color: Color(0xff2864D9)),
        child: Image.asset(
          ImagePath.timer1,
        ),
      ),
    ),
    StepperData(
      iconWidget: Container(
        height: 60,
        width: 60,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30), color: Color(0xff2864D9)),
        child: Image.asset(
          ImagePath.timer2,
        ),
      ),
    ),
    StepperData(
      iconWidget: Container(
        height: 60,
        width: 60,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Color(
            0xff2864D9,
          ),
        ),
        child: Image.asset(
          ImagePath.timer3,
        ),
      ),
    ),
    StepperData(
      iconWidget: Container(
        height: 60,
        width: 60,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Color(
            0xff2864D9,
          ),
        ),
        child: Image.asset(ImagePath.timer4),
      ),
    ),
    StepperData(
      iconWidget: Container(
        height: 60,
        width: 60,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Color(
            0xff2864D9,
          ),
        ),
        child: Image.asset(
          ImagePath.timer5,
        ),
      ),
    ),
  ];

  List<Map<String, dynamic>> taskData = [];

  /// GET ALL TASK VIEW MODEL
  ApiResponse _getAllTaskApiResponse =
      ApiResponse.initial(message: 'Initialization');

  ApiResponse get getAllTaskApiResponse => _getAllTaskApiResponse;

  // Future<bool> getAllTaskViewModel({String type = 'AssignByMe'}) async {
  //   _getAllTaskApiResponse = ApiResponse.loading(message: 'Loading');
  //   try {
  //     print('idsgf6tsf6tywgfb');
  //     var headers = {'Authorization': 'Bearer ${PreferenceManager.getToken()}'};
  //     var request = http.Request(
  //         'GET',
  //         Uri.parse(
  //             'http://ec2-13-127-52-162.ap-south-1.compute.amazonaws.com:5000/task/allTasks'));
  //     request.body = json.encode({"taskAssign": "AssignByMe"});
  //     request.headers.addAll(headers);
  //
  //     http.StreamedResponse response = await request.send();
  //
  //     if (response.statusCode == 200) {
  //       update();
  //       print("AllUserResponseModel=response==>$response.statusCode");
  //
  //       _allUserApiResponse = ApiResponse.complete(response.statusCode);
  //       return true;
  //     } else {
  //       update();
  //
  //       print("GetAllTaskResponseModel=e==>$e");
  //
  //       _getAllTaskApiResponse = ApiResponse.error(message: 'error');
  //       return false;
  //     }
  //   } catch (e) {
  //     update();
  //
  //     print("GetAllTaskResponseModel=e==>$e");
  //
  //     _getAllTaskApiResponse = ApiResponse.error(message: 'error');
  //     return false;
  //   }
  // }

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

  /// CREATE TASK SCREEN
  int followUp = 0;
  updateFollowUp(int index) {
    followUp = index;
    update();
  }

  TextEditingController searchUserNameController = TextEditingController();
  TextEditingController searchWatcherController = TextEditingController();
  TextEditingController taskDescriptionController = TextEditingController();
  TextEditingController taskTitleController = TextEditingController();
  int selectUserName = -1;
  updateSelectUserName(int index) {
    selectUserName = index;
    update();
  }

  Map<String, dynamic> selectUserNameValue = {'userName': '', 'id': ''};
  List<String> selectWatcherValue = [];
  List<String> selectFinalWatcherValue = [];
  DropzoneViewController? dropzoneViewController;
  DateTime? selectedDueDate;
  List<PlatformFile> attechmentFile = [];
  updateSelectUserNameValue({String? name, String? id}) {
    selectUserNameValue = {'userName': name, 'id': id};
    update();
  }

  updateAttechMentFile(PlatformFile selectFiles) {
    attechmentFile.add(selectFiles);
    update();
  }

  updateDueData(DateTime dueDate) {
    selectedDueDate = dueDate;
    update();
  }

  updateSelectWatcherValue({String? id = '', bool isDuplicate = false}) {
    if (isDuplicate == false) {
      if (selectWatcherValue.contains(id)) {
        selectWatcherValue.remove(id);
      } else {
        selectWatcherValue.add(id!);
      }
    } else {
      selectFinalWatcherValue = [...selectWatcherValue];
    }

    print('----------${selectWatcherValue}');
    print('----------${selectFinalWatcherValue}');
    update();
  }

  int addWatcher = -1;
  updateAddWatcher(int index) {
    addWatcher = index;
    update();
  }

  final List<String> taskType = [' Task View ', ' Create Task '];
  String? selectedTaskValue;

  updateTaskType(String value) {
    selectedTaskValue = value;
    update();
  }

  dynamic data;
  String? url;
  String? name;
  String? size;
  DropzoneViewController? dropController;

  String getFileSizeString({required int bytes, int decimals = 0}) {
    const suffixes = ["b", "kb", "mb", "gb", "tb"];
    var i = (log(bytes) / log(1024)).floor();
    return ((bytes / pow(1024, i)).toStringAsFixed(decimals)) + suffixes[1];
  }

  Future acceptFile(dynamic event) async {
    url = await dropController?.createFileUrl(event);
    name = event.name;
    int? byts = await dropController?.getFileSize(event);
    size = getFileSizeString(bytes: byts!);
    print('---$url');
    print('---$name');
    print('---$size');
    update();
  }

  pickUpFile() async {
    data = await dropController?.pickFiles();
    url = await dropController?.createFileUrl(data![0]);
    int? byts = await dropController?.getFileSize(data[0]);
    size = getFileSizeString(bytes: byts!);
    name = data![0].name;
    print('---$url');
    print('---$name');
    print('---$size');

    update();
  }

  clearAllValue() {
    data = null;
    url = null;
    name = null;
    size = null;
    addWatcher = -1;
    selectUserNameValue = {'userName': '', 'id': ''};
    selectWatcherValue = [];
    selectUserName = -1;
    searchUserNameController.clear();
    searchWatcherController.clear();
    selectFinalWatcherValue.clear();
    taskDescriptionController.clear();
    taskTitleController.clear();
  }
}
