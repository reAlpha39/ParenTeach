import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:parenteach/models/agenda.dart';
// import '../repositories/database_provider.dart';
import '../utils/shared_methods.dart';
import '../utils/utils.dart';

class AgendaController extends GetxController {
  // final DatabaseProvider _databaseProvider = DatabaseProvider();
  TextEditingController? agendaController;
  TextEditingController? tanggalController;
  Rx<Agenda> agenda = Agenda().obs;
  RxBool isUpdate = false.obs;
  RxBool isLoading = true.obs;
  RxList<Agenda> listReminding = RxList<Agenda>();

  void onInit() {
    agendaController = TextEditingController();
    tanggalController = TextEditingController();
    super.onInit();
  }

  void onReady() {
    getRemindingData();
    super.onReady();
  }

  void onClose() {
    agendaController?.dispose();
    tanggalController?.dispose();
    super.onClose();
  }

  void getRemindingData() async {
    isLoading.value = true;
    try {
      bool isConnected = await connectivityChecker();
      if (isConnected) {
        // listReminding.value = await _databaseProvider.getListReminding();
        listReminding.refresh();
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

  // void addOrUpdateReminding({String? idReminding}) async {
  //   try {
  //     bool isConnected = await connectivityChecker();
  //     if (isConnected) {
  //       Reminding data = Reminding();
  //       data.pertanyaan = remindingTextField!.text;
  //       if (idReminding != null) {
  //         data.idReminding = idReminding;
  //         isUpdate.value = true;
  //       } else {
  //         isUpdate.value = false;
  //       }
  //       bool isSuccess = isUpdate.value
  //           ? await _databaseProvider.updateReminding(data)
  //           : await _databaseProvider.addReminding(data);
  //       if (isSuccess) {
  //         Get.toNamed(routeName.reverse[RouteName.ADMINREMINDINGPAGE]!);
  //         getRemindingData();
  //         showModalDialog(
  //           title: 'Success',
  //           middleText: isUpdate.value
  //               ? 'Reminding berhasil diperbaharui'
  //               : 'Reminding berhasil ditambahkan',
  //         );
  //         clearText();
  //       } else {
  //         showModalDialog(
  //           title: 'Gagal',
  //           middleText: isUpdate.value
  //               ? 'QnA gagal diperbaharui, mohon coba lagi'
  //               : 'QnA gagal ditambahkan, mohon coba lagi',
  //         );
  //       }
  //     }
  //   } catch (e) {
  //     showModalDialog(title: 'Error', middleText: "Error: " + e.toString());
  //   }
  // }

  // void deleteReminding(String idReminding) async {
  //   try {
  //     bool isConnected = await connectivityChecker();
  //     if (isConnected) {
  //       bool isSuccess = await _databaseProvider.deleteReminding(idReminding);
  //       if (isSuccess) {
  //         showModalDialog(
  //           title: 'Sukses',
  //           middleText: 'Data Berhasil terhapus',
  //         );
  //         getRemindingData();
  //       } else {
  //         showModalDialog(
  //           title: 'Gagal',
  //           middleText:
  //               'Tidak bisa menghapus data Reminding, coba beberapa saat lagi',
  //         );
  //       }
  //     } else {
  //       showModalDialog(
  //         title: 'Gagal',
  //         middleText: 'Tidak bisa terhubung ke internet',
  //       );
  //     }
  //   } catch (e) {
  //     showModalDialog(title: 'Error', middleText: "Error: " + e.toString());
  //   }
  // }

  // void clearText() {
  //   isUpdate.value = false;
  //   remindingTextField!.clear();
  // }
}
