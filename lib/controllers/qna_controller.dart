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

  void addQna({String? idQna}) async {
    try {
      bool isConnected = await connectivityChecker();
      if (isConnected) {
        Qna data = Qna();
        data.pertanyaan = qnaQuestion!.text;
        data.jawaban = qnaAnswer!.text;
        if (idQna != null) {
          data.idQna = idQna;
          isUpdate.value = true;
        } else {
          isUpdate.value = false;
        }
        bool isSuccess = isUpdate.value
            ? await _databaseProvider.updateQna(data)
            : await _databaseProvider.addQna(data);
        if (isSuccess) {
          _getQnaData();
          _showDialog(
            title: 'Success',
            middleText: isUpdate.value
                ? 'QnA berhasil diperbaharui'
                : 'QnA berhasil ditambahkan',
          );
          clearText();
        } else {
          _showDialog(
            title: 'Gagal',
            middleText: isUpdate.value
                ? 'QnA gagal diperbaharui, mohon coba lagi'
                : 'QnA gagal ditambahkan, mohon coba lagi',
          );
        }
      }
    } catch (e) {
      _showDialog(title: 'Error', middleText: "Error: " + e.toString());
    }
  }

  void clearText() {
    isUpdate.value = false;
    qnaQuestion!.clear();
    qnaAnswer!.clear();
  }

  void loadText(String question, String answer) {
    isUpdate.value = true;
    qnaQuestion!.text = question;
    qnaAnswer!.text = answer;
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
