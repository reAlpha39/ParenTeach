import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/utils.dart';
import '../../widgets/favorite_reminding_card.dart';
import '../../widgets/pilih_reminding_card.dart';
import '../../widgets/reminding_page_textfield.dart';

class RemindingPage extends StatelessWidget {
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
                      height: 24,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Reminding Page',
                        style: whiteTextBold.copyWith(fontSize: 24),
                      ),
                    ),
                    SizedBox(
                      height: 70,
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
