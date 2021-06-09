import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parenteach/routes/route_name.dart';
import 'package:parenteach/utils/theme.dart';
import 'package:parenteach/widgets/home_fitur_card.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String dummyText =
        'Parenting adalah cara mengasuh dan mendidik anak. Anda tentu sudah sangat sering mendengar istilah ini kehidupan sehari-hari. Namun, sudah tepatkah pemahaman Anda tentang konsep parenting itu sendiri? Berikut penjelasan singkat tentang pengertian parenting beserta jenis-jenisnya. Read More...';
    return Scaffold(
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
                          'Muhammad M',
                          style: blackTextBold2.copyWith(fontSize: 24),
                        ),
                      ],
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: pinkColor,
                        borderRadius: BorderRadius.circular(10),
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
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.all(5),
                                  primary: Colors.white,
                                  elevation: 0),
                              child: Text(
                                'Explore',
                                style: pinkText.copyWith(fontSize: 12),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Illustrasi (Belum tau responsive apa belum)
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
                  'Apa itu parenting?',
                  style: blackTextBold.copyWith(fontSize: 15),
                ),
                Text(
                  dummyText,
                  style: blackText,
                ),
                Text(
                  'Fitur Kita',
                  style: blackTextBold.copyWith(fontSize: 15),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      HomeFiturCard(
                        route: RouteName.PLAYGROUNDPAGE,
                        imageAsset: 'assets/playground_menu_icon.png',
                        titleCard: 'Playground',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
