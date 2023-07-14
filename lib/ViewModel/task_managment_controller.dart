import 'package:another_stepper/another_stepper.dart';
import 'package:erm_web/Model/Api/api_response.dart';
import 'package:erm_web/Model/Repo/all_user_repo.dart';
import 'package:erm_web/Model/Repo/get_task_repo.dart';
import 'package:erm_web/Model/ResponseModel/all_user_res_model.dart';
import 'package:erm_web/Model/ResponseModel/get_all_task_res_model.dart';
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

  /// GET ALL TASK VIEW MODEL
  ApiResponse _getAllTaskApiResponse =
      ApiResponse.initial(message: 'Initialization');

  ApiResponse get getAllTaskApiResponse => _getAllTaskApiResponse;

  Future<void> getAllTaskViewModel() async {
    _getAllTaskApiResponse = ApiResponse.loading(message: 'Loading');
    try {
      List<GetAllTaskResponseModel> getAllTaskResponse =
          await TaskRepo().getAllTaskRepo();
      print("GetAllTaskResponseModel=response==>getAllTaskResponse");

      _getAllTaskApiResponse = ApiResponse.complete(getAllTaskResponse);
    } catch (e) {
      print("GetAllTaskResponseModel=e==>$e");

      _getAllTaskApiResponse = ApiResponse.error(message: 'error');
    }
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

  clearAllValue() {
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
