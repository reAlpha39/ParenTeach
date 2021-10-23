import 'package:get/get.dart';

class UtilsController extends GetxController {
  RxInt currentIndex = 0.obs;

  void handleOnTap(int index) {
    currentIndex.value = index;
  }
}
