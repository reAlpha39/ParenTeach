import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parenteach/controllers/utils_controller.dart';
import 'package:parenteach/routes/route_name.dart';
import 'package:parenteach/utils/utils.dart';
import 'package:parenteach/views/home_page.dart';
import 'package:parenteach/views/kalender_page.dart';
import 'package:parenteach/views/profil_page.dart';

import '../utils/shared_methods.dart';

class MainPage extends StatelessWidget {
  final UtilsController utilsController = Get.find();
  @override
  final List<Widget> pages = [
    HomePage(),
    KalenderPage(),
    KalenderPage(),
    // RemindingPage(),
    ProfilPage(),
  ];
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return onWillPop();
      },
      child: Obx(
        () => Scaffold(
          body: pages[utilsController.currentIndex.value],
          floatingActionButton: FloatingActionButton(
            elevation: 0,
            child: Container(
              width: 30,
              child: Image.asset('assets/send.png'),
            ),
            onPressed: () {
              Get.toNamed(routeName.reverse[RouteName.CHATPAGE]!);
            },
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: AnimatedBottomNavigationBar(
            iconSize: 30,
            activeColor: Colors.white,
            inactiveColor: Colors.white,
            backgroundColor: pinkColor,
            elevation: 0,
            icons: [
              Icons.home,
              Icons.calendar_today_rounded,
              Icons.notifications,
              Icons.person,
            ],
            activeIndex: utilsController.currentIndex.value,
            gapLocation: GapLocation.center,
            notchSmoothness: NotchSmoothness.sharpEdge,
            onTap: (index) => utilsController.handleOnTap(index),
          ),
        ),
      ),
    );
  }
}
