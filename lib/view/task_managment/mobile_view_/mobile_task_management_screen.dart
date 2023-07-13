import 'package:another_stepper/widgets/another_stepper.dart';
import 'package:erm_web/Utils/colors.dart';
import 'package:erm_web/Utils/common_string.dart';
import 'package:erm_web/Utils/common_text.dart';
import 'package:erm_web/Utils/image_path.dart';
import 'package:erm_web/ViewModel/task_managment_controller.dart';
import 'package:erm_web/view/task_managment/util/task_progress_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class MobileTaskManagementScreen extends StatelessWidget {
  MobileTaskManagementScreen({Key? key}) : super(key: key);

  TaskManagmentController taskManagmentController =
      Get.put(TaskManagmentController());
  @override
  Widget build(BuildContext context) {
    double baseWidth = 600;
    final size = MediaQuery.of(context).size.width / baseWidth;
    double font = size * 0.97;
    return GetBuilder<TaskManagmentController>(
      builder: (controller) {
        return Column(
          children: [
            CommonSizedBox(height: 30 * size),
            Container(
              width: Get.width,
              height: 42 * size,
              margin: EdgeInsets.symmetric(horizontal: 20 * size),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xffe8f1fd), Color(0x00e8f1fd)],
                ),
              ),
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.bottomCenter,
                children: [
                  Positioned(
                    bottom: -15 * size,
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            controller.updateAssign(0);
                          },
                          child: Container(
                            width: 139 * size,
                            height: 40 * size,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: controller.assignByMe == 1
                                      ? Color(0x332865dc)
                                      : Colors.transparent,
                                  offset: Offset(0 * size, 4 * size),
                                  blurRadius: 7.5 * size,
                                ),
                              ],
                              borderRadius: BorderRadius.circular(8),
                              color: controller.assignByMe == 0
                                  ? CommonColor.mainColor
                                  : CommonColor.white,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Assign By Me",
                                  style: TextStyle(
                                    fontSize: 14 * font,
                                    color: controller.assignByMe == 0
                                        ? CommonColor.white
                                        : CommonColor.black,
                                  ),
                                ),
                                CommonSizedBox(width: 6 * size),
                                SvgPicture.asset(
                                  ImagePath.arrowDown,
                                  height: 18 * size,
                                  width: 18 * size,
                                  color: controller.assignByMe == 0
                                      ? CommonColor.white
                                      : CommonColor.black,
                                ),
                              ],
                            ),
                          ),
                        ),
                        CommonSizedBox(width: 8 * size),
                        InkWell(
                          onTap: () {
                            controller.updateAssign(1);
                          },
                          child: Container(
                            width: 139 * size,
                            height: 40 * size,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: controller.assignByMe == 0
                                      ? Color(0x332865dc)
                                      : Colors.transparent,
                                  offset: Offset(0 * size, 4 * size),
                                  blurRadius: 7.5 * size,
                                ),
                              ],
                              borderRadius: BorderRadius.circular(8),
                              color: controller.assignByMe == 1
                                  ? CommonColor.mainColor
                                  : CommonColor.white,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Assign to me",
                                  style: TextStyle(
                                    fontSize: 14 * font,
                                    color: controller.assignByMe == 1
                                        ? CommonColor.white
                                        : CommonColor.black,
                                  ),
                                ),
                                CommonSizedBox(width: 6 * size),
                                SvgPicture.asset(
                                  ImagePath.arrowDown,
                                  height: 18 * size,
                                  width: 18 * size,
                                  color: controller.assignByMe == 1
                                      ? CommonColor.white
                                      : CommonColor.black,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            CommonSizedBox(height: 20 * size),
            Expanded(
              child: ListView.separated(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.only(
                    left: 20 * size, right: 20 * size, top: 20 * size),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      showTaskProgress(context, controller);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 15 * size,
                        vertical: 20 * size,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xffffffff),
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x332865dc),
                            offset: Offset(0 * size, 4 * size),
                            blurRadius: 7.5 * size,
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(
                                10 * size, 10 * size, 10 * size, 10 * size),
                            width: Get.width,
                            decoration: BoxDecoration(
                              color: Color(0xffe8f1fd),
                              borderRadius: BorderRadius.circular(8 * size),
                            ),
                            child: Text(
                              ' Task Title:',
                              style: TextStyle(
                                fontSize: 16 * font,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff262525),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15 * size,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // ellipse15huF (1:209)
                                width: 28 * size,
                                height: 28 * size,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(23 * size),
                                  color: Color(0xffd9d9d9),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        'https://wallpapercave.com/wpt/wp9941882.jpg'),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 12 * size,
                              ),
                              Text(
                                'Anaru Hakopa',
                                style: TextStyle(
                                  fontSize: 14 * font,
                                  color: Color(0xff262525),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 16 * size,
                          ),
                          Row(
                            children: [
                              Text(
                                'Due Date :',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 12 * font,
                                  color: Color(0xff262525),
                                ),
                              ),
                              Text(
                                ' Due in 5 days',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 12 * font,
                                  color: Color(0xffa3a5ab),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 16 * size,
                          ),
                          Row(
                            children: [
                              Text(
                                "Task Timeline: ",
                                style: TextStyle(
                                  fontSize: 12 * font,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(8, 6, 7, 5),
                                  height: 35,
                                  decoration: BoxDecoration(
                                    color: Color(0xffe8f1fd),
                                    borderRadius:
                                        BorderRadius.circular(6 * size),
                                  ),
                                  child: Center(
                                    child: AnotherStepper(
                                      activeBarColor: Color(0xff2864D9),
                                      barThickness: 5.0,
                                      activeIndex: 4,
                                      stepperList: controller.stepperData,
                                      stepperDirection: Axis.horizontal,
                                      iconWidth:
                                          22, // Height that will be applied to all the stepper icons
                                      iconHeight:
                                          22, // Width that will be applied to all the stepper icons
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20 * size,
                          ),
                          Row(
                            children: [
                              Text(
                                'Assign Holder: ',
                                style: TextStyle(
                                  fontSize: 14 * font,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff262525),
                                ),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    // ellipse15huF (1:209)
                                    width: 28 * size,
                                    height: 28 * size,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(23 * size),
                                      color: Color(0xffd9d9d9),
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                            'https://wallpapercave.com/wpt/wp9941882.jpg'),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 2 * size,
                                  ),
                                  Text(
                                    'Anaru Hakopa',
                                    style: TextStyle(
                                      fontSize: 12 * font,
                                      color: Color(0xffA3A5AB),
                                    ),
                                  ),
                                ],
                              ),
                              Spacer(),
                              Container(
                                height: 30 * size,
                                width: 103 * size,
                                decoration: BoxDecoration(
                                  color: CommonColor.activeColor100,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: CommonColor.activeColor,
                                  ),
                                ),
                                child: Center(
                                  child: CommonText(
                                    text: 'Pending',
                                    fontSize: 12 * font,
                                    color: CommonColor.activeColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 20 * size,
                  );
                },
              ),
            )
          ],
        );
      },
    );
  }
}

Widget TimeLine({double? size, double? font, String? text, String? imagePath}) {
  return Row(
    children: [
      Image.asset(
        imagePath!,
        color: CommonColor.mainColor,
        height: 15 * size!,
        width: 15 * size,
      ),
      CommonSizedBox(width: 4 * size),
      Text(
        text!,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 12 * font!,
          fontWeight: FontWeight.w400,
          color: Color(0xffA3A5AB),
        ),
      ),
    ],
  );
}
