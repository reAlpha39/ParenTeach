import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parenteach/utils/theme.dart';
import 'package:parenteach/widgets/custom_appbar.dart';

class ProfilPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        backgroundColor: pinkColor,
        foregroundColor: greyBackgroundColor,
        enableLeading: true,
        title: 'Profil User',
      ),
      body: Stack(
        children: [
          Container(
            color: pinkColor,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Get.height - 300,
              decoration: BoxDecoration(
                color: greyBackgroundColor,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(10),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
