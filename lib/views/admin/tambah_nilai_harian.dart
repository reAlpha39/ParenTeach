import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parenteach/controllers/nilai_harian_controller.dart';
import 'package:parenteach/utils/theme.dart';
import 'package:parenteach/views/admin/admin_tambah_siswa.dart';
import 'package:parenteach/widgets/custom_appbar.dart';

class TambahNilaiHarian extends StatelessWidget {
  final NilaiHarianController nilaiHarianController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        backgroundColor: pinkColor,
        foregroundColor: greyBackgroundColor,
        title: 'Tambah Nilai Harian',
        enableLeading: true,
      ),
      backgroundColor: greyBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(20),
              child: Column(
                children: [],
              ),
            ),
          ],
        ),
      ),
    );
  }

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
                  child: Text(''),
                  // Obx(
                  //   () => Text(
                  //     type == 'jenisKelamin'
                  //         ? nilaiHarianController.mataPelajaran.value == ''
                  //             ? label
                  //             : nilaiHarianController.mataPelajaran.value
                  //     style: blackText.copyWith(
                  //       fontSize: 16,
                  //       color: Colors.black54,
                  //     ),
                  //   ),
                  // ),
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
