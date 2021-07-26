import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icon.dart';
import 'package:parenteach/widgets/custom_appbar.dart';

import '../../utils/utils.dart';
import '../../widgets/favorite_reminding_card.dart';
import '../../widgets/pilih_reminding_card.dart';
import '../../widgets/reminding_page_textfield.dart';

class AdminRemindingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: 250,
              width: Get.width,
              decoration: BoxDecoration(color: pinkColor),
              child: Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Image.asset(
                  'assets/reminding_illustration.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () => Get.back(),
                              child: Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Icon(
                                  Icons.arrow_back,
                                  color: pinkColor,
                                  size: 20,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Reminding',
                              style: whiteTextBold,
                            )
                          ],
                        ),
                        Row(
                          children: [
                            LineIcon.plus(
                              color: Colors.white,
                            ),
                            Icon(
                              Icons.more_vert,
                              color: Colors.white,
                            )
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      'Reminding Favorite',
                      style: whiteText.copyWith(fontSize: 18),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FavoriteRemindingCard(),
                        FavoriteRemindingCard(),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    RemindingPageTextField(),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Pilih Remindingmu',
                      style: blackText,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    PilihRemindingCard(),
                    PilihRemindingCard(),
                    PilihRemindingCard(),
                    PilihRemindingCard(),
                    PilihRemindingCard(),
                    PilihRemindingCard(),
                    PilihRemindingCard(),
                    PilihRemindingCard(),
                    PilihRemindingCard(),
                    PilihRemindingCard(),
                    PilihRemindingCard(),
                    PilihRemindingCard(),
                    PilihRemindingCard(),
                    PilihRemindingCard(),
                    PilihRemindingCard(),
                    PilihRemindingCard(),
                    PilihRemindingCard(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
