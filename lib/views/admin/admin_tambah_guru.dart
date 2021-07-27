import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parenteach/utils/theme.dart';
import 'package:parenteach/widgets/custom_appbar.dart';

class AdminTambahGuru extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    late TextEditingController namaController = TextEditingController();
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
                  buildGuruTextField(
                      namaController, 'Nama', 'Tulis nama di sini'),
                  buildGuruTextField(
                      namaController, 'NIP', 'Tulis nik di sini'),
                  buildDropDown(
                    'Jenis Kelamin',
                    'Pilih Jenis Kelamin',
                    [
                      buildDropdownMenuItem('Laki-laki', 1),
                      buildDropdownMenuItem('Perempuan', 2),
                    ],
                  ),
                  // buildDropDown('Status', 'Pilih Status'),
                  // buildDropDown('Wali Kelas', 'Pilih Kelas Di Sini'),
                  buildGuruTextField(namaController, 'Username', 'Username'),
                  buildGuruTextField(namaController, 'Password', 'Password'),
                  buildGuruTextField(
                      namaController, 'Ulangi Password', 'Ulangi Password'),
                  buildGuruTextField(
                      namaController, 'Upload Foto', 'Tulis nama di sini'),
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

  Widget buildGuruTextField(
      TextEditingController namaController, String title, String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: blackTextBold.copyWith(fontSize: 16),
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
                labelText: label,
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
