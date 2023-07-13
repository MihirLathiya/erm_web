import 'package:another_stepper/widgets/another_stepper.dart';
import 'package:erm_web/Utils/common_string.dart';
import 'package:erm_web/Utils/image_path.dart';
import 'package:erm_web/ViewModel/task_managment_controller.dart';
import 'package:erm_web/responsive.dart';
import 'package:flutter/material.dart';

/// SHOW TASK PROGRESS
Future<dynamic> showTaskProgress(
    BuildContext context, TaskManagmentController controller) {
  return showDialog(
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          double baseWidth = Responsive.isDesktop(context) ? 1440 : 700;
          final size = MediaQuery.of(context).size.width / baseWidth;
          double font = size * 0.97;
          return SimpleDialog(
            children: [
              Container(
                height: 345,
                width: 656,
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 30),
                color: Colors.white,
                child: Responsive.isDesktop(context)
                    ? web_view(size, font, controller)
                    : mobile_view(
                        size,
                        font,
                        controller,
                      ),
              )
            ],
          );
        },
      );
    },
  );
}

/// WEB VIEW

Column web_view(double size, double font, TaskManagmentController controller) {
  return Column(
    children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Assigned By ',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Color(0xff262525),
            ),
          ),
          Text(
            '  sachin upadhyay',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Color(0xffA3A5AB),
            ),
          ),
          SizedBox(
            width: 24,
          ),
          Text(
            'Assigned to ',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Color(0xff262525),
            ),
          ),
          Text(
            '  Amit varma  ',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Color(0xffA3A5AB),
            ),
          ),
          Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TimeLine(
                text: 'Date created',
                size: size,
                font: font,
                imagePath: ImagePath.timer01,
              ),
              CommonSizedBox(height: 8 * size),
              TimeLine(
                text: 'Complete(By task holder)',
                size: size,
                font: font,
                imagePath: ImagePath.timer02,
              ),
              CommonSizedBox(height: 8 * size),
              TimeLine(
                  text: 'Re - Do',
                  size: size,
                  font: font,
                  imagePath: ImagePath.timer03),
              CommonSizedBox(height: 8 * size),
              TimeLine(
                text: 'Deadline',
                size: size,
                font: font,
                imagePath: ImagePath.timer04,
              ),
              CommonSizedBox(height: 8 * size),
              TimeLine(
                text: 'Complete (BY task creator)',
                size: size,
                font: font,
                imagePath: ImagePath.timer05,
              ),
            ],
          ),
        ],
      ),
      CommonSizedBox(height: 47 * size),
      Container(
        padding: EdgeInsets.fromLTRB(8, 6, 7, 5),
        height: 120,
        decoration: BoxDecoration(
          color: Color(0xffe8f1fd),
          borderRadius: BorderRadius.circular(6 * size),
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
    ],
  );
}

/// MOBILE VIEW

Column mobile_view(
    double size, double font, TaskManagmentController controller) {
  return Column(
    children: [
      Row(
        children: [
          Text(
            'Assigned By',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Color(0xff262525),
            ),
          ),
          Text(
            ' sachin upadhyay',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Color(0xffA3A5AB),
            ),
          ),
        ],
      ),
      CommonSizedBox(height: 6 * size),
      Row(
        children: [
          Text(
            'Assigned to',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Color(0xff262525),
            ),
          ),
          Text(
            ' Amit varma  ',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Color(0xffA3A5AB),
            ),
          ),
        ],
      ),
      Row(
        children: [
          Expanded(
            child: Container(
              height: 200,
            ),
          ),
          Expanded(
            child: Container(
              height: 150 * size,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TimeLine(
                      text: 'Date created',
                      size: size,
                      font: font,
                      imagePath: ImagePath.timer01),
                  CommonSizedBox(height: 8 * size),
                  TimeLine(
                      text: 'Complete(By task holder)',
                      size: size,
                      font: font,
                      imagePath: ImagePath.timer02),
                  CommonSizedBox(height: 8 * size),
                  TimeLine(
                      text: 'Re - Do',
                      size: size,
                      font: font,
                      imagePath: ImagePath.timer03),
                  CommonSizedBox(height: 8 * size),
                  TimeLine(
                      text: 'Deadline',
                      size: size,
                      font: font,
                      imagePath: ImagePath.timer04),
                  CommonSizedBox(height: 8 * size),
                  TimeLine(
                      text: 'Complete (BY task creator)',
                      size: size,
                      font: font,
                      imagePath: ImagePath.timer05),
                ],
              ),
            ),
          ),
        ],
      ),
      Container(
        padding: EdgeInsets.fromLTRB(8, 6, 7, 5),
        height: 35,
        decoration: BoxDecoration(
          color: Color(0xffe8f1fd),
          borderRadius: BorderRadius.circular(6 * size),
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
    ],
  );
}

/// DIALOG TIME LINE
Widget TimeLine({double? size, double? font, String? text, String? imagePath}) {
  return Row(
    children: [
      Image.asset(
        imagePath!,
        height: 15,
        width: 15,
      ),
      CommonSizedBox(width: 10),
      Text(
        text!,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: Color(0xffA3A5AB),
        ),
      ),
    ],
  );
}
