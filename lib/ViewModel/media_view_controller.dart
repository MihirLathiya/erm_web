import 'package:get/get.dart';

class MediaViewController extends GetxController {
  int followUp = 0;
  updateFollowUp(int index) {
    followUp = index;
    update();
  }

  int selectUserName = -1;
  updateSelectUserName(int index) {
    selectUserName = index;
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
}
