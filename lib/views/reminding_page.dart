import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/utils.dart';
import '../widgets/pilih_reminding_card.dart';

class RemindingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Stack(
              children: [
                Container(
                  height: 250,
                  width: Get.width,
                  decoration: BoxDecoration(color: pinkColor),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Image.asset(
                      'assets/Reminding_bg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(30),
                  child: InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        Icons.arrow_back,
                        color: pinkColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 170,
                  ),
                  Text(
                    'Reminding',
                    style: whiteTextBold.copyWith(fontSize: 24),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 70,
                    width: Get.width,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Apakah sudah melakukannya?',
                          style: blackText.copyWith(
                              fontSize: 14, color: Colors.grey),
                        ),
                        Text(
                          'Miftah',
                          style: blackTextBold.copyWith(
                              fontSize: 18, color: pinkColor),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            'Lakukan Reminding Berikut',
                            style: blackTextBold,
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
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
