import 'dart:io';

import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewController extends GetxController {
  RxBool isLoading = true.obs;
  @override
  void onInit() {
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
    super.onInit();
  }
}
