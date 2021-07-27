import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parenteach/utils/theme.dart';
import 'package:parenteach/widgets/custom_appbar.dart';

class AdminTambahGuru extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    late TextEditingController namaController = TextEditingController();
    late TextEditingController nipController = TextEditingController();
    late TextEditingController usernameController = TextEditingController();
    late TextEditingController passwordController = TextEditingController();
    late TextEditingController confirmPasswordController =
        TextEditingController();
    return Scaffold(
      appBar: CustomAppBar(
        enableLeading: true,
        title: 'Tambah Guru',
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
                    namaController,
                    'Nama',
                    'Tulis nama di sini',
                    false,
                  ),
                  buildGuruTextField(
                    nipController,
                    'NIP',
                    'Tulis nik di sini',
                    false,
                  ),
                  buildDropDown(
                    'Jenis Kelamin',
                    'Pilih Jenis Kelamin',
                    [
                      buildDropdownMenuItem('Laki-laki', 1),
                      buildDropdownMenuItem('Perempuan', 2),
                    ],
                  ),
                  buildDropDown(
                    'Status',
                    'Pilih Status',
                    [
                      buildDropdownMenuItem('ADMIN', 1),
                      buildDropdownMenuItem('TU', 2),
                      buildDropdownMenuItem('GURU KELAS', 3),
                      buildDropdownMenuItem('BK', 4),
                    ],
                  ),
                  buildDropDown(
                    'Wali Kelas',
                    'Pilih Kelas Di Sini',
                    [
                      buildDropdownMenuItem('7', 1),
                      buildDropdownMenuItem('8', 2),
                      buildDropdownMenuItem('9', 3),
                    ],
                  ),
                  buildGuruTextField(
                    usernameController,
                    'Username',
                    'Username',
                    false,
                  ),
                  buildGuruTextField(
                    passwordController,
                    'Password',
                    'Password',
                    true,
                  ),
                  buildGuruTextField(confirmPasswordController,
                      'Ulangi Password', 'Ulangi Password', true),
                  Text(
                    'Pilih Foto',
                    style: blackTextBold.copyWith(fontSize: 16),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: Get.width,
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: GestureDetector(
                        onTap: () {
                          // TODO: Pick Image
                        },
                        child: Container(
                          width: Get.width / 3,
                          height: 37,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Text(
                              'Pilih Foto',
                              style: blackText,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
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
