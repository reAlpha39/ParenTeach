import 'package:get/get.dart';
import 'package:parenteach/controllers/siswa_controllrer.dart';

class SiswaBinding extends Bindings {
  void dependencies() {
    Get.put<SiswaController>(SiswaController());
  }
}
