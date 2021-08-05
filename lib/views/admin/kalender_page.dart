import 'package:flutter/material.dart';
import '../../routes/route_name.dart';

import '../../utils/utils.dart';
import '../../widgets/custom_appbar.dart';

class KalenderPageAdmin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController tahunAwal = TextEditingController();
    return GestureDetector(
      onTap: () =>
          WidgetsBinding.instance!.focusManager.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: CustomAppBar(
          enableLeading: true,
          title: 'Kalender',
          isAdmin: false,
          backgroundColor: pinkColor,
          foregroundColor: Colors.white,
          route: RouteName.ADMINADDQNAPAGE,
        ),
        backgroundColor: greyBackgroundColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              buildTextField(
                namaController: tahunAwal,
                namaController2: tahunAwal,
                title: 'Tambah Tahun',
                label1: 'Tahun Awal',
                label2: 'Tahun Akhir',
                isDouble: true,
              ),
              // Yang set tahun belum
              buildTextField(
                namaController: tahunAwal,
                label1: '2019/2020',
                isDouble: false,
                title: 'Hapus Tahun',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container buildButton({required VoidCallback onPressed}) {
    return Container(
      margin: const EdgeInsets.only(
        top: 12,
      ),
      width: 130,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(blueColor),
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
            child: Text(
              'Simpan',
              style: whiteText,
            ),
          ),
        ),
        onPressed: () {
          onPressed();
        },
      ),
    );
  }

  Widget buildTextField({
    required TextEditingController namaController,
    TextEditingController? namaController2,
    required String title,
    required String label1,
    String? label2,
    required bool isDouble,
  }) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
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
          Container(
            height: 50,
            child: TextFormField(
              style: blackText.copyWith(
                fontSize: 14,
              ),
              controller: namaController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                labelText: label1,
                labelStyle: blackText.copyWith(fontSize: 16),
              ),
            ),
          ),
          (isDouble == true)
              ? Container(
                  height: 50,
                  margin: EdgeInsets.only(top: 10),
                  child: TextFormField(
                    style: blackText.copyWith(
                      fontSize: 14,
                    ),
                    controller: namaController2!,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      labelText: label2!,
                      labelStyle: blackText.copyWith(fontSize: 16),
                    ),
                  ),
                )
              : SizedBox(),
          buildButton(onPressed: () {}),
        ],
      ),
    );
  }
}
