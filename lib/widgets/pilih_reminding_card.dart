import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/utils.dart';

class PilihRemindingCard extends StatelessWidget {
  final String? reminding;

  const PilihRemindingCard({Key? key, this.reminding}) : super(key: key);

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
                  reminding!,
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
