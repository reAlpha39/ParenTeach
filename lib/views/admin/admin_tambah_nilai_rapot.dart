import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parenteach/controllers/nilai_raport_controller.dart';
import 'package:parenteach/models/constant.dart';
import 'package:parenteach/utils/custom_scroll_behavior.dart';
import '../../utils/theme.dart';
import '../../widgets/custom_appbar.dart';

class AdminTambahNilaiRapot extends StatelessWidget {
  final NilaiRaportController _nilaiRaportController = Get.find();

  _showDialogList(String type) {
    return Get.defaultDialog(
      radius: 17,
      title: 'Pilih salah satu',
      content: Selector(
        type: type,
      ),
      confirmTextColor: Colors.black87,
      buttonColor: Color(0xffffcd29),
      cancelTextColor: Colors.black87,
    );
  }

  @override
  Widget build(BuildContext context) {
    late TextEditingController keterampilanController = TextEditingController();
    late TextEditingController pengetahuanController = TextEditingController();
    return Scaffold(
      appBar: CustomAppBar(
        enableLeading: true,
        title: 'Tambah Nilai Rapot',
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
                  buildDropDown('Nama Mata Pelajaran', 'Pilih Mata Pelajaran',
                      'mataPelajaran'),
                  buildTextField(keterampilanController, 'Nilai Keterampilan',
                      'Tulis Dengan Angka', false),
                  buildTextField(pengetahuanController, 'Nilai Pengetahuan',
                      'Tulis Dengan Angka', false),
                  Container(
                    width: 130,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(blueColor),
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

  Widget buildTextField(
    TextEditingController namaController,
    String? title,
    String? label,
    bool? isObscure,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title!,
          style: blackTextBold.copyWith(fontSize: 16),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 50,
          child: TextFormField(
            style: blackText.copyWith(
              fontSize: 14,
            ),
            obscureText: isObscure!,
            controller: namaController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              labelText: label!,
              labelStyle: blackText.copyWith(fontSize: 16),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }

  Widget buildDropDown(
    String title,
    String label,
    String type,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(
            top: 12,
            bottom: 4,
          ),
          child: Text(
            title,
            style: blackTextBold.copyWith(fontSize: 16),
          ),
        ),
        InkWell(
          onTap: () => _showDialogList(type),
          child: Container(
            width: Get.width,
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Obx(
                    () => Text(
                      _nilaiRaportController.mataPelajaran.value == ''
                          ? label
                          : _nilaiRaportController.mataPelajaran.value,
                      style: blackText.copyWith(
                        fontSize: 16,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ),
                Icon(Icons.keyboard_arrow_down),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class Selector extends StatelessWidget {
  final String type;
  final NilaiRaportController _controller = Get.find();

  Selector({Key? key, required this.type}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minHeight: 100,
        maxHeight: 500,
        minWidth: 300,
        maxWidth: 300,
      ),
      padding: const EdgeInsets.all(8.0),
      child: ScrollConfiguration(
        behavior: CustomScrollBehavior(),
        child: SingleChildScrollView(
          child: Column(
            children: List<Widget>.generate(
              mataPelajarans.length,
              (index) => ListTile(
                title: Text(
                  mataPelajarans[index],
                  style: blackText,
                ),
                onTap: () {
                  _controller.mataPelajaran.value = mataPelajarans[index];
                  Get.back(closeOverlays: false);
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
