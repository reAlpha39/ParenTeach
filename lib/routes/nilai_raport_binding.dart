import 'package:get/get.dart';
import 'package:parenteach/controllers/nilai_raport_controller.dart';

class NilaiRaportBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<NilaiRaportController>(NilaiRaportController());
  }
}
