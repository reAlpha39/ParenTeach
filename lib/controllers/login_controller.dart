import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parenteach/repositories/database_provider.dart';
import 'package:parenteach/routes/route_name.dart';
import 'package:parenteach/utils/utils.dart';

class LoginController extends GetxController {
  final DatabaseProvider _databaseProvider = DatabaseProvider();
  TextEditingController? passSekolah;
  TextEditingController? username;
  TextEditingController? password;

  RxBool isLoading = false.obs;

  @override
  void onInit() {
    passSekolah = TextEditingController();
    username = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    passSekolah?.dispose();
    username?.dispose();
    password?.dispose();
    super.onClose();
  }

  void initializeFirestore() async {
    isLoading.value = true;
    try {
      await _databaseProvider.initializeFirebase();
      isLoading.value = false;
      Get.offAndToNamed(
        routeName.reverse[RouteName.HOMEPAGE]!,
      );
    } catch (e) {
      _showDialog(title: 'Error', middleText: "Error: " + e.toString());
    }
  }

  _showDialog({required String title, required String middleText}) {
    Get.defaultDialog(
      barrierDismissible: false,
      titleStyle: blackText.copyWith(fontSize: 24),
      middleTextStyle: blackText.copyWith(fontSize: 18),
      title: title,
      middleText: middleText,
      textConfirm: 'OK',
      radius: 17,
      buttonColor: pinkColor,
      confirmTextColor: Colors.white,
      onConfirm: () {
        Navigator.of(Get.overlayContext!).pop();
      },
    );
  }
}
