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
  RxString imageUrl = "".obs;
  RxString fileName = "".obs;
  RxList<Siswa> listSiswa = RxList<Siswa>();

  void onInit() {
    namaController = TextEditingController();
    nipController = TextEditingController();
    super.onInit();
  }

  void onReady() {
    _getSiswaData();
    super.onReady();
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

  void _getSiswaData() async {
    isLoading.value = true;
    try {
      bool isConnected = await connectivityChecker();
      if (isConnected) {
        listSiswa.value = await _databaseProvider.getSiswaList();
        listSiswa.refresh();
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

  void saveSiswaData({bool isEdit = false}) async {
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
        String getDownloadUrl = '';
        if (fileName.value != '') {
          getDownloadUrl = await _databaseProvider.uploadImage(
              image.value, data.nis!, 'siswa');
        } else {
          getDownloadUrl = data.fotoSiswa!;
        }
        if (getDownloadUrl != '') {
          data.fotoSiswa = getDownloadUrl;
          isSuccess = await _databaseProvider.addSiswa(data);
        }
        if (isSuccess) {
          _getSiswaData();
          _showDialog(
            title: 'Success',
            middleText: isEdit
                ? 'Data siswa berhasil diperbaharui'
                : 'Data siswa berhasil ditambahkan',
          );
          resetState();
        } else {
          _showDialog(
            title: 'Gagal',
            middleText: isEdit
                ? 'Data siswa gagal diperbaharui, mohon coba lagi'
                : 'Data siswa gagal ditambahkan, mohon coba lagi',
          );
        }
      }
    } catch (e) {
      _showDialog(title: 'Error', middleText: "Error: " + e.toString());
    }
  }

  void deleteSiswa(int index) async {
    isLoading.value = true;
    try {
      bool isConnected = await connectivityChecker();
      if (isConnected) {
        bool isSuccess = await _databaseProvider.deleteSiswa(
            listSiswa[index].nis!, listSiswa[index].fotoSiswa!);
        if (isSuccess) {
          if (isSuccess) {
            _showDialog(
              title: 'Sukses',
              middleText: 'Data Berhasil terhapus',
            );
            _getSiswaData();
          } else {
            _showDialog(
              title: 'Gagal',
              middleText:
                  'Tidak bisa menghapus data data siswa, coba beberapa saat lagi',
            );
          }
        }
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

  void loadSiswaState(int index) {
    resetState();
    namaController!.text = listSiswa[index].nama!;
    nipController!.text = listSiswa[index].nis!;
    jenisKelamin.value = listSiswa[index].jenisKelamin!;
    kelas.value = listSiswa[index].kelas!;
    imageUrl.value = listSiswa[index].fotoSiswa!;
  }

  void resetState() {
    try {
      namaController!.clear();
      nipController!.clear();
      jenisKelamin.value = '';
      kelas.value = '';
      imageUrl.value = '';
      fileName.value = '';
      image.value = File("");
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
