import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parenteach/models/kelas.dart';
import 'package:parenteach/repositories/database_provider.dart';
import 'package:parenteach/routes/route_name.dart';
import 'package:parenteach/utils/connectivity_checker.dart';
import 'package:parenteach/utils/shared_methods.dart';

class KelasController extends GetxController {
  final DatabaseProvider _databaseProvider = DatabaseProvider();
  RxString tingkatKelas = "--Pilih Kelas--".obs;
  TextEditingController? ruanganTextField;
  Rx<Kelas> kelas = Kelas().obs;
  RxBool isUpdate = false.obs;
  RxBool isLoading = true.obs;
  RxList<Kelas> listKelas = RxList<Kelas>();

  void onInit() {
    ruanganTextField = TextEditingController();
    super.onInit();
  }

  void onReady() {
    getKelasData();
    super.onReady();
  }

  void onClose() {
    ruanganTextField?.dispose();
    super.onClose();
  }

  void getKelasData() async {
    isLoading.value = true;
    try {
      bool isConnected = await connectivityChecker();
      if (isConnected) {
        listKelas.value = await _databaseProvider.getKelas();
        listKelas.refresh();
        isLoading.value = false;
      } else {
        showModalDialog(
          title: 'Gagal',
          middleText: 'Tidak bisa terhubung ke internet',
        );
      }
    } catch (e) {
      showModalDialog(title: 'Error', middleText: "Error: " + e.toString());
    }
  }

  void addOrUpdateKelas({String? idKelas}) async {
    try {
      bool isConnected = await connectivityChecker();
      if (isConnected) {
        Kelas data = Kelas();
        data.ruangan = ruanganTextField!.text;
        data.tingkat = tingkatKelas.value;
        if (idKelas != null) {
          data.idKelas = idKelas;
          isUpdate.value = true;
        } else {
          isUpdate.value = false;
        }
        bool isSuccess = isUpdate.value
            ? await _databaseProvider.updateKelas(data)
            : await _databaseProvider.addKelas(data);
        if (isSuccess) {
          Get.toNamed(routeName.reverse[RouteName.DAFTARKELAS]!);
          getKelasData();
          showModalDialog(
            title: 'Success',
            middleText: isUpdate.value
                ? 'Kelas berhasil diperbaharui'
                : 'Kelas berhasil ditambahkan',
          );
          clearText();
        } else {
          showModalDialog(
            title: 'Gagal',
            middleText: isUpdate.value
                ? 'Kelas gagal diperbaharui, mohon coba lagi'
                : 'Kelas gagal ditambahkan, mohon coba lagi',
          );
        }
      }
    } catch (e) {
      showModalDialog(title: 'Error', middleText: "Error: " + e.toString());
    }
  }

  void deleteKelas(String idKelas) async {
    try {
      bool isConnected = await connectivityChecker();
      if (isConnected) {
        bool isSuccess = await _databaseProvider.deleteKelas(idKelas);
        if (isSuccess) {
          showModalDialog(
            title: 'Sukses',
            middleText: 'Data Berhasil terhapus',
          );
          getKelasData();
        } else {
          showModalDialog(
            title: 'Gagal',
            middleText: 'Tidak bisa menghapus data Ke, coba beberapa saat lagi',
          );
        }
      } else {
        showModalDialog(
          title: 'Gagal',
          middleText: 'Tidak bisa terhubung ke internet',
        );
      }
    } catch (e) {
      showModalDialog(title: 'Error', middleText: "Error: " + e.toString());
    }
  }

  void clearText() {
    isUpdate.value = false;
    ruanganTextField!.clear();
  }
}
