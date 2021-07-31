import 'package:get/get.dart';
import 'package:parenteach/controllers/web_view_controller.dart';

class WebviewBinding extends Bindings {
  void dependencies() {
    Get.put<WebviewController>(WebviewController());
  }
}
