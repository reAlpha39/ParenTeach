import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parenteach/repositories/database_provider.dart';
import 'package:parenteach/routes/route_name.dart';

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
    await _databaseProvider.initializeFirebase();
    isLoading.value = false;
    Get.offAndToNamed(
      routeName.reverse[RouteName.HOMEPAGE]!,
    );
  }
}
