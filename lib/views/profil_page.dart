import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/login_controller.dart';
import '../utils/theme.dart';
import '../widgets/custom_appbar.dart';

class ProfilPage extends StatelessWidget {
  final LoginController loginController = Get.find();
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
              child: Container(
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    buldDataUser(
                        'Nama Lengkap', loginController.user.value.username),
                    buldDataUser('No. Hp', loginController.user.value.noHp),
                    buldDataUser('Email', loginController.user.value.email),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Column buldDataUser(String? label, String? data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 20,
        ),
        Text(
          label!,
          style: blackText.copyWith(fontSize: 12, color: Colors.grey),
        ),
        Divider(),
        Text(
          data!,
          style: blackText,
        ),
      ],
    );
  }
}
