import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/login_controller.dart';
import '../../routes/route_name.dart';
import '../../utils/shared_methods.dart';
import '../../utils/utils.dart';
import '../../widgets/home_fitur_card.dart';

class AdminHomePage extends StatelessWidget {
  final LoginController loginController = Get.find();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return onWillPop();
      },
      child: Scaffold(
        appBar: AppBar(
          leading: Container(),
          elevation: 0,
          backgroundColor: greyBackgroundColor,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Text(
                'Hello,',
                style: blackTextBold2.copyWith(fontSize: 13),
              ),
              Obx(
                () => loginController.isLoading.value
                    ? Text('')
                    : Text(
                        loginController.user.value.nama!,
                        style: blackTextBold2.copyWith(fontSize: 24),
                      ),
              ),
            ],
          ),
          actions: [
            PopupMenuButton<int>(
              icon: Icon(
                Icons.more_vert,
                color: blackColor,
              ),
              onSelected: (item) => loginController.handleThreeDots(item),
              itemBuilder: (context) => [
                PopupMenuItem<int>(
                  value: 0,
                  child: Text(
                    'Logout',
                    style: blackText,
                  ),
                ),
              ],
            ),
          ],
        ),
        backgroundColor: greyBackgroundColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: margin, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 164,
                        width: Get.width,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Selamat Datang di \nParenTeach',
                            style: blackText.copyWith(fontSize: 18),
                          ),
                        ),
                      ),
                      // Illustrasi (Belum tau responsive apa belum)
                      Positioned(
                        top: 30,
                        right: 10,
                        child: Container(
                          height: 130,
                          width: 130,
                          child: Image.asset('assets/Slack.png'),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Fitur Kita',
                    style: blackTextBold.copyWith(fontSize: 15),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      HomeFiturCard(
                        route: RouteName.ADMINREMINDINGPAGE,
                        imageAsset: 'assets/Alarm.png',
                        titleCard: 'Reminding',
                      ),
                      HomeFiturCard(
                        route: RouteName.ACTIVITIESPAGE,
                        imageAsset: 'assets/Presensi.png',
                        titleCard: 'The Best Parent',
                      ),
                      HomeFiturCard(
                        route: RouteName.PLAYGROUNDPAGE,
                        imageAsset: 'assets/playground.png',
                        titleCard: 'Playground',
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      HomeFiturCard(
                        route: RouteName.DAFTARKELAS,
                        imageAsset: 'assets/Rapot.png',
                        titleCard: 'Kelas',
                      ),
                      HomeFiturCard(
                        route: RouteName.QNAPAGE,
                        imageAsset: 'assets/qna.png',
                        titleCard: 'QnA',
                      ),
                      HomeFiturCard(
                        route: RouteName.WEBVIEW,
                        imageAsset: 'assets/Blog.png',
                        titleCard: 'Blog',
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      HomeFiturCard(
                        route: RouteName.DAFTARSISWAPAGE,
                        imageAsset: 'assets/Siswa.png',
                        titleCard: 'Siswa',
                      ),
                      HomeFiturCard(
                        route: RouteName.DAFTARGURUPAGE,
                        imageAsset: 'assets/Guru.png',
                        titleCard: 'Guru',
                      ),
                      HomeFiturCard(
                        route: RouteName.KALENDERPAGE,
                        imageAsset: 'assets/Tahun.png',
                        titleCard: 'Tahun',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          elevation: 0,
          child: Container(
            width: 30,
            child: Image.asset('assets/send.png'),
          ),
          onPressed: () {},
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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
          activeIndex: 1,
          gapLocation: GapLocation.center,
          notchSmoothness: NotchSmoothness.sharpEdge,
          onTap: (index) => () {},
        ),
      ),
    );
  }
}
