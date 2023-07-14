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
}
