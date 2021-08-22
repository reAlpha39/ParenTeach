import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/reminding_controller.dart';

import '../utils/utils.dart';

class PilihRemindingCard extends StatelessWidget {
  final RemindingController remindingController = Get.find();
  final String? idReminding;
  final String? pertanyaan;

  PilihRemindingCard({Key? key, this.idReminding, this.pertanyaan})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 14),
      height: 170,
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
                  pertanyaan!,
                  style: blackTextBold.copyWith(fontSize: 11),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      // print('object');
                      remindingController.deleteReminding(idReminding!);
                    },
                    child: Icon(
                      Icons.delete,
                      color: pinkColor,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 20,
                    child: Image.asset('assets/send_icon_pink.png'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
