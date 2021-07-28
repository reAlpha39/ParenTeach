import 'package:get/get.dart';
import 'package:parenteach/controllers/siswa_controller.dart';

class SiswaBinding extends Bindings {
  void dependencies() {
    Get.put<SiswaController>(SiswaController());
  }
}
