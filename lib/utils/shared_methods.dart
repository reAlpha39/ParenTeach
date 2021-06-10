import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'utils.dart';

// Method for handling back button
Future<bool> onWillPop() {
  return Get.defaultDialog(
    radius: 17,
    title: 'Exit',
    content: Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 4,
        horizontal: 12,
      ),
      child: Center(
        child: Text(
          'Apakah anda ingin keluar dari aplikasi?',
          style: blackText,
        ),
      ),
    ),
    textConfirm: 'OK',
    textCancel: 'Batal',
    buttonColor: pinkColor,
    cancelTextColor: Colors.black87,
    confirmTextColor: Colors.white,
    onConfirm: () => exit(0),
    onCancel: () => Get.back(),
  ).then((value) => value = false);
}
