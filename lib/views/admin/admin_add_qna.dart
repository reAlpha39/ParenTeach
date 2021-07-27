import 'package:flutter/material.dart';
import 'package:parenteach/utils/theme.dart';
import 'package:parenteach/widgets/custom_appbar.dart';

class AdminAddQna extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController? addRemindingController;
    return Scaffold(
      appBar: CustomAppBar(
        enableLeading: true,
        title: 'Tambah Pertanyaan',
        isAdmin: false,
        backgroundColor: pinkColor,
        foregroundColor: greyBackgroundColor,
      ),
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
                    controller: addRemindingController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        labelText: 'Tulis Pertanyaan Di Sini',
                        labelStyle: blackText.copyWith(fontSize: 16)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Jawaban',
                    style: blackTextBold.copyWith(fontSize: 18),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    style: blackText.copyWith(
                      fontSize: 14,
                    ),
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                    controller: addRemindingController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        labelText: 'Tulis Jawaban Di Sini',
                        labelStyle: blackText.copyWith(fontSize: 16)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 130,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all<double>(0),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
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
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
