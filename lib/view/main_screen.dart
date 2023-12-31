import 'package:erm_web/Utils/colors.dart';
import 'package:erm_web/Utils/common_string.dart';
import 'package:erm_web/Utils/common_text.dart';
import 'package:erm_web/Utils/image_path.dart';
import 'package:erm_web/ViewModel/bottom_navigation_bar_controller.dart';
import 'package:erm_web/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

final scaffoldKey = GlobalKey<ScaffoldState>();

class WebMainScreen extends StatefulWidget {
  const WebMainScreen({Key? key}) : super(key: key);

  @override
  State<WebMainScreen> createState() => _WebMainScreenState();
}

class _WebMainScreenState extends State<WebMainScreen> {
  BottomNavigationBarController bottomNavigationBarController =
      Get.put(BottomNavigationBarController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width / 1440;
    double font = size * 0.97;
    return GetBuilder<BottomNavigationBarController>(
      builder: (controller) {
        return Scaffold(
          key: scaffoldKey,
          drawer: MediaQuery.of(context).size.width <= 910
              ? sideBar(size, controller, scaffoldKey)
              : SizedBox(),
          backgroundColor: Colors.white,
          body: Responsive.isDesktop(context)
              ? Row(
                  children: [
                    sideBar(size, controller, scaffoldKey),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: controller.webScreenList[controller.page],
                    ),
                    SizedBox(
                      width: 20,
                    ),
                  ],
                )
              : controller.webScreenList[controller.page],
        );
      },
    );
  }

  Container sideBar(
    double size,
    BottomNavigationBarController controller,
    GlobalKey<ScaffoldState> drawerKey,
  ) {
    return Container(
      width: 101,
      color: CommonColor.mainColor,
      child: Column(
        children: [
          SizedBox(
            height: 44,
          ),
          CommonText(
            text: HomePageString.crm,
            color: CommonColor.white,
            fontSize: 28,
            fontWeight: FontWeight.w500,
          ),
          SizedBox(
            height: 20,
          ),
          MouseRegion(
            onEnter: (event) {
              controller.updateHover1(true);
            },
            onExit: (event) {
              controller.updateHover1(false);
            },
            child: InkWell(
              onTap: () {
                controller.updateIndex(0);
                drawerKey.currentState?.closeDrawer();
              },
              child: Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 20.18),
                padding: EdgeInsets.fromLTRB(35, 9.73, 36, 9.73),
                width: double.infinity,
                decoration: controller.hover1 == true || controller.page == 0
                    ? BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment(1.178, -0.347),
                          end: Alignment(-1.099, -0.347),
                          colors: <Color>[Color(0x89ffffff), Color(0x00ffffff)],
                          stops: <double>[0, 1],
                        ),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      )
                    : BoxDecoration(),
                child: Center(
                  child: SvgPicture.asset(
                    controller.page == 0
                        ? BottomBarPath.home_web
                        : BottomBarPath.home,
                    height: 22,
                    width: 22,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          MouseRegion(
            onEnter: (event) {
              controller.updateHover2(true);
            },
            onExit: (event) {
              controller.updateHover2(false);
            },
            child: InkWell(
              onTap: () {
                controller.updateIndex(1);
                drawerKey.currentState?.closeDrawer();
              },
              child: Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 20.18),
                padding: EdgeInsets.fromLTRB(35, 9.73, 36, 9.73),
                width: double.infinity,
                decoration: controller.hover2 == true || controller.page == 1
                    ? BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment(1.178, -0.347),
                          end: Alignment(-1.099, -0.347),
                          colors: <Color>[Color(0x89ffffff), Color(0x00ffffff)],
                          stops: <double>[0, 1],
                        ),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      )
                    : BoxDecoration(),
                child: Center(
                  child: SvgPicture.asset(BottomBarPath.taskSquare,
                      height: 22, width: 22, color: Colors.white),
                ),
              ),
            ),
          ),
          MouseRegion(
            onEnter: (event) {
              controller.updateHover3(true);
            },
            onExit: (event) {
              controller.updateHover3(false);
            },
            child: InkWell(
              onTap: () {
                controller.updateIndex(2);
                drawerKey.currentState?.closeDrawer();
              },
              child: Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 20.18),
                padding: EdgeInsets.fromLTRB(35, 9.73, 36, 9.73),
                width: double.infinity,
                decoration: controller.hover3 == true || controller.page == 2
                    ? BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment(1.178, -0.347),
                          end: Alignment(-1.099, -0.347),
                          colors: <Color>[Color(0x89ffffff), Color(0x00ffffff)],
                          stops: <double>[0, 1],
                        ),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      )
                    : BoxDecoration(),
                child: Center(
                  child: SvgPicture.asset(
                    BottomBarPath.web_messages,
                    height: 22,
                    width: 22,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  SideBarWidget(
      {BottomNavigationBarController? controller,
      void Function()? onTap,
      String? image,
      int? selectPage}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.fromLTRB(0, 0, 0, 20.18),
        padding: EdgeInsets.fromLTRB(35, 9.73, 36, 9.73),
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(1.178, -0.347),
            end: Alignment(-1.099, -0.347),
            colors: <Color>[Color(0x89ffffff), Color(0x00ffffff)],
            stops: <double>[0, 1],
          ),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        child: Center(
          child: SvgPicture.asset(image!,
              height: 22, width: 22, color: Colors.white),
        ),
      ),
    );
  }
}
