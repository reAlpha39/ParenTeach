import 'package:get/get.dart';
import 'package:parenteach/controllers/kelas_controller.dart';

class KelasBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<KelasController>(
      KelasController(),
    );
  }
}
