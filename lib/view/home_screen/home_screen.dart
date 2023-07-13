import 'package:erm_web/Utils/colors.dart';
import 'package:erm_web/Utils/common_text.dart';
import 'package:erm_web/Utils/image_path.dart';
import 'package:erm_web/ViewModel/home_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    double baseWidth = 812;
    final size = MediaQuery.of(context).size.height / baseWidth;
    double font = size * 0.97;
    return GetBuilder<HomeController>(
      builder: (controller) {
        return ListView.separated(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.only(
              left: 20 * size, right: 20 * size, top: 20 * size),
          itemCount: 10,
          itemBuilder: (context, index) {
            return Container(
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
                  Row(
                    children: [
                      Container(
                        // ellipse15huF (1:209)
                        width: 46 * size,
                        height: 46 * size,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(23 * size),
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Dhara plant Pumping',
                            style: TextStyle(
                              fontSize: 16 * font,
                              color: Color(0xff262525),
                            ),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.access_time,
                                size: 15 * size,
                                color: Color(0xffA3A5AB),
                              ),
                              SizedBox(
                                width: 3 * size,
                              ),
                              Text(
                                'April 30 , 2023 at 2.40 pm',
                                style: TextStyle(
                                  fontSize: 12 * font,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xffa3a5ab),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Spacer(),
                      Container(
                        width: 32 * size,
                        height: 32 * size,
                        decoration: BoxDecoration(
                            color: Color(0xffE8F1FD), shape: BoxShape.circle),
                        padding: EdgeInsets.all(5 * size),
                        child: SvgPicture.asset(
                          ImagePath.add,
                          color: CommonColor.mainColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16 * size,
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(
                        6 * size, 7 * size, 6 * size, 6 * size),
                    width: 306 * size,
                    decoration: BoxDecoration(
                      color: Color(0xffe8f1fd),
                      borderRadius: BorderRadius.circular(8 * size),
                    ),
                    child: Text(
                      ' Name:',
                      style: TextStyle(
                        fontSize: 14 * font,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff262525),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 22 * size,
                  ),
                  Row(
                    children: [
                      Text(
                        'No.of Day :',
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
                      SizedBox(
                        width: 8 * size,
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(
                            5.5 * size, 5 * size, 6 * size, 5 * size),
                        height: 24 * size,
                        decoration: BoxDecoration(
                          color: Color(0xffe8f1fd),
                          borderRadius: BorderRadius.circular(6 * size),
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
                                height: 15 * size,
                                width: 15 * size,
                                color: CommonColor.textColor,
                              ),
                              dropdownColor: Colors.white,
                              hint: CommonText(
                                text: controller.dropdownValue.isNotEmpty
                                    ? controller.dropdownValue
                                    : '5 Task',
                                color: CommonColor.textColor,
                                fontSize: 12 * size,
                              ),
                              items: controller.taskList.map(
                                (e) {
                                  return DropdownMenuItem<String>(
                                    child: Text(
                                      '$e',
                                      style: TextStyle(
                                        color: CommonColor.textColor,
                                      ),
                                    ),
                                    value: e,
                                  );
                                },
                              ).toList(),
                              onChanged: (value) {
                                controller.updateDropDownValue(value!);
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 18 * size,
                  ),
                  Row(
                    children: [
                      Text(
                        "Reminder : ",
                        style: TextStyle(
                          fontSize: 12 * font,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(
                            8 * size, 6 * size, 7 * size, 5 * size),
                        height: 29 * size,
                        decoration: BoxDecoration(
                          color: Color(0xffe8f1fd),
                          borderRadius: BorderRadius.circular(6 * size),
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
                                ImagePath.open,
                                height: 15 * size,
                                width: 15 * size,
                                color: CommonColor.textColor,
                              ),
                              dropdownColor: Colors.white,
                              hint: CommonText(
                                text: controller.reminderValue.isNotEmpty
                                    ? controller.reminderValue
                                    : '5',
                                color: CommonColor.textColor,
                                fontSize: 12 * size,
                              ),
                              items: controller.reminderList.map(
                                (e) {
                                  return DropdownMenuItem<String>(
                                    child: Text(
                                      '$e',
                                      style: TextStyle(
                                        color: CommonColor.textColor,
                                      ),
                                    ),
                                    value: e,
                                  );
                                },
                              ).toList(),
                              onChanged: (value) {
                                controller.updateReminderValue(value!);
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 32 * size,
                  ),
                  Row(
                    children: [
                      Text(
                        'Team Member:',
                        style: TextStyle(
                          fontSize: 14 * font,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff262525),
                        ),
                      ),
                      SizedBox(
                        width: 4 * size,
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(
                            0 * size, 0 * size, 9 * size, 0 * size),
                        width: 56 * size,
                        height: 28 * size,
                        child: Stack(
                          children: [
                            Positioned(
                              // ellipse16pQm (1:245)
                              left: 0 * size,
                              top: 0 * size,
                              child: Container(
                                width: 28 * size,
                                height: 28 * size,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(14 * size),
                                  color: Color(0xffd9d9d9),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        'https://wallpapercave.com/fwp/wp12482310.jpg'),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              // ellipse19KsK (1:246)
                              left: 14 * size,
                              top: 0 * size,
                              child: Container(
                                width: 28 * size,
                                height: 28 * size,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(14 * size),
                                  color: Color(0xffd9d9d9),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        'https://wallpapercave.com/fwp/wp12493824.jpg'),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              // group9316dt1 (1:251)
                              left: 28 * size,
                              top: 0 * size,
                              child: Container(
                                width: 28 * size,
                                height: 28 * size,
                                decoration: BoxDecoration(
                                  color: Color(0xffe8f1fd),
                                  borderRadius:
                                      BorderRadius.circular(14 * size),
                                ),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      ImagePath.add,
                                      color: CommonColor.mainColor,
                                      width: 14 * size,
                                      height: 14 * size,
                                    ),
                                    Text(
                                      '3',
                                      style: TextStyle(
                                        fontSize: 13 * font,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff2865db),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SvgPicture.asset(
                        ImagePath.more_horizaontal,
                        height: 5 * size,
                        width: 21 * size,
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
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(
              height: 20 * size,
            );
          },
        );
      },
    );
  }

  String? selectedValue;
}

InkWell homeButtons({
  double? size,
  void Function()? onTap,
  String? image,
}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      width: size! * 28,
      height: size * 28,
      decoration: BoxDecoration(
        color: Color.fromRGBO(232, 241, 253, 0.14),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: EdgeInsets.all(size * 4),
      child: SvgPicture.asset(
        image!,
        height: size * 20,
        width: size * 20,
        color: CommonColor.white,
      ),
    ),
  );
}
