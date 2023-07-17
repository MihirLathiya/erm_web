import 'dart:convert';

import 'package:erm_web/Model/Api/api_response.dart';
import 'package:erm_web/Model/ResponseModel/all_user_res_model.dart';
import 'package:erm_web/Utils/colors.dart';
import 'package:erm_web/Utils/common_string.dart';
import 'package:erm_web/Utils/common_text.dart';
import 'package:erm_web/Utils/image_path.dart';
import 'package:erm_web/ViewModel/home_screen_controller.dart';
import 'package:erm_web/ViewModel/task_managment_controller.dart';
import 'package:erm_web/responsive.dart';
import 'package:erm_web/view/home_screen/home_screen.dart';
import 'package:erm_web/view/main_screen.dart';
import 'package:erm_web/view/task_managment/util/task_Add_dialog.dart';
import 'package:erm_web/view/task_managment/web_view/web_task_managment_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'mobile_view/mobile_task_management_screen.dart';

class ManagementScreen extends StatefulWidget {
  const ManagementScreen({Key? key}) : super(key: key);

  @override
  State<ManagementScreen> createState() => _ManagementScreenState();
}

class _ManagementScreenState extends State<ManagementScreen> {
  TaskManagmentController taskManagmentController =
      Get.put(TaskManagmentController());
  HomeController homeController = Get.put(HomeController());

  @override
  void initState() {
    print('------${Get.width}');
    taskManagmentController.allUserViewModel();
    getAllTaskRepo();
    // TODO: implement initState
    super.initState();
  }

  bool show = false;
  var res;
  Future<bool> getAllTaskRepo() async {
    setState(() {
      show = true;
    });
    var headers = {
      // 'Content-Type': 'application/json',
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiJiMTllMjFmMC0wZmU2LTRhZWYtODMzZC0xNTUyOWI4N2E1ODEiLCJtb2JpbGVObyI6Ijk4MjQwMjIwMDkiLCJyb2xlIjoidXNlciIsImlhdCI6MTY4OTYxNDcwNSwiZXhwIjoxNjg5NzAxMTA1fQ.H3_KIpXuRaynU3KVTREHUERrCkP6A9nuVl9919OOslc'
    };
    var request = http.Request(
        'GET',
        Uri.parse(
            'http://ec2-13-127-52-162.ap-south-1.compute.amazonaws.com:5000/task/allTasks'));
    request.body = json.encode({"taskAssign": "AssignByMe"});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      setState(() {
        show = false;
      });
      var data = jsonDecode(await response.stream.bytesToString());
      res = data;
      print('------RES---${data}');
      return true;
    } else {
      var data = jsonDecode(await response.stream.bytesToString());

      print('------RES---${data}');
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width / 1440;
    double font = size * 0.97;
    return GetBuilder<TaskManagmentController>(
      builder: (controller) {
        if (controller.allUserApiResponse.status == Status.LOADING) {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        if (controller.allUserApiResponse.status == Status.COMPLETE) {
          List<AllUserResponseModel> allUserList =
              controller.allUserApiResponse.data;

          return Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(70),
              child: Responsive.isDesktop(context)
                  ? SizedBox()
                  : Container(
                      width: Get.width,
                      height: 110,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: CommonColor.mainColor.withAlpha(100),
                            offset: Offset(2, 2),
                            spreadRadius: 5,
                            blurRadius: 5,
                          ),
                        ],
                        color: CommonColor.mainColor,
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        ),
                      ),
                      padding: EdgeInsets.only(
                          top: size * 20, left: size * 20, right: size * 20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              scaffoldKey.currentState?.openDrawer();
                            },
                            child: SvgPicture.asset(
                              ImagePath.menu,
                              height: 24,
                              width: 24,
                            ),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          CommonText(
                            text: HomePageString.taskManagment,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: CommonColor.white,
                          ),
                          Spacer(),
                          Row(
                            children: [
                              homeButtons(
                                size: size,
                                onTap: () {
                                  addTaskDialogForWeb(context,
                                      allUserList: allUserList,
                                      controller: controller);
                                },
                                image: ImagePath.add,
                              ),
                              SizedBox(
                                width: 6,
                              ),
                              homeButtons(
                                size: size,
                                onTap: () {},
                                image: ImagePath.calculator,
                              ),
                              SizedBox(
                                width: 6,
                              ),
                              homeButtons(
                                size: size,
                                onTap: () {},
                                image: ImagePath.notification,
                              ),
                              SizedBox(
                                width: 6,
                              ),
                              Container(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: CommonColor.mainColor,
                                ),
                                child: Image.network(
                                  'https://wallpapercave.com/fwp/wp12455757.jpg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
            ),
            body: Responsive.isDesktop(context)
                ? WebTaskManagementScreen(context, allUserList: allUserList)
                : MobileTaskManagementScreen(context, allUserList: allUserList),
          );
        } else {
          return Scaffold(
            body: Center(
              child: Text('Something went wrong!'),
            ),
          );
        }
      },
    );
  }
}
