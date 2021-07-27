import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parenteach/models/qna.dart';
import 'package:parenteach/repositories/database_provider.dart';
import 'package:parenteach/utils/connectivity_checker.dart';
import 'package:parenteach/utils/utils.dart';

class QnaController extends GetxController {
  final DatabaseProvider _databaseProvider = DatabaseProvider();
  TextEditingController? qnaQuestion;
  TextEditingController? qnaAnswer;
  Rx<Qna> qna = Qna().obs;
  RxBool isUpdate = false.obs;
  RxBool isLoading = true.obs;
  RxList<Qna> listQna = RxList<Qna>();

  void onInit() {
    qnaQuestion = TextEditingController();
    qnaAnswer = TextEditingController();
    super.onInit();
  }

  void onReady() {
    _getQnaData();
    super.onReady();
  }

  void onClose() {
    qnaQuestion?.dispose();
    qnaAnswer?.dispose();
    super.onClose();
  }

  void _getQnaData() async {
    isLoading.value = true;
    try {
      bool isConnected = await connectivityChecker();
      if (isConnected) {
        listQna.value = await _databaseProvider.getListQna();
        listQna.refresh();
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

  void addQna() async {
    try {
      bool isConnected = await connectivityChecker();
      if (isConnected) {
        Qna data = Qna();
        data.pertanyaan = qnaQuestion!.text;
        data.jawaban = qnaAnswer!.text;
        bool isSuccess = await _databaseProvider.addQna(data);
        if (isSuccess) {
          _showDialog(
            title: 'Success',
            middleText: 'QnA berhasil ditambahkan',
          );
          clearText();
        } else {
          _showDialog(
            title: 'Gagal',
            middleText: 'QnA gagal ditambahkan, mohon coba lagi',
          );
        }
      }
    } catch (e) {
      _showDialog(title: 'Error', middleText: "Error: " + e.toString());
    }
  }

  void clearText() {
    qnaQuestion!.clear();
    qnaAnswer!.clear();
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
