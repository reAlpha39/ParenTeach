import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parenteach/controllers/login_controller.dart';
import 'package:parenteach/routes/route_name.dart';
import 'package:parenteach/utils/shared_methods.dart';
import 'package:parenteach/utils/utils.dart';
import 'package:parenteach/widgets/home_fitur_card.dart';

class AdminHomePage extends StatelessWidget {
  final LoginController _loginController = Get.find();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return onWillPop();
      },
      child: Scaffold(
        backgroundColor: greyBackgroundColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: margin, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hello,',
                            style: blackTextBold2.copyWith(fontSize: 12),
                          ),
                          Text(
                            'Admin ',
                            style: blackTextBold2.copyWith(fontSize: 24),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.defaultDialog(
                            radius: 17,
                            title: 'Logout',
                            content: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 4,
                                horizontal: 12,
                              ),
                              child: Center(
                                child: Text(
                                  'Apakah anda ingin logout?',
                                  style: blackText,
                                ),
                              ),
                            ),
                            textConfirm: 'OK',
                            textCancel: 'Batal',
                            buttonColor: pinkColor,
                            cancelTextColor: Colors.black87,
                            confirmTextColor: Colors.white,
                            onConfirm: () => _loginController.userLogout(),
                            onCancel: () => Get.toNamed(
                                routeName.reverse[RouteName.ADMINHOMEPAGE]!),
                          ).then((value) => value = false);
                        },
                        child: Icon(
                          Icons.more_vert,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
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
                        titleCard: 'Presensi',
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
                        route: RouteName.RAPOTPAGE,
                        imageAsset: 'assets/Rapot.png',
                        titleCard: 'Rapot',
                      ),
                      HomeFiturCard(
                        route: RouteName.QNAPAGE,
                        imageAsset: 'assets/qna.png',
                        titleCard: 'QnA',
                      ),
                      HomeFiturCard(
                        route: RouteName.BLOGPAGE,
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
      ),
    );
  }
}
