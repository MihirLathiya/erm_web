import 'package:erm_web/Utils/colors.dart';
import 'package:erm_web/Utils/common_string.dart';
import 'package:erm_web/Utils/image_path.dart';
import 'package:erm_web/ViewModel/media_view_controller.dart';
import 'package:erm_web/responsive.dart';
import 'package:erm_web/view/task_managment/util/dialog_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

addTaskDialogForWeb(
  BuildContext context,
) {
  return showDialog(
    context: context,
    builder: (context) {
      return SimpleDialog(
        children: [
          Builder(
            builder: (context) {
              final width = MediaQuery.of(context).size.width;
              double baseWidth = Responsive.isDesktop(context) ? 1440 : 700;
              final size = MediaQuery.of(context).size.width / baseWidth;
              double font = size * 0.97;
              print('----WIDTH---$width');
              return Container(
                padding: EdgeInsets.all(20),
                height: Get.height,
                width: width <= 652
                    ? 500
                    : width <= 1280
                        ? 700
                        : Get.width,
                child: GetBuilder<MediaViewController>(
                  builder: (controller) {
                    return MediaQuery.removePadding(
                      context: context,
                      removeTop: true,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: width <= 658 ? 400 : 500,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 15,
                                    vertical: 25,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Color(0xffffffff),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Project/ Create a Task",
                                            style: TextStyle(
                                              fontSize: 16 * font,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              attechmentDialogBox(size, font,
                                                  controller: controller);
                                            },
                                            child: Container(
                                              padding: EdgeInsets.all(
                                                8,
                                              ),
                                              decoration: BoxDecoration(
                                                color: Color(0xffffffff),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                border: Border.all(
                                                    color:
                                                        CommonColor.textColor),
                                              ),
                                              child: Row(
                                                children: [
                                                  SvgPicture.asset(
                                                    ImagePath.attechment,
                                                    height: 18 * size,
                                                    width: 18 * size,
                                                  ),
                                                  CommonSizedBox(width: 6),
                                                  Text(
                                                    "Attchments",
                                                    style: TextStyle(
                                                      fontSize: 14 * font,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      CommonSizedBox(height: 27),
                                      Container(
                                        padding:
                                            EdgeInsets.fromLTRB(10, 10, 10, 10),
                                        width: Get.width,
                                        decoration: BoxDecoration(
                                          color: Color(0xffe8f1fd),
                                          borderRadius:
                                              BorderRadius.circular(8),
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
                                      CommonSizedBox(height: 30),
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                            ImagePath.menu,
                                            color: Colors.black,
                                            height: 18 * size,
                                            width: 18 * size,
                                          ),
                                          CommonSizedBox(width: 4),
                                          Text(
                                            "Description",
                                            style: TextStyle(
                                              fontSize: 16 * font,
                                            ),
                                          )
                                        ],
                                      ),
                                      CommonSizedBox(height: 16),
                                      Container(
                                        height: 80,
                                        clipBehavior:
                                            Clip.antiAliasWithSaveLayer,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border: Border.all(
                                              color: CommonColor.textColor),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Color(0x332865dc)
                                                  .withAlpha(20),
                                              offset: Offset(0, 4),
                                              blurRadius: 9,
                                            ),
                                          ],
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          child: TextField(
                                            style: TextStyle(
                                              fontSize: 16,
                                            ),
                                            maxLines: 10,
                                            decoration: InputDecoration(
                                              fillColor: Colors.white,
                                              hintText: 'Enter Description',
                                              border: InputBorder.none,
                                              hintStyle: TextStyle(
                                                fontSize: 16,
                                              ),
                                              filled: true,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                CommonSizedBox(width: 30 * size),
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      ImagePath.messages,
                                      height: 18 * size,
                                      width: 18 * size,
                                      color: Colors.black,
                                    ),
                                    Text(
                                      "Comments",
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    )
                                  ],
                                ),
                                CommonSizedBox(width: 5),
                                Container(
                                  padding: EdgeInsets.all(30),
                                  width: width <= 658 ? 400 : 500,
                                  height: 300,
                                  decoration: BoxDecoration(
                                    color: Color(0xffe8f1fd),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              child: Image.network(
                                                'https://wallpapercave.com/wpt/wp9941882.jpg',
                                                height: 45,
                                                width: 45,
                                              ),
                                            ),
                                            CommonSizedBox(width: 10),
                                            Expanded(
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                child: TextField(
                                                  decoration: InputDecoration(
                                                    hintStyle: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                    hintText:
                                                        'Enter Your Comment here ',
                                                    border: InputBorder.none,
                                                    filled: true,
                                                    fillColor: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            CommonSizedBox(width: 10),
                                            InkWell(
                                              onTap: () {},
                                              child: Container(
                                                height: 45,
                                                width: 42,
                                                decoration: BoxDecoration(
                                                  color: CommonColor.mainColor,
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                                child: Center(
                                                  child: Image.asset(
                                                    ImagePath.send,
                                                    height: 24,
                                                    width: 24,
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        CommonSizedBox(height: 41),
                                        ListView.separated(
                                          shrinkWrap: true,
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          itemCount: 2,
                                          itemBuilder: (context, index) {
                                            return SingleChildScrollView(
                                              child: Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(1000),
                                                        child: Image.network(
                                                          'https://wallpapercave.com/wpt/wp9941882.jpg',
                                                          width: 25,
                                                          height: 25,
                                                        ),
                                                      ),
                                                      CommonSizedBox(width: 12),
                                                      Text(
                                                        "Angela Apr 24 , 2023 at 2:30 PM",
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                        ),
                                                      ),
                                                      Spacer(),
                                                      Text(
                                                        "23 Min ago",
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          color: CommonColor
                                                              .textColor,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  CommonSizedBox(height: 9),
                                                  Row(
                                                    children: [
                                                      CommonSizedBox(width: 37),
                                                      Container(
                                                        height: 65,
                                                        clipBehavior: Clip
                                                            .antiAliasWithSaveLayer,
                                                        padding:
                                                            EdgeInsets.only(
                                                          top: 15,
                                                          bottom: 15,
                                                          left: 12,
                                                        ),
                                                        width: width <= 658
                                                            ? 300
                                                            : 400,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                          border: Border.all(
                                                              color: CommonColor
                                                                  .textColor),
                                                          boxShadow: [
                                                            BoxShadow(
                                                              color: Color(
                                                                      0x332865dc)
                                                                  .withAlpha(
                                                                      20),
                                                              offset:
                                                                  Offset(0, 4),
                                                              blurRadius: 9,
                                                            ),
                                                          ],
                                                        ),
                                                        child: Text(
                                                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                                                          maxLines: 2,
                                                          style: TextStyle(
                                                            fontSize: 12,
                                                            color: CommonColor
                                                                .textColor,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                          separatorBuilder: (context, index) {
                                            return CommonSizedBox(height: 20);
                                          },
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                if (width <= 1280)
                                  taskTitleWidget(
                                      size, font, controller, width),
                              ],
                            ),
                          ),
                          if (width > 1281) CommonSizedBox(width: 20),
                          if (width > 1281) VerticalDivider(),
                          if (width > 1281) CommonSizedBox(width: 20),
                          if (width > 1281)
                            taskTitleWidget(size, font, controller, width),
                        ],
                      ),
                    );
                  },
                ),
              );
            },
          )
        ],
      );
    },
  );
}

Padding taskTitleWidget(
    double size, double font, MediaViewController controller, double width) {
  return Padding(
    padding: EdgeInsets.symmetric(
      vertical: 25,
    ),
    child: Column(
      children: [
        SizedBox(
          width: width <= 658 ? 400 : 500,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                ' Task Title:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff262525),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  width: 114,
                  height: 33,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x332865dc),
                        offset: Offset(0 * size, 4 * size),
                        blurRadius: 7.5 * size,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(8),
                    color: CommonColor.mainColor,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Actions",
                        style: TextStyle(
                          fontSize: 14,
                          color: CommonColor.white,
                        ),
                      ),
                      CommonSizedBox(width: 6 * size),
                      SvgPicture.asset(
                        ImagePath.arrowDown,
                        height: 18,
                        width: 18,
                        color: CommonColor.white,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        CommonSizedBox(height: 36 * size),
        Container(
          padding: EdgeInsets.all(40),
          width: width <= 658 ? 400 : 500,
          decoration: BoxDecoration(
            color: Color(0xffe8f1fd),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "Assigners to:",
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  CommonSizedBox(width: 28),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        addUserDialogBox(size, font, controller: controller);
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: TextField(
                          enabled: false,
                          decoration: InputDecoration(
                            suffixIcon: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  ImagePath.search,
                                  height: 18,
                                  width: 18,
                                ),
                              ],
                            ),
                            hintStyle: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                            hintText: 'Maciej kalaska',
                            border: InputBorder.none,
                            filled: true,
                            fillColor: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              CommonSizedBox(height: 30),
              Row(
                children: [
                  Text(
                    "Due Date",
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  CommonSizedBox(width: 44),
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: TextField(
                        decoration: InputDecoration(
                          hintStyle: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                          hintText: 'Due in 5 days',
                          border: InputBorder.none,
                          filled: true,
                          fillColor: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              CommonSizedBox(height: 30),
              Align(
                alignment: Alignment.topLeft,
                child: InkWell(
                  onTap: () {
                    addWatcherDialogBox(size, font, controller: controller);
                  },
                  child: Container(
                    width: 143,
                    height: 33,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x332865dc),
                          offset: Offset(0, 4),
                          blurRadius: 7.5,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(8),
                      color: CommonColor.mainColor,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          ImagePath.add,
                          height: 18,
                          width: 18,
                          color: CommonColor.white,
                        ),
                        CommonSizedBox(width: 6),
                        Text(
                          "Add Watchers",
                          style: TextStyle(
                            fontSize: 14,
                            color: CommonColor.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
