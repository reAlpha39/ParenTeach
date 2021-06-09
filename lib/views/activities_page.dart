import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parenteach/utils/theme.dart';

class ActivitiesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 20, horizontal: margin),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              color: pinkColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Text(
                          'Activities',
                          style: pinkTextBold.copyWith(fontSize: 24),
                        ),
                        Icon(
                          Icons.notifications,
                          color: pinkColor,
                          size: 30,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Container(
                      height: 85,
                      width: 85,
                      decoration: BoxDecoration(
                        color: pinkColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      'Merina',
                      style: pinkTextBold.copyWith(fontSize: 24),
                    ),
                    Text(
                      'Wali Dari Dono Suparno',
                      style: pinkText.copyWith(fontSize: 18),
                    ),
                    Text(
                      'Kelas 12A',
                      style: pinkText.copyWith(fontSize: 18),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 300),
                child: Container(
                  height: Get.height,
                  decoration: BoxDecoration(
                    color: pinkColor,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Score Anda',
                          style: whiteText.copyWith(fontSize: 24),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: margin),
                          // Masih belum tau gimana ini ntar bentuknya
                          child: Container(
                            width: Get.width,
                            height: 104,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
