import 'package:get/get.dart';
import 'package:parenteach/controllers/nilai_harian_controller.dart';

class NilaiHarianBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<NilaiHarianController>(
      NilaiHarianController(),
    );
  }
}
