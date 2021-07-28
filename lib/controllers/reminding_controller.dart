import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:parenteach/models/reminding.dart';
import 'package:parenteach/repositories/database_provider.dart';
import 'package:parenteach/utils/shared_methods.dart';
import 'package:parenteach/utils/utils.dart';

class RemindingController extends GetxController {
  final DatabaseProvider _databaseProvider = DatabaseProvider();
  TextEditingController? remindingTextField;
  Rx<Reminding> reminding = Reminding().obs;
  RxBool isUpdate = false.obs;
  RxBool isLoading = true.obs;
  RxList<Reminding> listReminding = RxList<Reminding>();

  void onInit() {
    remindingTextField = TextEditingController();
    super.onInit();
  }

  void onReady() {
    getRemindingData();
    super.onReady();
  }

  void onClose() {
    remindingTextField?.dispose();
    super.onClose();
  }

  void getRemindingData() async {
    isLoading.value = true;
    try {
      bool isConnected = await connectivityChecker();
      if (isConnected) {
        listReminding.value = await _databaseProvider.getListReminding();
        listReminding.refresh();
        isLoading.value = false;
      } else {
        showDialog(
          title: 'Gagal',
          middleText: 'Tidak bisa terhubung ke internet',
        );
      }
    } catch (e) {
      showDialog(title: 'Error', middleText: "Error: " + e.toString());
    }
  }

  void addOrUpdateReminding({String? idReminding}) async {
    try {
      bool isConnected = await connectivityChecker();
      if (isConnected) {
        Reminding data = Reminding();
        data.pertanyaan = remindingTextField!.text;
        if (idReminding != null) {
          data.idReminding = idReminding;
          isUpdate.value = true;
        } else {
          isUpdate.value = false;
        }
        bool isSuccess = isUpdate.value
            ? await _databaseProvider.updateReminding(data)
            : await _databaseProvider.addReminding(data);
        if (isSuccess) {
          getRemindingData();
          showDialog(
            title: 'Success',
            middleText: isUpdate.value
                ? 'Reminding berhasil diperbaharui'
                : 'Reminding berhasil ditambahkan',
          );
          // clearText();
        } else {
          showDialog(
            title: 'Gagal',
            middleText: isUpdate.value
                ? 'QnA gagal diperbaharui, mohon coba lagi'
                : 'QnA gagal ditambahkan, mohon coba lagi',
          );
        }
      }
    } catch (e) {
      showDialog(title: 'Error', middleText: "Error: " + e.toString());
    }
  }
}
