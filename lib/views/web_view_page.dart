import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parenteach/controllers/web_view_controller.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewPage extends StatelessWidget {
  final WebviewController webviewController = Get.find();

  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: Get.arguments,
      javascriptMode: JavascriptMode.unrestricted,
    );
  }
}
