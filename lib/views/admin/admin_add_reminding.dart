import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/reminding_controller.dart';
import '../../utils/theme.dart';
import '../../widgets/custom_appbar.dart';

class AdminAddReminding extends StatelessWidget {
  final RemindingController remindingController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          enableLeading: true,
          title: remindingController.isUpdate.value
              ? "Update Reminding"
              : "Tambah Reminding",
          isAdmin: false,
          backgroundColor: pinkColor,
          foregroundColor: greyBackgroundColor),
      backgroundColor: greyBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Pertanyaan',
                    style: blackTextBold.copyWith(fontSize: 18),
                  ),
                  TextFormField(
                    style: blackText.copyWith(
                      fontSize: 14,
                    ),
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                    controller: remindingController.remindingTextField,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        labelText: 'Tulis Pertanyaan Di Sini',
                        labelStyle: blackText.copyWith(fontSize: 16)),
                  ),
                  Obx(
                    () => addReminding(),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget addReminding() {
    bool isEnabled = true;
    if (remindingController.isLoading.value) {
      isEnabled = false;
    } else {
      isEnabled = true;
    }
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
      ),
      child: Container(
        width: Get.width / 3,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(blueColor),
            elevation: MaterialStateProperty.all<double>(0),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: buttonState(),
            ),
          ),
          onPressed: isEnabled
              ? () => remindingController.addOrUpdateReminding(
                    idReminding: Get.arguments,
                  )
              : null,
        ),
      ),
    );
  }

  Widget buttonState() {
    if (remindingController.isLoading.value) {
      return SizedBox(
        height: 24,
        width: 24,
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(
            Colors.white,
          ),
        ),
      );
    } else {
      return Text(
        "Tambah",
        style: whiteText.copyWith(fontSize: 16),
      );
    }
  }
}
