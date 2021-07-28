import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class SiswaController extends GetxController {
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

  void resetState() {
    try {
      namaController!.clear();
      nipController!.clear();
      isPicked.value = false;
      if (image.value.existsSync()) {
        image.value.delete();
        image.refresh();
      }
    } catch (e) {
      print(e);
    }
  }
}
