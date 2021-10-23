import 'package:get/get.dart';
import 'package:parenteach/controllers/utils_controller.dart';

class UtilsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<UtilsController>(
      UtilsController(),
    );
  }
}
