import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:parenteach/models/guru.dart';
import 'package:parenteach/models/status.dart';
import 'package:parenteach/models/user_type.dart';
import 'package:parenteach/models/users.dart';
import 'package:parenteach/repositories/database_provider.dart';
import 'package:parenteach/utils/utils.dart';

class GuruController extends GetxController {
  final DatabaseProvider _databaseProvider = DatabaseProvider();
  final _picker = ImagePicker();
  TextEditingController? searchGuruTEC;
  TextEditingController? namaController;
  TextEditingController? nipController;
  TextEditingController? usernameController;
  TextEditingController? passwordController;
  TextEditingController? confirmPasswordController;
  RxString jenisKelamin = "".obs;
  RxString status = "".obs;
  RxString waliKelas = "".obs;
  RxBool isPicked = false.obs;
  RxBool isLoading = false.obs;
  Rx<File> image = File("").obs;
  RxString imageUrl = "".obs;
  RxString fileName = "".obs;

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

  void saveGuruData({bool isEdit = false}) async {
    bool isSuccess = false;
    try {
      bool isConnected = await connectivityChecker();
      if (isConnected) {
        Guru data = _fillGuruData();
        String getDownloadUrl = '';
        Users user = _fillUserData(data);
        String getIdUser = await _databaseProvider.addUser(user);
        if (getIdUser != '') {
          data.idUsers = getIdUser;
          data.idUser = getIdUser;
          if (fileName.value != '') {
            getDownloadUrl = await _databaseProvider.uploadImage(
                image.value, data.nip!, 'guru');
          } else {
            getDownloadUrl = data.foto!;
          }
          if (getDownloadUrl != '') {
            data.foto = getDownloadUrl;
            isSuccess = await _databaseProvider.addGuru(data);
          }
        } else {
          isSuccess = false;
        }
        if (isSuccess) {
          _showDialog(
            title: 'Success',
            middleText: isEdit
                ? 'Data guru berhasil diperbaharui'
                : 'Data guru berhasil ditambahkan',
          );
        } else {
          _showDialog(
            title: 'Gagal',
            middleText: isEdit
                ? 'Data guru gagal diperbaharui, mohon coba lagi'
                : 'Data guru gagal ditambahkan, mohon coba lagi',
          );
        }
      }
    } catch (e) {
      _showDialog(title: 'Error', middleText: "Error: " + e.toString());
    }
  }

  Guru _fillGuruData() {
    Guru data = Guru();
    data.nama = namaController!.text;
    data.nip = nipController!.text;
    data.jenisKelamin = jenisKelamin.value;
    data.waliKelas = waliKelas.value;
    data.status = statusTypeValues.map![status.value];
    data.username = usernameController!.text;
    data.password = passwordController!.text;
    return data;
  }

  Users _fillUserData(Guru data) {
    Users user = Users();
    user.nama = data.nama;
    user.email = '';
    user.noHp = '';
    user.password = data.password;
    user.type = userTypeValues.map![userTypeValues.reverse[UserType.GURU]];
    user.username = data.username;
    return user;
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
