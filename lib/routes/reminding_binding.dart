import 'package:get/get.dart';
import 'package:parenteach/controllers/reminding_controller.dart';

class RemindingBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<RemindingController>(
      RemindingController(),
    );
  }
}
