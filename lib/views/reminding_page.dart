import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parenteach/controllers/login_controller.dart';
import 'package:parenteach/controllers/reminding_controller.dart';
import 'package:parenteach/widgets/pilih_reminding_card.dart';

import '../utils/utils.dart';

class RemindingPage extends StatelessWidget {
  final LoginController loginController = Get.find();
  final RemindingController remindingController = Get.find();
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
                  padding: EdgeInsets.all(30),
                  decoration: BoxDecoration(color: pinkColor),
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/Reminding_bg.png',
                        ),
                      ),
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
                    height: 230,
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
                          loginController.user.value.nama!,
                          style: blackTextBold.copyWith(
                              fontSize: 18, color: pinkColor),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Obx(
                        () => remindingController.isLoading.value
                            ? Center(
                                child: CircularProgressIndicator(),
                              )
                            : Column(
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
                                  SingleChildScrollView(
                                    child: Column(
                                      children:
                                          remindingController.listReminding
                                              .map(
                                                (element) => PilihRemindingCard(
                                                    reminding: element),
                                              )
                                              .toList(),
                                    ),
                                  )
                                ],
                              ),
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
