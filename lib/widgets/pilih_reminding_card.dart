import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parenteach/controllers/login_controller.dart';
import 'package:parenteach/controllers/reminding_controller.dart';
import 'package:parenteach/models/reminding.dart';

import '../utils/utils.dart';

class PilihRemindingCard extends StatelessWidget {
  final LoginController loginController = Get.find();
  final RemindingController remindingController = Get.find();
  final Reminding reminding;

  PilihRemindingCard({Key? key, required this.reminding}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 14),
      height: 104,
      width: Get.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset('assets/soup_icon.png'),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Text(
                  reminding.pertanyaan!,
                  style: blackTextBold,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                height: 20,
                child: Image.asset('assets/send_icon_pink.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
