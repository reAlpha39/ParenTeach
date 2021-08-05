import 'package:get/get.dart';

import '../controllers/guru_controller.dart';

class GuruBinding extends Bindings {
  void dependencies() {
    Get.put<GuruController>(GuruController());
  }
}
