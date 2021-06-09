import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parenteach/utils/utils.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class ActivityScoreBox extends StatelessWidget {
  final String? pertanyaan;
  final double? percent;

  const ActivityScoreBox({Key? key, this.pertanyaan, this.percent})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: 120,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(margin, margin, margin, 0),
            child: Text(
              pertanyaan!,
              style: blackTextBold,
              maxLines: 2,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: LinearPercentIndicator(
              lineHeight: 7.0,
              percent: percent!,
              linearStrokeCap: LinearStrokeCap.butt,
              progressColor: pinkColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              '${percent! * 100} %',
              style: blackTextBold.copyWith(color: pinkColor),
            ),
          ),
        ],
      ),
    );
  }
}
