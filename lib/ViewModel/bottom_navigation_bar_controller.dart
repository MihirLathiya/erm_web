import 'package:erm_web/Utils/image_path.dart';
import 'package:erm_web/view/home_screen/home_screen.dart';
import 'package:erm_web/view/task_managment/management_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavigationBarController extends GetxController {
  int page = 0;
  updateIndex(int val) {
    page = val;
    update();
  }

  List unSelectIcon = [
    BottomBarPath.home,
    BottomBarPath.gallery,
    BottomBarPath.message,
    BottomBarPath.taskSquare,
  ];
  List selectedIcon = [
    BottomBarPath.home2,
    BottomBarPath.gallery2,
    BottomBarPath.message,
    BottomBarPath.taskSquare2,
  ];

  List webScreenList = [
    HomeScreen(),
    ManagementScreen(),
    SizedBox(),
  ];

  bool hover1 = false;

  updateHover1(bool val) {
    hover1 = val;
    update();
  }

  bool hover2 = false;

  updateHover2(bool val) {
    hover2 = val;
    update();
  }

  bool hover3 = false;

  updateHover3(bool val) {
    hover3 = val;
    update();
  }
}
