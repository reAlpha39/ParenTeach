import 'package:get/get.dart';
import '../controllers/qna_controller.dart';

class QnaBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<QnaController>(
      QnaController(),
    );
  }
}
