import 'package:another_stepper/another_stepper.dart';
import 'package:erm_web/Utils/image_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TaskManagmentController extends GetxController {
  int assignByMe = 0;
  updateAssign(int index) {
    assignByMe = index;
    update();
  }

  // Initial Selected Value
  String dropdownValue = '10';

  // List of items in our dropdown menu
  var items = [
    '10',
    '20',
    '30',
    '40',
    '50',
  ];

  updateDropDownValue(String val) {
    dropdownValue = val;
    update();
  }

  List<Map<String, dynamic>> userData = [
    {
      'account': {
        'image': 'https://wallpapercave.com/dwp1x/wp8262039.jpg',
        'name': 'Alex',
        'time': ' April 30 , 2023 at 2.40 pm'
      },
      'contact': {
        'email': '  DarleneRobertson@ mail.com',
        'phone': '  (891) 252-4969'
      },
      'lead': {'status': false},
      'date': {'create': 'Due in 5 days'},
      'assignUser': {
        'image': 'https://wallpapercave.com/fwp/wp12455757.jpg',
        'name': 'John Kuy'
      },
    },
    {
      'account': {
        'image': 'https://wallpapercave.com/dwp1x/wp8562124.jpg',
        'name': 'Naruto',
        'time': ' April 30 , 2023 at 2.40 pm'
      },
      'contact': {'email': '  Naruto@ mail.com', 'phone': '  (891) 252-4969'},
      'lead': {'status': true},
      'date': {'create': 'Completed by 5 days'},
      'assignUser': {
        'image': 'https://wallpapercave.com/fwp/wp12455757.jpg',
        'name': 'John Kuy'
      },
    },
    {
      'account': {
        'image': 'https://wallpapercave.com/dwp1x/wp5427844.jpg',
        'name': 'Kakashi',
        'time': ' April 30 , 2023 at 2.40 pm'
      },
      'contact': {'email': '  Kakashi@ mail.com', 'phone': '  (891) 252-4969'},
      'lead': {'status': true},
      'date': {'create': 'Completed by 5 days'},
      'assignUser': {
        'image': 'https://wallpapercave.com/fwp/wp12455757.jpg',
        'name': 'John Kuy'
      },
    },
    {
      'account': {
        'image': 'https://wallpapercave.com/dwp1x/wp8562126.png',
        'name': 'Pain',
        'time': ' April 30 , 2023 at 2.40 pm'
      },
      'contact': {'email': '  Pain@ mail.com', 'phone': '  (891) 252-4969'},
      'lead': {'status': false},
      'date': {'create': 'Due in 5 days'},
      'assignUser': {
        'image': 'https://wallpapercave.com/fwp/wp12455757.jpg',
        'name': 'John Kuy'
      },
    },
    {
      'account': {
        'image': 'https://wallpapercave.com/dwp1x/wp8262039.jpg',
        'name': 'Alex',
        'time': ' April 30 , 2023 at 2.40 pm'
      },
      'contact': {
        'email': '  DarleneRobertson@ mail.com',
        'phone': '  (891) 252-4969'
      },
      'lead': {'status': false},
      'date': {'create': 'Due in 5 days'},
      'assignUser': {
        'image': 'https://wallpapercave.com/fwp/wp12455757.jpg',
        'name': 'John Kuy'
      },
    },
    {
      'account': {
        'image': 'https://wallpapercave.com/dwp1x/wp8562124.jpg',
        'name': 'Naruto',
        'time': ' April 30 , 2023 at 2.40 pm'
      },
      'contact': {'email': '  Naruto@ mail.com', 'phone': '  (891) 252-4969'},
      'lead': {'status': true},
      'date': {'create': 'Completed by 5 days'},
      'assignUser': {
        'image': 'https://wallpapercave.com/fwp/wp12455757.jpg',
        'name': 'John Kuy'
      },
    },
    {
      'account': {
        'image': 'https://wallpapercave.com/dwp1x/wp5427844.jpg',
        'name': 'Kakashi',
        'time': ' April 30 , 2023 at 2.40 pm'
      },
      'contact': {'email': '  Kakashi@ mail.com', 'phone': '  (891) 252-4969'},
      'lead': {'status': true},
      'date': {'create': 'Completed by 5 days'},
      'assignUser': {
        'image': 'https://wallpapercave.com/fwp/wp12455757.jpg',
        'name': 'John Kuy'
      },
    },
    {
      'account': {
        'image': 'https://wallpapercave.com/dwp1x/wp8562126.png',
        'name': 'Pain',
        'time': ' April 30 , 2023 at 2.40 pm'
      },
      'contact': {'email': '  Pain@ mail.com', 'phone': '  (891) 252-4969'},
      'lead': {'status': false},
      'date': {'create': 'Due in 5 days'},
      'assignUser': {
        'image': 'https://wallpapercave.com/fwp/wp12455757.jpg',
        'name': 'John Kuy'
      },
    },
  ];

  List<StepperData> stepperData = [
    StepperData(
      iconWidget: Container(
        height: 60,
        width: 60,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30), color: Color(0xff2864D9)),
        child: Image.asset(
          ImagePath.timer1,
        ),
      ),
    ),
    StepperData(
      iconWidget: Container(
        height: 60,
        width: 60,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30), color: Color(0xff2864D9)),
        child: Image.asset(
          ImagePath.timer2,
        ),
      ),
    ),
    StepperData(
      iconWidget: Container(
        height: 60,
        width: 60,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Color(
            0xff2864D9,
          ),
        ),
        child: Image.asset(
          ImagePath.timer3,
        ),
      ),
    ),
    StepperData(
      iconWidget: Container(
        height: 60,
        width: 60,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Color(
            0xff2864D9,
          ),
        ),
        child: Image.asset(ImagePath.timer4),
      ),
    ),
    StepperData(
      iconWidget: Container(
        height: 60,
        width: 60,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Color(
            0xff2864D9,
          ),
        ),
        child: Image.asset(
          ImagePath.timer5,
        ),
      ),
    ),
  ];
}
