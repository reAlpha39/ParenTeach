import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class GuruController extends GetxController {
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
}
