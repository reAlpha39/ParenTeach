import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/user_type.dart';
import '../models/users.dart';

import '../repositories/database_provider.dart';
import '../routes/route_name.dart';
import '../utils/utils.dart';

class LoginController extends GetxController {
  final DatabaseProvider _databaseProvider = DatabaseProvider();
  TextEditingController? passSekolah;
  TextEditingController? username;
  TextEditingController? password;

  Rx<Users> user = Users().obs;
  RxBool isLoading = false.obs;
  RxBool isValidate = false.obs;

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

  void userLogin() async {
    isLoading.value = true;
    try {
      bool isConnected = await connectivityChecker();
      if (isConnected) {
        await _databaseProvider.initializeFirebase();
        Users? value = await _databaseProvider.validateUser(username!.text);
        if (value != null) {
          user.value = value;
          _validateUserPass();
          isLoading.value = false;
          if (isValidate.value) {
            switch (user.value.type) {
              case UserType.ADMIN:
                Get.toNamed(
                  routeName.reverse[RouteName.ADMINHOMEPAGE]!,
                );
                break;
              case UserType.ORANGTUA:
                Get.toNamed(
                  routeName.reverse[RouteName.MAINPAGE]!,
                );
                break;
              default:
            }
          } else {
            _showDialog(
              title: 'Login Gagal',
              middleText: 'Username atau password salah!',
            );
          }
        } else {
          isLoading.value = false;
          _showDialog(
            title: 'Login Gagal',
            middleText: 'Username tidak ditemukan!',
          );
        }
      }
    } catch (e) {
      isLoading.value = false;
      _showDialog(title: 'Error', middleText: "Error: " + e.toString());
    }
  }

  void _validateUserPass() {
    if (username!.text == user.value.username &&
        password!.text == user.value.password) {
      isValidate.value = true;
    } else {
      isValidate.value = false;
    }
  }

  void userLogout() {
    user.value = Users();
    Get.offAndToNamed(routeName.reverse[RouteName.LOGINPAGE]!);
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

  handleThreeDots(int item) {
    switch (item) {
      case 0:
        Get.defaultDialog(
          radius: 17,
          title: 'Logout',
          content: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 4,
              horizontal: 12,
            ),
            child: Center(
              child: Text(
                'Apakah anda ingin logout?',
                style: blackText,
              ),
            ),
          ),
          textConfirm: 'OK',
          textCancel: 'Batal',
          buttonColor: pinkColor,
          cancelTextColor: Colors.black87,
          confirmTextColor: Colors.white,
          onConfirm: () => userLogout(),
          onCancel: () =>
              Get.toNamed(routeName.reverse[RouteName.ADMINHOMEPAGE]!),
        ).then((value) => value = false);
        break;
      case 1:
        break;
    }
  }
}
