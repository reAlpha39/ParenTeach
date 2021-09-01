import 'package:get/get.dart';
import 'package:parenteach/controllers/agenda_controller.dart';

class AgendaBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AgendaController>(
      AgendaController(),
    );
  }
}
