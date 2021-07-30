import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parenteach/repositories/database_provider.dart';
import 'package:parenteach/utils/utils.dart';

class NilaiHarianController extends GetxController {
  final DatabaseProvider _databaseProvider = DatabaseProvider();
  TextEditingController? namaKegiatanHarianController;
  TextEditingController? nilaiKegiatanController;
  RxString mataPelajaran = "".obs;
  RxBool isPicked = false.obs;
  RxBool isLoading = false.obs;
  RxBool isUpdate = false.obs;

  final List<String> listJenisKelamin = ['Bahasa Indonesia', 'Bahasa Jawa'];

  void onInit() {
    namaKegiatanHarianController = TextEditingController();
    nilaiKegiatanController = TextEditingController();
    super.onInit();
  }

  void onReady() {
    super.onReady();
  }

  void onClose() {
    namaKegiatanHarianController?.dispose();
    nilaiKegiatanController?.dispose();
  }

  void _getNilaiHarian() async {
    isLoading.value = true;
    try {
      bool isConnected = await connectivityChecker();
      if (isConnected) {
        isLoading.value = false;
      } else {
        _showDialog(
          title: 'Gagal',
          middleText: 'Tidak bisa terhubung ke internet',
        );
      }
    } catch (e) {
      _showDialog(title: 'Error', middleText: "Error: " + e.toString());
    }
  }

  void addQna({String? idNilaiHarian}) async {
    try {
      bool isConnected = await connectivityChecker();
      if (isConnected) {
        // Qna data = Qna();
        // data.pertanyaan = qnaQuestion!.text;
        // data.jawaban = qnaAnswer!.text;
        if (idNilaiHarian != null) {
          // data.idQna = idQna;
          // isUpdate.value = true;
        } else {
          // isUpdate.value = false;
        }
        // bool isSuccess = isUpdate.value
        //     ? await _databaseProvider.updateQna(data)
        //     : await _databaseProvider.addQna(data);
        // if (isSuccess) {
        //   _getQnaData();
        //   _showDialog(
        //     title: 'Success',
        //     middleText: isUpdate.value
        //         ? 'QnA berhasil diperbaharui'
        //         : 'QnA berhasil ditambahkan',
        //   );
        //   clearText();
        // } else {
        //   _showDialog(
        //     title: 'Gagal',
        //     middleText: isUpdate.value
        //         ? 'QnA gagal diperbaharui, mohon coba lagi'
        //         : 'QnA gagal ditambahkan, mohon coba lagi',
        //   );
        // }
      }
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
