import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
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
}
