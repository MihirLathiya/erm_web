import 'package:dotted_border/dotted_border.dart';
import 'package:erm_web/Utils/colors.dart';
import 'package:erm_web/Utils/common_string.dart';
import 'package:erm_web/Utils/image_path.dart';
import 'package:erm_web/ViewModel/media_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

/// ADD ATTECHMENT POPUP

Future<dynamic> attechmentDialogBox(double size, double font,
    {required MediaViewController controller}) {
  return Get.generalDialog(
    barrierDismissible: true,
    barrierLabel: '',
    pageBuilder: (BuildContext buildContext, Animation animation,
        Animation secondaryAnimation) {
      return StatefulBuilder(
        builder: (context, setState) {
          return SimpleDialog(
            contentPadding: EdgeInsets.all(20 * size),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            insetPadding: EdgeInsets.symmetric(horizontal: 20 * size),
            children: [
              Container(
                width: GetPlatform.isWindows ? 366 : Get.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Upload file ",
                      style: TextStyle(
                        fontSize: 16 * font,
                      ),
                    ),
                    CommonSizedBox(height: 20 * size),
                    DottedBorder(
                      color: CommonColor.mainColor,
                      borderType: BorderType.RRect,
                      strokeCap: StrokeCap.butt,
                      radius: Radius.circular(12),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        child: Container(
                          width: Get.width,
                          height: 121 * size,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Color(0xffe8f1fd),
                          ),
                          padding: EdgeInsets.symmetric(
                            vertical: 23 * size,
                            horizontal: 23 * size,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              CommonSizedBox(height: 8 * size),
                              Row(
                                children: [
                                  Text(
                                    "Drag and Drop file here or ",
                                    style: TextStyle(
                                      fontSize: 12 * font,
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: Text(
                                      "chose file",
                                      style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        fontSize: 12 * font,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    CommonSizedBox(height: 8 * size),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Supported formates :XLS , XLSX ",
                          style: TextStyle(
                            fontSize: 12 * font,
                            color: CommonColor.textColor,
                          ),
                        ),
                        Text(
                          "maximum size : 25 MBX ",
                          style: TextStyle(
                            fontSize: 12 * font,
                            color: CommonColor.textColor,
                          ),
                        )
                      ],
                    ),
                    CommonSizedBox(height: 22 * size),
                    Container(
                      padding: EdgeInsets.all(16 * size),
                      width: Get.width,
                      color: Color(0xffF8FAFE),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            ImagePath.pdf,
                            height: 28 * size,
                            width: 25 * size,
                          ),
                          CommonSizedBox(width: 17 * size),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "File Title.pdf",
                                style: TextStyle(
                                  fontSize: 14 * font,
                                ),
                              ),
                              Text(
                                "313 KB . 31 Aug, 2022  ",
                                style: TextStyle(
                                  fontSize: 12 * font,
                                  color: CommonColor.textColor,
                                ),
                              )
                            ],
                          ),
                          Spacer(),
                          InkWell(
                            onTap: () {},
                            child: SvgPicture.asset(
                              ImagePath.fi_download,
                              height: 16 * size,
                              width: 16 * size,
                            ),
                          ),
                          CommonSizedBox(width: 8 * size),
                          InkWell(
                            onTap: () {},
                            child: SvgPicture.asset(
                              ImagePath.trash,
                              height: 16 * size,
                              width: 16 * size,
                              color: Color(0xffF92828),
                            ),
                          ),
                        ],
                      ),
                    ),
                    CommonSizedBox(height: 20 * size),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Container(
                            height: 30 * size,
                            width: 92 * size,
                            decoration: BoxDecoration(
                              border: Border.all(color: CommonColor.mainColor),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              "Cancel ",
                              style: TextStyle(
                                fontSize: 12 * font,
                                color: CommonColor.mainColor,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                        CommonSizedBox(width: 8 * size),
                        InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Container(
                            height: 30 * size,
                            width: 92 * size,
                            decoration: BoxDecoration(
                              color: Color(0xffe6edfc),
                              border: Border.all(color: CommonColor.mainColor),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              "Submit ",
                              style: TextStyle(
                                fontSize: 12 * font,
                                color: CommonColor.mainColor,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          );
        },
      );
    },
  );
}

/// ADD WATCHER POPUP
Future<dynamic> addWatcherDialogBox(double size, double font,
    {required MediaViewController controller}) {
  return Get.generalDialog(
    barrierDismissible: true,
    barrierLabel: '',
    pageBuilder: (BuildContext buildContext, Animation animation,
        Animation secondaryAnimation) {
      return StatefulBuilder(
        builder: (context, setState) {
          return SimpleDialog(
            contentPadding: EdgeInsets.all(20 * size),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            insetPadding: EdgeInsets.symmetric(horizontal: 20 * size),
            children: [
              Container(
                width: GetPlatform.isWindows ? 366 : Get.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Add Watchers",
                      style: TextStyle(
                        fontSize: 16 * font,
                      ),
                    ),
                    CommonSizedBox(height: 20 * size),
                    Container(
                      width: Get.width,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      decoration: BoxDecoration(
                        color: Color(0xffffffff),
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x332865dc).withAlpha(30),
                            offset: Offset(0 * size, 4 * size),
                            blurRadius: 15 * size,
                          ),
                        ],
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          prefixIcon: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                ImagePath.search,
                                height: 18 * size,
                                width: 18 * size,
                              ),
                            ],
                          ),
                          suffixIcon: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    width: 1 * size,
                                    height: 21 * size,
                                    color: CommonColor.textColor,
                                  ),
                                  SizedBox(
                                    width: 10 * size,
                                  ),
                                  Transform.rotate(
                                    angle: 91.13,
                                    child: SvgPicture.asset(
                                      ImagePath.arrowDown,
                                      height: 18 * size,
                                      width: 18 * size,
                                      color: CommonColor.textColor,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          hintStyle: TextStyle(
                            fontSize: 12 * font,
                            fontWeight: FontWeight.w400,
                          ),
                          hintText: 'Search Any Existing User Watchers',
                          border: InputBorder.none,
                          filled: true,
                          fillColor: Colors.white,
                        ),
                      ),
                    ),
                    CommonSizedBox(height: 20 * size),
                    Container(
                      height: 229 * size,
                      padding: EdgeInsets.all(20 * size),
                      width: Get.width,
                      decoration: BoxDecoration(
                        color: Color(0xffe8f1fd),
                        borderRadius: BorderRadius.circular(8 * size),
                      ),
                      child: MediaQuery.removePadding(
                        context: context,
                        removeTop: true,
                        child: ListView.separated(
                          physics: BouncingScrollPhysics(),
                          itemCount: 4,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                controller.updateAddWatcher(index);
                                setState(() {});
                              },
                              child: Container(
                                height: 36 * size,
                                width: Get.width,
                                padding: EdgeInsets.all(3),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      controller.addWatcher == index
                                          ? Color(0xff2865DC).withAlpha(200)
                                          : Colors.white,
                                      controller.addWatcher == index
                                          ? Color(0xff2865DC).withAlpha(100)
                                          : Colors.white,
                                      Color(0xffFFFFFF),
                                      Color(0xffFFFFFF),
                                    ],
                                  ),
                                ),
                                child: Container(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  decoration: BoxDecoration(
                                    color: Color(0xffffffff),
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(0x332865dc).withAlpha(30),
                                        offset: Offset(0 * size, 4 * size),
                                        blurRadius: 15 * size,
                                      ),
                                    ],
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10 * size),
                                  child: Row(
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(1000),
                                        child: Image.network(
                                          'https://wallpapercave.com/fwp/wp12507633.jpg',
                                          height: 24 * size,
                                          width: 24 * size,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      CommonSizedBox(width: 6 * size),
                                      Text(
                                        "Maciej kalaska",
                                        style: TextStyle(
                                            fontSize: 12 * font,
                                            color: CommonColor.textColor),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return CommonSizedBox(height: 15 * size);
                          },
                        ),
                      ),
                    ),
                    CommonSizedBox(height: 20 * size),
                    Align(
                      alignment: Alignment.center,
                      child: InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          width: 143 * size,
                          height: 33 * size,
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
                              SvgPicture.asset(
                                ImagePath.add,
                                height: 18 * size,
                                width: 18 * size,
                                color: CommonColor.white,
                              ),
                              CommonSizedBox(width: 6 * size),
                              Text(
                                "Add Watchers",
                                style: TextStyle(
                                  fontSize: 14 * font,
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
              )
            ],
          );
        },
      );
    },
  );
}

/// ADD USER POP UP
Future<dynamic> addUserDialogBox(double size, double font,
    {required MediaViewController controller}) {
  return Get.generalDialog(
    barrierDismissible: true,
    barrierLabel: '',
    pageBuilder: (BuildContext buildContext, Animation animation,
        Animation secondaryAnimation) {
      return StatefulBuilder(
        builder: (context, setStat) {
          return SimpleDialog(
            contentPadding: EdgeInsets.all(20 * size),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            insetPadding: EdgeInsets.symmetric(horizontal: 20 * size),
            children: [
              Container(
                width: GetPlatform.isWindows ? 366 : Get.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Username list:",
                      style: TextStyle(
                        fontSize: 16 * font,
                      ),
                    ),
                    CommonSizedBox(height: 20 * size),
                    Container(
                      width: Get.width,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      decoration: BoxDecoration(
                        color: Color(0xffffffff),
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x332865dc).withAlpha(30),
                            offset: Offset(0 * size, 4 * size),
                            blurRadius: 15 * size,
                          ),
                        ],
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          prefixIcon: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                ImagePath.search,
                                height: 18 * size,
                                width: 18 * size,
                              ),
                            ],
                          ),
                          suffixIcon: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    width: 1 * size,
                                    height: 21 * size,
                                    color: CommonColor.textColor,
                                  ),
                                  SizedBox(
                                    width: 10 * size,
                                  ),
                                  Transform.rotate(
                                    angle: 91.13,
                                    child: SvgPicture.asset(
                                      ImagePath.arrowDown,
                                      height: 18 * size,
                                      width: 18 * size,
                                      color: CommonColor.textColor,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          hintStyle: TextStyle(
                            fontSize: 12 * font,
                            fontWeight: FontWeight.w400,
                          ),
                          hintText: 'Search Any Existing User Watchers',
                          border: InputBorder.none,
                          filled: true,
                          fillColor: Colors.white,
                        ),
                      ),
                    ),
                    CommonSizedBox(height: 20 * size),
                    Container(
                      height: 229 * size,
                      padding: EdgeInsets.all(20 * size),
                      width: Get.width,
                      decoration: BoxDecoration(
                        color: Color(0xffe8f1fd),
                        borderRadius: BorderRadius.circular(8 * size),
                      ),
                      child: MediaQuery.removePadding(
                        context: context,
                        removeTop: true,
                        child: ListView.separated(
                          physics: BouncingScrollPhysics(),
                          itemCount: 4,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                controller.updateSelectUserName(index);
                                setStat(() {});
                              },
                              child: Container(
                                height: 36 * size,
                                width: Get.width,
                                padding: EdgeInsets.all(3),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      controller.selectUserName == index
                                          ? Color(0xff2865DC).withAlpha(200)
                                          : Colors.white,
                                      controller.selectUserName == index
                                          ? Color(0xff2865DC).withAlpha(100)
                                          : Colors.white,
                                      Color(0xffFFFFFF),
                                      Color(0xffFFFFFF),
                                    ],
                                  ),
                                ),
                                child: Container(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  decoration: BoxDecoration(
                                    color: Color(0xffffffff),
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(0x332865dc).withAlpha(30),
                                        offset: Offset(0 * size, 4 * size),
                                        blurRadius: 15 * size,
                                      ),
                                    ],
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10 * size),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Maciej kalaska",
                                        style: TextStyle(
                                            fontSize: 12 * font,
                                            color: CommonColor.textColor),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return CommonSizedBox(height: 15 * size);
                          },
                        ),
                      ),
                    ),
                    CommonSizedBox(height: 20 * size),
                    Align(
                      alignment: Alignment.center,
                      child: InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          width: 143 * size,
                          height: 33 * size,
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
                              SvgPicture.asset(
                                ImagePath.add,
                                height: 18 * size,
                                width: 18 * size,
                                color: CommonColor.white,
                              ),
                              CommonSizedBox(width: 6 * size),
                              Text(
                                "Add Watchers",
                                style: TextStyle(
                                  fontSize: 14 * font,
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
              )
            ],
          );
        },
      );
    },
  );
}
