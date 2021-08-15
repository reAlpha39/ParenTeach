import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parenteach/controllers/siswa_controller.dart';
import 'package:parenteach/models/nilai_raport.dart';
import 'package:parenteach/repositories/database_provider.dart';
import 'package:parenteach/utils/utils.dart';

class NilaiRaportController extends GetxController {
  final DatabaseProvider _databaseProvider = DatabaseProvider();
  TextEditingController? keterampilanController;
  TextEditingController? pengetahuanController;
  RxList<NilaiRaport> nilaiRaports = RxList<NilaiRaport>();
  RxString nis = "".obs;
  RxString mataPelajaran = "".obs;
  RxString semester = "".obs;
  RxString tahunAjar = "".obs;
  RxBool isLoading = false.obs;

  void onInit() {
    keterampilanController = TextEditingController();
    pengetahuanController = TextEditingController();
    super.onInit();
  }

  void onReady() {
    _getInitialNilaiRaport();
    super.onReady();
  }

  void onClose() {
    keterampilanController?.dispose();
    pengetahuanController?.dispose();
    super.onClose();
  }

  NilaiRaport _fillNilaiRaport() {
    NilaiRaport data = NilaiRaport();
    data.idMapel = mataPelajaran.value;
    data.nis = nis.value;
    data.nKeterampilan = int.parse(keterampilanController!.text);
    data.nPengetahuan = int.parse(pengetahuanController!.text);
    data.semester = semester.value;
    data.tahunAjar = tahunAjar.value;
    return data;
  }

  void resetState() {
    keterampilanController!.text = '';
    pengetahuanController!.text = '';
    mataPelajaran.value = '';
    semester.value = '';
    tahunAjar.value = '';
  }

  void _getInitialNilaiRaport() {
    SiswaController siswaController = Get.find();
    getNilaiRaport(
        siswaController.listSiswa[siswaController.indexSiswa.value].nis!);
  }

  void getNilaiRaport(String nis) async {
    isLoading.value = true;
    try {
      bool isConnected = await connectivityChecker();
      if (isConnected) {
        nilaiRaports.value = await _databaseProvider.getNilaiRaport(nis);
        nilaiRaports.refresh();
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

  void saveNilaiRaport({bool isEdit = false}) async {
    bool isSuccess = false;
    try {
      bool isConnected = await connectivityChecker();
      if (isConnected) {
        NilaiRaport data = _fillNilaiRaport();
        isSuccess = await _databaseProvider.addNilaiRaport(data);

        if (isSuccess) {
          // _getSiswaData();
          Get.back();
          _showDialog(
            title: 'Success',
            middleText: isEdit
                ? 'Data nilai berhasil diperbaharui'
                : 'Data nilai berhasil ditambahkan',
          );
          resetState();
        } else {
          _showDialog(
            title: 'Gagal',
            middleText: isEdit
                ? 'Data nilai gagal diperbaharui, mohon coba lagi'
                : 'Data nilai gagal ditambahkan, mohon coba lagi',
          );
        }
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
