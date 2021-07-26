import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:get/get.dart';

Future<bool> connectivityChecker() async {
  final bool hasConnection =
      await InternetConnectionChecker().hasConnection.then((value) {
    if (!value) {
      if (Get.isDialogOpen!) {
        Get.back(closeOverlays: true);
      }
      Get.defaultDialog(
          title: 'Koneksi Error',
          middleText: 'Periksa kembali koneksi internet anda',
          textConfirm: 'OK',
          confirmTextColor: Colors.black87,
          onConfirm: () => Get.back());
    }
    return value;
  });
  return hasConnection;
}
