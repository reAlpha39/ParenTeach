import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/login_controller.dart';

import '../routes/route_name.dart';
import '../utils/shared_methods.dart';
import '../utils/theme.dart';
import '../widgets/home_fitur_card.dart';

class HomePage extends StatelessWidget {
  final LoginController loginController = Get.find();
  @override
  Widget build(BuildContext context) {
    String dummyText =
        'Parenting adalah cara mengasuh dan mendidik anak. Anda tentu sudah sangat sering mendengar istilah ini kehidupan sehari-hari. Namun, sudah tepatkah pemahaman Anda tentang konsep parenting itu sendiri? Berikut penjelasan singkat tentang pengertian parenting beserta jenis-jenisnya.';
    return WillPopScope(
      onWillPop: () {
        return onWillPop();
      },
      child: Scaffold(
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
                          Obx(
                            () => loginController.isLoading.value
                                ? Text('')
                                : Text(
                                    loginController.user.value.nama!,
                                    style:
                                        blackTextBold2.copyWith(fontSize: 24),
                                  ),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () => Get.toNamed(
                            routeName.reverse[RouteName.PROFILPAGE]!),
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: NetworkImage(
                                    'https://pict-b.sindonews.net/dyn/620/pena/news/2021/01/16/158/303838/begini-poster-teaser-drama-sejarah-jisoo-blackpink-zry.jpg'),
                                fit: BoxFit.cover),
                          ),
                        ),
                      ),
                      // ),
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
                        decoration: BoxDecoration(
                          color: pinkColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Selamat Datang di \nParenTeach',
                                style: whiteTextBold.copyWith(fontSize: 18),
                              ),
                              ElevatedButton(
                                onPressed: () {
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
                                    onConfirm: () =>
                                        loginController.userLogout(),
                                    onCancel: () => Get.toNamed(
                                        routeName.reverse[RouteName.HOMEPAGE]!),
                                  ).then((value) => value = false);
                                },
                                style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.all(5),
                                    primary: Colors.white,
                                    elevation: 0),
                                child: Text(
                                  'Logout',
                                  style: pinkText.copyWith(fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 30,
                        right: 10,
                        child: Container(
                          height: 170,
                          width: 170,
                          child: Image.asset('assets/reading.png'),
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
                        route: RouteName.REMINDINGPAGE,
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
                        titleCard: 'Siswa',
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
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Apa itu parenting?',
                    style: blackTextBold.copyWith(fontSize: 15),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(dummyText, style: blackText),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
