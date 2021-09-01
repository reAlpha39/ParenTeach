import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:parenteach/controllers/login_controller.dart';
import 'package:parenteach/controllers/siswa_controller.dart';
import 'package:parenteach/models/agenda.dart';
import 'package:parenteach/repositories/database_provider.dart';
import 'package:parenteach/routes/route_name.dart';
// import '../repositories/database_provider.dart';
import '../utils/shared_methods.dart';
import '../utils/utils.dart';

class AgendaController extends GetxController {
  final LoginController loginController = Get.find();
  final DatabaseProvider _databaseProvider = DatabaseProvider();
  TextEditingController? agendaController;
  TextEditingController? tanggalController;
  Rx<Agenda> agenda = Agenda().obs;
  RxBool isUpdate = false.obs;
  RxBool isLoading = true.obs;
  RxList<Agenda> listAgenda = RxList<Agenda>();

  void onInit() {
    agendaController = TextEditingController();
    tanggalController = TextEditingController();
    super.onInit();
  }

  void onReady() {
    _getInitialAgenda();
    super.onReady();
  }

  void onClose() {
    agendaController?.dispose();
    tanggalController?.dispose();
    super.onClose();
  }

  void _getInitialAgenda() {
    getAgendaData(loginController.user.value.idUsers!);
  }

  void getAgendaData(String idUser) async {
    isLoading.value = true;
    try {
      bool isConnected = await connectivityChecker();
      if (isConnected) {
        listAgenda.value = await _databaseProvider.getAgenda(idUser);
        listAgenda.refresh();
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

  void addAgenda() async {
    try {
      bool isConnected = await connectivityChecker();
      if (isConnected) {
        Agenda data = Agenda();
        data.agenda = agendaController!.text;
        data.tanggalAgenda = tanggalController!.text;
        // if (idReminding != null) {
        //   data.idReminding = idReminding;
        //   isUpdate.value = true;
        // } else {
        //   isUpdate.value = false;
        // }

        bool isSuccess =
            // isUpdate.value
            // ? await _databaseProvider.updateReminding(data)
            // :
            await _databaseProvider.addAgenda(
                loginController.user.value.idUsers!, data);
        if (isSuccess) {
          Get.toNamed(routeName.reverse[RouteName.KALENDERPAGEORANGTUA]!);
          _getInitialAgenda();
          showModalDialog(
            title: 'Success',
            middleText:
                // isUpdate.value
                // ? 'Reminding berhasil diperbaharui'
                // :
                'Agenda berhasil ditambahkan',
          );
          // clearText();
        } else {
          showModalDialog(
            title: 'Gagal',
            middleText:
                // isUpdate.value
                //     ? 'QnA gagal diperbaharui, mohon coba lagi'
                // :
                'QnA gagal ditambahkan, mohon coba lagi',
          );
        }
      }
    } catch (e) {
      showModalDialog(title: 'Error', middleText: "Error: " + e.toString());
    }
  }

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
