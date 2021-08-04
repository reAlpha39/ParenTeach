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
  TextEditingController? emailController;
  TextEditingController? noHpController;
  RxString jenisKelamin = "".obs;
  RxString status = "".obs;
  RxString waliKelas = "".obs;
  RxBool isPicked = false.obs;
  RxBool isLoading = false.obs;
  Rx<File> image = File("").obs;
  RxString imageUrl = "".obs;
  RxString fileName = "".obs;
  RxList<Guru> listGuru = RxList<Guru>();

  void onInit() {
    searchGuruTEC = TextEditingController();
    namaController = TextEditingController();
    nipController = TextEditingController();
    usernameController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    emailController = TextEditingController();
    noHpController = TextEditingController();
    super.onInit();
  }

  void onReady() {
    _getGuruData();
    super.onReady();
  }

  void onClose() {
    searchGuruTEC?.dispose();
    namaController?.dispose();
    nipController?.dispose();
    usernameController?.dispose();
    passwordController?.dispose();
    confirmPasswordController?.dispose();
    emailController?.dispose();
    noHpController?.dispose();
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

  void _getGuruData() async {
    isLoading.value = true;
    try {
      bool isConnected = await connectivityChecker();
      if (isConnected) {
        listGuru.value = await _databaseProvider.getGuruList();
        listGuru.refresh();
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

  void loadGuruState(int index) {
    resetState();
    namaController!.text = listGuru[index].nama!;
    nipController!.text = listGuru[index].nip!;
    usernameController!.text = listGuru[index].username!;
    passwordController!.text = listGuru[index].password!;
    confirmPasswordController!.text = listGuru[index].password!;
    emailController!.text = listGuru[index].email!;
    noHpController!.text = listGuru[index].noHp!;
    jenisKelamin.value = listGuru[index].jenisKelamin!;
    waliKelas.value = listGuru[index].waliKelas!;
    status.value = statusTypeValues.reverse[listGuru[index].status!]!;
    imageUrl.value = listGuru[index].foto!;
  }

  void resetState() {
    try {
      namaController!.clear();
      nipController!.clear();
      nipController!.clear();
      usernameController!.clear();
      passwordController!.clear();
      confirmPasswordController!.clear();
      emailController!.clear();
      noHpController!.clear();
      jenisKelamin.value = '';
      waliKelas.value = '';
      imageUrl.value = '';
      status.value = '';
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

  Guru _fillGuruData() {
    Guru data = Guru();
    data.nama = namaController!.text;
    data.nip = nipController!.text;
    data.jenisKelamin = jenisKelamin.value;
    data.waliKelas = waliKelas.value;
    data.status = statusTypeValues.map![status.value];
    data.username = usernameController!.text;
    data.password = passwordController!.text;
    data.email = emailController!.text;
    data.noHp = noHpController!.text;
    return data;
  }

  Users _fillUserData(Guru data) {
    Users user = Users();
    user.nama = data.nama;
    user.email = data.email;
    user.noHp = data.noHp;
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
