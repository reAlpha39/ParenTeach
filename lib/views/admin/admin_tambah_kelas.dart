import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parenteach/controllers/kelas_controller.dart';
import '../../utils/theme.dart';
import '../../widgets/custom_appbar.dart';

class AdminTambahKelas extends StatelessWidget {
  final KelasController kelasController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        enableLeading: true,
        title: 'Tambah Kelas',
        isAdmin: false,
        backgroundColor: pinkColor,
        foregroundColor: greyBackgroundColor,
      ),
      backgroundColor: greyBackgroundColor,
      body: Obx(
        () => SingleChildScrollView(
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
                    Container(
                      height: 50,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: DropdownButton<String>(
                        elevation: 0,
                        underline: SizedBox(),
                        isExpanded: true,
                        hint: Text("Status"),
                        value: kelasController.tingkatKelas.value,
                        items: <String>[
                          '--Pilih Kelas--',
                          '1',
                          '2',
                          '3',
                          '4',
                          '5',
                          '6',
                          '7',
                          '8',
                          '9',
                          '10',
                          '11',
                          '12',
                        ].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? val) {
                          kelasController.tingkatKelas.value = val!;
                          print(kelasController.tingkatKelas.value);
                        },
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    buildTextField(
                        kelasController.ruanganTextField!, 'Ruangan'),
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
                        onPressed: () {
                          if (kelasController.ruanganTextField!.text == "") {
                            Get.snackbar(
                              'Ruangan Masih Kosong',
                              'Silakan isi nama ruangan',
                              backgroundColor: Colors.white,
                            );
                          } else {
                            kelasController.addOrUpdateKelas();
                          }
                        },
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

  Widget buildTextField(
    TextEditingController namaController,
    String? label,
  ) {
    return Container(
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
            labelText: label!,
            labelStyle: blackText.copyWith(fontSize: 16)),
      ),
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
