import 'package:get/get.dart';
import '../controllers/web_view_controller.dart';

class WebviewBinding extends Bindings {
  void dependencies() {
    Get.put<WebviewController>(WebviewController());
  }
}
