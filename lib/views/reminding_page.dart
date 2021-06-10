import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parenteach/utils/theme.dart';

class RemindingPage extends StatelessWidget {
  const RemindingPage({Key? key}) : super(key: key);

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
                        Container(
                          height: 152,
                          width: 152,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        Container(
                          height: 152,
                          width: 152,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ],
                    )
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
