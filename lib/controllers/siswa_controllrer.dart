import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:parenteach/models/siswa.dart';
import 'package:parenteach/repositories/database_provider.dart';
import 'package:parenteach/utils/utils.dart';

class SiswaController extends GetxController {
  final DatabaseProvider _databaseProvider = DatabaseProvider();
  final _picker = ImagePicker();
  TextEditingController? namaController;
  TextEditingController? nipController;
  RxString jenisKelamin = "".obs;
  RxString kelas = "".obs;
  RxBool isPicked = false.obs;
  RxBool isLoading = false.obs;
  Rx<File> image = File("").obs;
  RxString fileName = "".obs;

  final List<String> jenisKelamins = ['Laki-Laki', 'Perempuan'];
  final List<String> kelass = ['7', '8', '9'];

  void onInit() {
    namaController = TextEditingController();
    nipController = TextEditingController();
    super.onInit();
  }

  void onClose() {
    namaController?.dispose();
    nipController?.dispose();
  }

  Future imageFromGallery() async {
    isPicked.value = false;
    var file =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 50);
    if (file != null) {
      image = Rx<File>(File(file.path));
      image.refresh();
      isPicked.value = true;
      fileName.value = file.name;
    } else {
      print('No image selected');
    }
  }

  void saveSiswaData() async {
    bool isSuccess = false;
    try {
      bool isConnected = await connectivityChecker();
      if (isConnected) {
        Siswa data = Siswa();
        data.nama = namaController!.text;
        data.nis = nipController!.text;
        data.jenisKelamin = jenisKelamin.value;
        data.kelas = kelas.value;
        data.idKelas = '';
        String getDownloadUrl = await _databaseProvider.uploadImage(
            image.value, data.nis!, 'siswa');
        if (getDownloadUrl != '') {
          data.fotoSiswa = getDownloadUrl;
          isSuccess = await _databaseProvider.addSiswa(data);
        }
        if (isSuccess) {
          _showDialog(
            title: 'Success',
            middleText: 'Data siswa berhasil ditambahkan',
          );
          resetState();
        } else {
          _showDialog(
            title: 'Gagal',
            middleText: 'Data siswa gagal ditambahkan, mohon coba lagi',
          );
        }
      }
    } catch (e) {
      _showDialog(title: 'Error', middleText: "Error: " + e.toString());
    }
  }

  void resetState() {
    try {
      namaController!.clear();
      nipController!.clear();
      jenisKelamin.value = '';
      kelas.value = '';
      isPicked.value = false;
      if (image.value.existsSync()) {
        image.value.delete();
        image.refresh();
      }
    } catch (e) {
      print(e);
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
