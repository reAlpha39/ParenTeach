import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../routes/route_name.dart';
import '../utils/shared_methods.dart';
import '../utils/theme.dart';
import '../widgets/home_fitur_card.dart';

class HomePage extends StatelessWidget {
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
                  SizedBox(
                    height: 15,
                  ),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(text: dummyText, style: blackText),
                        TextSpan(
                          text: ' Read More...',
                          style: blackTextBold,
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Get.toNamed(
                                  routeName.reverse[RouteName.BLOGPAGE]!);
                            },
                        ),
                      ],
                    ),
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
                        imageAsset: 'assets/reminding_menu_icon.png',
                        titleCard: 'Reminding',
                      ),
                      HomeFiturCard(
                        route: RouteName.ACTIVITIESPAGE,
                        imageAsset: 'assets/activities_menu_icon.png',
                        titleCard: 'Activities',
                      ),
                      HomeFiturCard(
                        route: RouteName.PLAYGROUNDPAGE,
                        imageAsset: 'assets/playground_menu_icon.png',
                        titleCard: 'Playground',
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      HomeFiturCard(
                        route: RouteName.RAPOTPAGE,
                        imageAsset: 'assets/rapot_menu_icon.png',
                        titleCard: 'Rapot',
                      ),
                      HomeFiturCard(
                        route: RouteName.QNAPAGE,
                        imageAsset: 'assets/qna_menu_icon.png',
                        titleCard: 'QnA',
                      ),
                      HomeFiturCard(
                        route: RouteName.BLOGPAGE,
                        imageAsset: 'assets/blog_menu_icon.png',
                        titleCard: 'Blog',
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
