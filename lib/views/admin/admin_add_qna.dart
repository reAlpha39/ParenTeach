import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parenteach/controllers/qna_controller.dart';
import 'package:parenteach/utils/theme.dart';
import 'package:parenteach/widgets/custom_appbar.dart';

class AdminAddQna extends StatelessWidget {
  final QnaController _qnaController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        enableLeading: true,
        title: _qnaController.isUpdate.value
            ? "Update Pertanyaan"
            : "Tambah Pertanyaan",
        isAdmin: false,
        backgroundColor: pinkColor,
        foregroundColor: greyBackgroundColor,
        additionalLeadingFunction: () {
          _qnaController.clearText();
        },
      ),
      backgroundColor: greyBackgroundColor,
      body: GestureDetector(
        onTap: () =>
            WidgetsBinding.instance!.focusManager.primaryFocus?.unfocus(),
        child: SingleChildScrollView(
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
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: 10,
                      ),
                      child: Text(
                        'Pertanyaan',
                        style: blackTextBold.copyWith(
                          fontSize: 18,
                        ),
                      ),
                    ),
                    TextFormField(
                      style: blackText.copyWith(
                        fontSize: 14,
                      ),
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      controller: _qnaController.qnaQuestion,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        labelText: 'Tulis Pertanyaan Di Sini',
                        labelStyle: blackText.copyWith(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: 10,
                        top: 24,
                      ),
                      child: Text(
                        'Jawaban',
                        style: blackTextBold.copyWith(fontSize: 18),
                      ),
                    ),
                    TextFormField(
                      style: blackText.copyWith(
                        fontSize: 14,
                      ),
                      maxLines: 2,
                      keyboardType: TextInputType.multiline,
                      controller: _qnaController.qnaAnswer,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        labelText: 'Tulis Jawaban Di Sini',
                        labelStyle: blackText.copyWith(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 32,
                        bottom: 12,
                      ),
                      child: Center(
                        child: Container(
                          width: 130,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              elevation: MaterialStateProperty.all<double>(0),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Center(
                                child: Text(
                                  'Simpan',
                                  style: whiteText,
                                ),
                              ),
                            ),
                            onPressed: () => _qnaController.addQna(
                              idQna: Get.arguments,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
