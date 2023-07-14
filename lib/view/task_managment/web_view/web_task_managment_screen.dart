import 'package:another_stepper/widgets/another_stepper.dart';
import 'package:erm_web/Model/ResponseModel/all_user_res_model.dart';
import 'package:erm_web/Utils/colors.dart';
import 'package:erm_web/Utils/common_string.dart';
import 'package:erm_web/Utils/common_text.dart';
import 'package:erm_web/Utils/image_path.dart';
import 'package:erm_web/ViewModel/task_managment_controller.dart';
import 'package:erm_web/view/task_managment/util/drop_down_hover.dart';
import 'package:erm_web/view/task_managment/util/task_Add_dialog.dart';
import 'package:erm_web/view/task_managment/util/task_progress_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

Widget WebTaskManagementScreen(BuildContext context,
    {List<AllUserResponseModel>? allUserList}) {
  double baseWidth = 1440;
  final size = MediaQuery.of(context).size.width / baseWidth;
  final width = MediaQuery.of(context).size.width;
  double font = size * 0.97;
  return GetBuilder<TaskManagmentController>(
    builder: (controller) {
      return Center(
        child: Container(
          width: Get.width,
          constraints: BoxConstraints(maxWidth: 1279, maxHeight: Get.height),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                spacing: 92 * size,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 44),
                    child: CommonText(
                      text: HomePageString.taskManagment,
                      color: CommonColor.mainColor,
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Container(
                    height: 67,
                    width: 954,
                    margin: EdgeInsets.only(top: 30),
                    padding: EdgeInsets.symmetric(
                        horizontal: 30 * size, vertical: 15 * size),
                    decoration: BoxDecoration(
                      color: CommonColor.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: CommonColor.lightBlue.withAlpha(1000),
                          blurRadius: 5,
                          spreadRadius: 2,
                          offset: Offset(3, 3),
                        )
                      ],
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: TextField(
                            style: TextStyle(fontSize: 14),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                  borderRadius: BorderRadius.circular(8)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                  borderRadius: BorderRadius.circular(8)),
                              filled: true,
                              fillColor: CommonColor.lightBlue,
                              hintText: HomePageString.accountSearchText,
                              isDense: true,
                              contentPadding: EdgeInsets.all(15 * size),
                              hintStyle: TextStyle(fontSize: 14),
                              prefixIcon: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    ImagePath.search,
                                    height: 18,
                                    width: 18,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        CommonSizedBox(width: 110 * size),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                addTaskDialogForWeb(context,
                                    controller: controller,
                                    allUserList: allUserList);
                              },
                              child: Container(
                                height: 42,
                                width: 42,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: CommonColor.mainColor,
                                ),
                                child: Center(
                                  child: SvgPicture.asset(
                                    ImagePath.add,
                                    height: 24,
                                    width: 24,
                                  ),
                                ),
                              ),
                            ),
                            CommonSizedBox(width: 15 * size),
                            VerticalDivider(),
                            CommonSizedBox(width: 20 * size),
                            InkWell(
                              onTap: () {},
                              child: SvgPicture.asset(
                                ImagePath.messages,
                                height: 24,
                                width: 24,
                              ),
                            ),
                            CommonSizedBox(width: 20 * size),
                            InkWell(
                              onTap: () {},
                              child: SvgPicture.asset(
                                ImagePath.notification,
                                height: 24,
                                width: 24,
                              ),
                            ),
                            CommonSizedBox(width: 20 * size),
                            InkWell(
                              onTap: () {},
                              child: SvgPicture.asset(
                                ImagePath.calculator,
                                height: 24,
                                width: 24,
                              ),
                            ),
                            CommonSizedBox(width: 20 * size),
                            VerticalDivider(),
                            CommonSizedBox(width: 23 * size),
                            Container(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: CommonColor.mainColor,
                              ),
                              child: Image.network(
                                'https://wallpapercave.com/fwp/wp12455757.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                            if (width > 1029) CommonSizedBox(width: 12 * size),
                            if (width > 1029)
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CommonText(
                                    text: 'John Kuy',
                                    fontSize: 14 * font,
                                  ),
                                  CommonText(
                                    text: 'CEO, superadmin',
                                    color: CommonColor.textColor,
                                    fontSize: 14 * font,
                                  ),
                                ],
                              )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
              CommonSizedBox(height: 50),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      controller.updateAssign(0);
                    },
                    child: Container(
                      width: 139,
                      height: 40,
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
                              fontSize: 14,
                              color: controller.assignByMe == 0
                                  ? CommonColor.white
                                  : CommonColor.black,
                            ),
                          ),
                          CommonSizedBox(width: 6 * size),
                          SvgPicture.asset(
                            ImagePath.arrowDown,
                            height: 18,
                            width: 18,
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
                      width: 139,
                      height: 40,
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
                              fontSize: 14,
                              color: controller.assignByMe == 1
                                  ? CommonColor.white
                                  : CommonColor.black,
                            ),
                          ),
                          CommonSizedBox(width: 6 * size),
                          SvgPicture.asset(
                            ImagePath.arrowDown,
                            height: 18,
                            width: 18,
                            color: controller.assignByMe == 1
                                ? CommonColor.white
                                : CommonColor.black,
                          ),
                        ],
                      ),
                    ),
                  ),
                  CommonSizedBox(width: 8 * size),
                  Container(
                    height: 40,
                    width: 169,
                    decoration: BoxDecoration(
                      color: CommonColor.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: CommonColor.lightBlue.withAlpha(1000),
                          blurRadius: 5,
                          spreadRadius: 1,
                          offset: Offset(3, 3),
                        )
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SvgPicture.asset(
                          ImagePath.filter,
                          height: 24,
                          width: 24,
                        ),
                        CommonText(
                          text: HomePageString.moreFilter,
                          fontSize: 20,
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Container(
                    height: 40,
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    decoration: BoxDecoration(
                      color: CommonColor.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: CommonColor.lightBlue.withAlpha(1000),
                          blurRadius: 3,
                          spreadRadius: 1,
                          offset: Offset(3, 3),
                        )
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CommonText(
                          text: 'Total: ',
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                        CommonText(
                          text: '${controller.userData.length} and showing ',
                          fontSize: 14,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 6),
                          decoration: BoxDecoration(
                            color: CommonColor.mainColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Theme(
                            data: ThemeData(
                              splashColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              focusColor: Colors.transparent,
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                isDense: true,
                                icon: SvgPicture.asset(
                                  ImagePath.arrowDown,
                                  height: 15,
                                  width: 15,
                                ),
                                dropdownColor: Colors.white,
                                hint: CommonText(
                                  text: controller.dropdownValue.isNotEmpty
                                      ? controller.dropdownValue
                                      : '10',
                                  color: CommonColor.white,
                                ),

                                items: controller.items.map((e) {
                                  return DropdownMenuItem<String>(
                                    child: OnHover(
                                      builder: (isHovered) {
                                        final color = isHovered
                                            ? CommonColor.mainColor
                                            : Colors.black;
                                        return Text(
                                          '$e',
                                          style: TextStyle(color: color),
                                        );
                                      },
                                    ),
                                    value: e,
                                  );
                                }).toList(),
                                // value: dropDownValue,
                                onChanged: (value) {
                                  controller.updateDropDownValue(value!);
                                },
                              ),
                            ),
                          ),
                        ),
                        CommonText(
                          text: ' per page',
                          fontSize: 14,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              CommonSizedBox(height: 20),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(right: 20, left: 20, top: 30),
                  decoration: BoxDecoration(
                    border: Border.all(color: CommonColor.textColor),
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 13),
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: CommonColor.lightBlue,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: CommonColor.textColor.withAlpha(100),
                              blurRadius: 1,
                              spreadRadius: 1,
                              offset: Offset(0, 1),
                            )
                          ],
                        ),
                        width: Get.width,
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.only(left: 20),
                                child: CommonText(
                                  text: 'Task title',
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            VerticalDivider(),
                            Expanded(
                              child: Row(
                                children: [
                                  CommonText(
                                    text: 'Status',
                                    fontSize: 20,
                                  ),
                                  SvgPicture.asset(
                                    ImagePath.open,
                                    height: 30,
                                    width: 20,
                                  ),
                                ],
                              ),
                            ),
                            VerticalDivider(),
                            Expanded(
                              child: Row(
                                children: [
                                  CommonText(
                                    text: 'Due Date ',
                                    fontSize: 20,
                                  ),
                                  SvgPicture.asset(
                                    ImagePath.open,
                                    height: 30,
                                    width: 20,
                                  ),
                                ],
                              ),
                            ),
                            VerticalDivider(),
                            Expanded(
                              child: Container(
                                child: CommonText(
                                  text: 'Task Holder',
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            VerticalDivider(),
                            Expanded(
                              flex: 2,
                              child: CommonText(
                                text: 'Task Timeline',
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                      CommonSizedBox(height: 20),
                      Expanded(
                        child: AnimationLimiter(
                          child: ListView.separated(
                            itemCount: controller.userData.length,
                            itemBuilder: (context, index) {
                              var data = controller.userData[index];
                              return AnimationConfiguration.staggeredList(
                                position: index,
                                duration: const Duration(milliseconds: 600),
                                child: SlideAnimation(
                                  verticalOffset: 50.0,
                                  child: FadeInAnimation(
                                    child: GestureDetector(
                                      onTap: () {
                                        showTaskProgress(context, controller);
                                      },
                                      child: Container(
                                        height: 97,
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        width: Get.width,
                                        decoration: BoxDecoration(
                                          color: CommonColor.white,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          boxShadow: [
                                            BoxShadow(
                                              color: CommonColor.mainColor
                                                  .withAlpha(20),
                                              blurRadius: 3,
                                              spreadRadius: 3,
                                              offset: Offset(2, 2),
                                            )
                                          ],
                                        ),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Container(
                                                padding:
                                                    EdgeInsets.only(left: 20),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      "Task name",
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                      ),
                                                    ),
                                                    CommonSizedBox(height: 8),
                                                    Row(
                                                      children: [
                                                        ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      1000),
                                                          child: Image.network(
                                                            '${data['account']['image']}',
                                                            fit: BoxFit.cover,
                                                            height: 28,
                                                            width: 28,
                                                          ),
                                                        ),
                                                        CommonSizedBox(
                                                            width: 8 * size),
                                                        CommonText(
                                                          text:
                                                              '${data['account']['name']}',
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    height: 30,
                                                    width: 103,
                                                    decoration: BoxDecoration(
                                                      color: data['lead']
                                                              ['status']
                                                          ? CommonColor
                                                              .completeColor100
                                                          : CommonColor
                                                              .activeColor100,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                      border: Border.all(
                                                        color: data['lead']
                                                                ['status']
                                                            ? CommonColor
                                                                .completeColor
                                                            : CommonColor
                                                                .activeColor,
                                                      ),
                                                    ),
                                                    child: Center(
                                                      child: CommonText(
                                                        text: data['lead']
                                                                ['status']
                                                            ? 'Complete'
                                                            : 'Pending',
                                                        color: data['lead']
                                                                ['status']
                                                            ? CommonColor
                                                                .completeColor
                                                            : CommonColor
                                                                .activeColor,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  CommonText(
                                                    text:
                                                        '${data['date']['create']}',
                                                    fontSize: 16,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              child: Row(
                                                children: [
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            1000),
                                                    child: Image.network(
                                                      '${data['account']['image']}',
                                                      fit: BoxFit.cover,
                                                      height: 28,
                                                      width: 28,
                                                    ),
                                                  ),
                                                  CommonSizedBox(
                                                      width: 8 * size),
                                                  CommonText(
                                                    text:
                                                        '${data['account']['name']}',
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              flex: 2,
                                              child: Container(
                                                padding: EdgeInsets.fromLTRB(
                                                    8, 6, 7, 5),
                                                margin:
                                                    EdgeInsets.only(right: 10),
                                                height: 47,
                                                decoration: BoxDecoration(
                                                  color: Color(0xffe8f1fd),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          6 * size),
                                                ),
                                                child: Center(
                                                  child: AnotherStepper(
                                                    activeBarColor:
                                                        Color(0xff2864D9),
                                                    barThickness: 5.0,
                                                    activeIndex: 4,
                                                    stepperList:
                                                        controller.stepperData,
                                                    stepperDirection:
                                                        Axis.horizontal,

                                                    iconWidth: 22 *
                                                        size, // Height that will be applied to all the stepper icons
                                                    iconHeight: 22 *
                                                        size, // Width that will be applied to all the stepper icons
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                height: 20,
                              );
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              CommonSizedBox(height: 20),
            ],
          ),
        ),
      );
    },
  );
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
