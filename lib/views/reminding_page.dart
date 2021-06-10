import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parenteach/utils/theme.dart';
import 'package:parenteach/widgets/favorite_reminding_card.dart';
import 'package:parenteach/widgets/reminding_page_textfield.dart';

class RemindingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: 205,
              width: Get.width,
              decoration: BoxDecoration(color: pinkColor),
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                      height: 10,
                    ),
                    RemindingPageTextField()
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
