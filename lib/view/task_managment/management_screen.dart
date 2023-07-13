import 'package:erm_web/Utils/colors.dart';
import 'package:erm_web/ViewModel/media_view_controller.dart';
import 'package:erm_web/ViewModel/task_managment_controller.dart';
import 'package:erm_web/responsive.dart';
import 'package:erm_web/view/task_managment/mobile_view_/mobile_task_management_screen.dart';
import 'package:erm_web/view/task_managment/web_view/web_task_managment_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ManagementScreen extends StatefulWidget {
  const ManagementScreen({Key? key}) : super(key: key);

  @override
  State<ManagementScreen> createState() => _ManagementScreenState();
}

class _ManagementScreenState extends State<ManagementScreen> {
  TaskManagmentController taskManagmentController =
      Get.put(TaskManagmentController());
  MediaViewController mediaViewController = Get.put(MediaViewController());

  @override
  void initState() {
    print('------${Get.width}');

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CommonColor.scaffoldColor,
      body: Responsive.isDesktop(context)
          ? WebTaskManagementScreen()
          : MobileTaskManagementScreen(),
    );
  }
}
