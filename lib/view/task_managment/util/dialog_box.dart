import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:erm_web/Model/ResponseModel/all_user_res_model.dart';
import 'package:erm_web/Utils/colors.dart';
import 'package:erm_web/Utils/common_string.dart';
import 'package:erm_web/Utils/image_path.dart';
import 'package:erm_web/ViewModel/task_managment_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

/// ADD ATTECHMENT POPUP

Future<dynamic> attechmentDialogBox(double size, double font,
    {required TaskManagmentController controller}) {
  return Get.generalDialog(
    barrierDismissible: true,
    barrierLabel: '',
    pageBuilder: (BuildContext buildContext, Animation animation,
        Animation secondaryAnimation) {
      return StatefulBuilder(
        builder: (context, setState) {
          return SimpleDialog(
            contentPadding: EdgeInsets.all(20),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            insetPadding: EdgeInsets.symmetric(horizontal: 20),
            children: [
              Container(
                width: GetPlatform.isWindows ? 366 : Get.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Upload file ",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    CommonSizedBox(height: 20),
                    DottedBorder(
                      color: CommonColor.mainColor,
                      borderType: BorderType.RRect,
                      strokeCap: StrokeCap.butt,
                      radius: Radius.circular(12),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        child: Container(
                          width: Get.width,
                          height: 121,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Color(0xffe8f1fd),
                          ),
                          padding: EdgeInsets.symmetric(
                            vertical: 23,
                            horizontal: 23,
                          ),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              DropzoneView(
                                onCreated: (controllera) {
                                  controller.dropController = controllera;
                                },
                                onDrop: (value) async {
                                  await controller.acceptFile(value);
                                  setState(() {});
                                },
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  // CommonSizedBox(height: 8),
                                  Row(
                                    children: [
                                      Text(
                                        "Drag and Drop file here or ",
                                        style: TextStyle(
                                          fontSize: 12,
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () async {
                                          await controller.pickUpFile();
                                          setState(() {});
                                        },
                                        child: Text(
                                          "chose file",
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    CommonSizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Supported formates :XLS , XLSX ",
                          style: TextStyle(
                            fontSize: 12,
                            color: CommonColor.textColor,
                          ),
                        ),
                        Text(
                          "maximum size : 25 MBX ",
                          style: TextStyle(
                            fontSize: 12,
                            color: CommonColor.textColor,
                          ),
                        )
                      ],
                    ),
                    CommonSizedBox(height: 22),
                    if (controller.data != null)
                      Container(
                        padding: EdgeInsets.all(16),
                        width: Get.width,
                        color: Color(0xffF8FAFE),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              controller.name!.contains('png') ||
                                      controller.name!.contains('jpg') ||
                                      controller.name!.contains('jpeg')
                                  ? ImagePath.png
                                  : controller.name!.contains('pdf') ||
                                          controller.name!.contains('doc')
                                      ? ImagePath.pdf
                                      : ImagePath.xls,
                              height: 28,
                              width: 25,
                            ),
                            CommonSizedBox(width: 17),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${controller.name}",
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                                Text(
                                  "${controller.size} . ${DateFormat.yMMMEd().format(DateTime.now())}  ",
                                  style: TextStyle(
                                    fontSize: 12,
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
                                height: 16,
                                width: 16,
                              ),
                            ),
                            CommonSizedBox(width: 8),
                            InkWell(
                              onTap: () {
                                controller.data = null;
                                controller.url = null;
                                controller.name = null;
                                controller.size = null;
                                setState(() {});
                              },
                              child: Image.asset(
                                ImagePath.trash,
                                height: 16,
                                width: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    CommonSizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Container(
                            height: 30,
                            width: 92,
                            decoration: BoxDecoration(
                              border: Border.all(color: CommonColor.mainColor),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              "Cancel ",
                              style: TextStyle(
                                fontSize: 12,
                                color: CommonColor.mainColor,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                        CommonSizedBox(width: 8),
                        InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Container(
                            height: 30,
                            width: 92,
                            decoration: BoxDecoration(
                              color: Color(0xffe6edfc),
                              border: Border.all(color: CommonColor.mainColor),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              "Submit ",
                              style: TextStyle(
                                fontSize: 12,
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
Future<dynamic> addWatcherDialogBox(
  double size,
  double font, {
  required TaskManagmentController controller,
  List<AllUserResponseModel>? allUserList,
}) {
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
            insetPadding: EdgeInsets.symmetric(horizontal: 20),
            children: [
              Container(
                width: GetPlatform.isWindows ? 366 : Get.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Add Watchers",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    CommonSizedBox(height: 20),
                    Container(
                      width: Get.width,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      decoration: BoxDecoration(
                        color: Color(0xffffffff),
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x332865dc).withAlpha(30),
                            offset: Offset(0, 4),
                            blurRadius: 15,
                          ),
                        ],
                      ),
                      child: TextField(
                        controller: controller.searchWatcherController,
                        onChanged: (value) {
                          setState(() {});
                        },
                        decoration: InputDecoration(
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
                          suffixIcon: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    width: 1,
                                    height: 21,
                                    color: CommonColor.textColor,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Transform.rotate(
                                    angle: 91.13,
                                    child: SvgPicture.asset(
                                      ImagePath.arrowDown,
                                      height: 18,
                                      width: 18,
                                      color: CommonColor.textColor,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          hintStyle: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                          hintText: 'Search Any Existing User Watchers',
                          border: InputBorder.none,
                          filled: true,
                          fillColor: Colors.white,
                        ),
                      ),
                    ),
                    CommonSizedBox(height: 20),
                    Container(
                      height: 229,
                      padding: EdgeInsets.all(20),
                      width: Get.width,
                      decoration: BoxDecoration(
                        color: Color(0xffe8f1fd),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: MediaQuery.removePadding(
                        context: context,
                        removeTop: true,
                        child: ListView.separated(
                          physics: BouncingScrollPhysics(),
                          itemCount: allUserList!.length,
                          itemBuilder: (context, index) {
                            return allUserList[index]
                                        .firstName
                                        .toString()
                                        .toLowerCase()
                                        .contains(controller
                                            .searchWatcherController.text
                                            .toLowerCase()) ||
                                    controller
                                        .searchWatcherController.text.isEmpty
                                ? InkWell(
                                    onTap: () {
                                      controller.updateSelectWatcherValue(
                                          id: allUserList[index].id.toString());
                                      setState(() {});
                                    },
                                    child: Container(
                                      height: 36,
                                      width: Get.width,
                                      padding: EdgeInsets.all(3),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            controller.selectWatcherValue
                                                    .contains(
                                                        allUserList[index].id)
                                                ? Color(0xff2865DC)
                                                    .withAlpha(200)
                                                : Colors.white,
                                            controller.selectWatcherValue
                                                    .contains(
                                                        allUserList[index].id)
                                                ? Color(0xff2865DC)
                                                    .withAlpha(100)
                                                : Colors.white,
                                            Color(0xffFFFFFF),
                                            Color(0xffFFFFFF),
                                          ],
                                        ),
                                      ),
                                      child: Container(
                                        clipBehavior:
                                            Clip.antiAliasWithSaveLayer,
                                        decoration: BoxDecoration(
                                          color: Color(0xffffffff),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Color(0x332865dc)
                                                  .withAlpha(30),
                                              offset: Offset(0, 4),
                                              blurRadius: 15,
                                            ),
                                          ],
                                        ),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Row(
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(1000),
                                              child: CachedNetworkImage(
                                                imageUrl:
                                                    '${allUserList[index].photo}',
                                                height: 24,
                                                width: 24,
                                                placeholder: (context, url) =>
                                                    CircularProgressIndicator(),
                                                errorWidget:
                                                    (context, url, error) =>
                                                        Icon(
                                                  Icons.error,
                                                  size: 20,
                                                ),
                                              ),
                                            ),
                                            CommonSizedBox(width: 6),
                                            Text(
                                              "${allUserList[index].firstName}",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: CommonColor.textColor),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                : SizedBox();
                          },
                          separatorBuilder: (context, index) {
                            return CommonSizedBox(
                                height: allUserList[index]
                                            .firstName
                                            .toString()
                                            .toLowerCase()
                                            .contains(controller
                                                .searchWatcherController.text
                                                .toLowerCase()) ||
                                        controller.searchWatcherController.text
                                            .isEmpty
                                    ? 15
                                    : 0);
                          },
                        ),
                      ),
                    ),
                    CommonSizedBox(height: 20),
                    Align(
                      alignment: Alignment.center,
                      child: InkWell(
                        onTap: () {
                          controller.updateSelectWatcherValue(
                              id: '', isDuplicate: true);
                          Get.back();
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
    {required TaskManagmentController controller,
    List<AllUserResponseModel>? allUserList}) {
  return Get.generalDialog(
    barrierDismissible: true,
    barrierLabel: '',
    pageBuilder: (BuildContext buildContext, Animation animation,
        Animation secondaryAnimation) {
      return StatefulBuilder(
        builder: (context, setStat) {
          return SimpleDialog(
            contentPadding: EdgeInsets.all(20),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            insetPadding: EdgeInsets.symmetric(horizontal: 20),
            children: [
              Container(
                width: GetPlatform.isWindows ? 366 : Get.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Username list:",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    CommonSizedBox(height: 20),
                    Container(
                      width: Get.width,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      decoration: BoxDecoration(
                        color: Color(0xffffffff),
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x332865dc).withAlpha(30),
                            offset: Offset(0, 4),
                            blurRadius: 15,
                          ),
                        ],
                      ),
                      child: TextField(
                        controller: controller.searchUserNameController,
                        onChanged: (value) {
                          controller.update();
                          setStat(() {});
                        },
                        decoration: InputDecoration(
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
                          suffixIcon: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    width: 1,
                                    height: 21,
                                    color: CommonColor.textColor,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Transform.rotate(
                                    angle: 91.13,
                                    child: SvgPicture.asset(
                                      ImagePath.arrowDown,
                                      height: 18,
                                      width: 18,
                                      color: CommonColor.textColor,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          hintStyle: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                          hintText: 'Search Any Existing User Watchers',
                          border: InputBorder.none,
                          filled: true,
                          fillColor: Colors.white,
                        ),
                      ),
                    ),
                    CommonSizedBox(height: 20),
                    Container(
                      height: 229,
                      padding: EdgeInsets.all(20),
                      width: Get.width,
                      decoration: BoxDecoration(
                        color: Color(0xffe8f1fd),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: MediaQuery.removePadding(
                        context: context,
                        removeTop: true,
                        child: ListView.separated(
                          physics: BouncingScrollPhysics(),
                          itemCount: allUserList!.length,
                          itemBuilder: (context, index) {
                            return allUserList[index]
                                        .firstName
                                        .toString()
                                        .toLowerCase()
                                        .contains(controller
                                            .searchUserNameController.text
                                            .toLowerCase()) ||
                                    controller
                                        .searchUserNameController.text.isEmpty
                                ? InkWell(
                                    onTap: () {
                                      controller.updateSelectUserName(index);
                                      setStat(() {});
                                    },
                                    child: Container(
                                      height: 36,
                                      width: Get.width,
                                      padding: EdgeInsets.all(3),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            controller.selectUserName == index
                                                ? Color(0xff2865DC)
                                                    .withAlpha(200)
                                                : Colors.white,
                                            controller.selectUserName == index
                                                ? Color(0xff2865DC)
                                                    .withAlpha(100)
                                                : Colors.white,
                                            Color(0xffFFFFFF),
                                            Color(0xffFFFFFF),
                                          ],
                                        ),
                                      ),
                                      child: Container(
                                        clipBehavior:
                                            Clip.antiAliasWithSaveLayer,
                                        decoration: BoxDecoration(
                                          color: Color(0xffffffff),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Color(0x332865dc)
                                                  .withAlpha(30),
                                              offset: Offset(0, 4),
                                              blurRadius: 15,
                                            ),
                                          ],
                                        ),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Row(
                                          children: [
                                            Text(
                                              "${allUserList[index].firstName}",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: CommonColor.textColor),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                : SizedBox();
                          },
                          separatorBuilder: (context, index) {
                            return CommonSizedBox(
                                height: allUserList[index]
                                            .firstName
                                            .toString()
                                            .toLowerCase()
                                            .contains(controller
                                                .searchUserNameController.text
                                                .toLowerCase()) ||
                                        controller.searchUserNameController.text
                                            .isEmpty
                                    ? 15
                                    : 0);
                          },
                        ),
                      ),
                    ),
                    CommonSizedBox(height: 20),
                    Align(
                      alignment: Alignment.center,
                      child: InkWell(
                        onTap: () {
                          if (controller.selectUserName != -1) {
                            controller.updateSelectUserNameValue(
                              name: allUserList[controller.selectUserName]
                                  .firstName,
                              id: allUserList[controller.selectUserName].id,
                            );
                            print('-------${controller.selectUserNameValue}');
                          }
                          Get.back();
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
                          child: Center(
                            child: Text(
                              "Add",
                              style: TextStyle(
                                fontSize: 14,
                                color: CommonColor.white,
                              ),
                            ),
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
