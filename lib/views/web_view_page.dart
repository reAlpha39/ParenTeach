import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parenteach/controllers/web_view_controller.dart';
import 'package:parenteach/utils/theme.dart';
import 'package:parenteach/widgets/custom_appbar.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewPage extends StatelessWidget {
  final WebviewController webviewController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          enableLeading: true,
          title: '',
          backgroundColor: pinkColor,
          foregroundColor: greyBackgroundColor),
      body: Obx(
        () => Stack(
          children: [
            WebView(
              initialUrl: Get.arguments,
              javascriptMode: JavascriptMode.unrestricted,
              onPageFinished: (finish) {
                webviewController.isLoading.value = false;
              },
            ),
            webviewController.isLoading.value
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Stack(),
          ],
        ),
      ),
    );
  }
}