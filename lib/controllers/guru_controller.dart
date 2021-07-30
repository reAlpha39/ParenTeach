import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GuruController extends GetxController {
  TextEditingController? searchGuruTEC;
  TextEditingController? namaController;
  TextEditingController? nipController;
  TextEditingController? usernameController;
  TextEditingController? passwordController;
  TextEditingController? confirmPasswordController;
  RxString jenisKelamin = "".obs;
  RxString status = "".obs;
  RxString waliKelas = "".obs;

  void onInit() {
    searchGuruTEC = TextEditingController();
    namaController = TextEditingController();
    nipController = TextEditingController();
    usernameController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    super.onInit();
  }

  void onClose() {
    searchGuruTEC?.dispose();
    namaController?.dispose();
    nipController?.dispose();
    usernameController?.dispose();
    passwordController?.dispose();
    confirmPasswordController?.dispose();
    super.onClose();
  }
}
