import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parenteach/utils/theme.dart';
import 'package:parenteach/widgets/custom_appbar.dart';

class AdminTambahNilaiHarian extends StatelessWidget {
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
                  buildDropDown(
                    'Nama Mata Pelajaran',
                    'Pilih Mata Pelajaran',
                    [
                      buildDropdownMenuItem(
                        'Bahasa Alien',
                        1,
                      ),
                    ],
                  ),
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
                labelStyle: blackText.copyWith(fontSize: 16)),
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }

  Widget buildDropDown(
      String? title, String? label, List<DropdownMenuItem<int>>? items) {
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
          width: Get.width,
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey),
          ),
          child: DropdownButton(
            underline: SizedBox(),
            isExpanded: true,
            items: items,
            onChanged: (value) {},
            hint: Text(label!),
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }

  DropdownMenuItem<int> buildDropdownMenuItem(String item, int value) {
    return DropdownMenuItem(
      child: Text(item),
      value: value,
    );
  }
}
