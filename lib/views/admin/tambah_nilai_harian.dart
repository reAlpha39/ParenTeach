import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/nilai_harian_controller.dart';
import '../../utils/theme.dart';
import 'admin_tambah_siswa.dart';
import '../../widgets/custom_appbar.dart';

class TambahNilaiHarian extends StatefulWidget {
  final NilaiHarianController nilaiHarianController = Get.find();
  @override
  _TambahNilaiHarianState createState() => _TambahNilaiHarianState();
}

class _TambahNilaiHarianState extends State<TambahNilaiHarian> {
  @override
  Widget build(BuildContext context) {
    String? _chosenValue;
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
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
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
                      'Nama Mata Pelajaran',
                      style: blackTextBold.copyWith(fontSize: 16),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.grey,
                      ),
                    ),
                    child: DropdownButton<String>(
                      elevation: 0,
                      underline: SizedBox(),
                      isExpanded: true,
                      value: _chosenValue,
                      style: whiteText,
                      iconEnabledColor: Colors.black,
                      items: <String>[
                        'Koding',
                        'Koding  Koding',
                        'Koding  als',
                        'Koding  alasas',
                        'Koding  alasaas',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(color: Colors.black),
                          ),
                        );
                      }).toList(),
                      hint: Text("Pilih Mata Pelajaran", style: blackText),
                      onChanged: (String? value) {
                        setState(() {
                          _chosenValue = value;
                          widget.nilaiHarianController.mataPelajaran.value =
                              value!;
                          print(_chosenValue);
                        });
                      },
                    ),
                  ),
                  buildTextField(
                      widget
                          .nilaiHarianController.namaKegiatanHarianController!,
                      'Nama Kegiatan',
                      'Tulis nama kegiatan'),
                  buildTextField(
                      widget.nilaiHarianController.nilaiKegiatanController!,
                      'Nilai Kegiatan',
                      'Nilai kegiatan'),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    width: Get.width / 2.5,
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
                      onPressed: () => widget.nilaiHarianController.coba(),
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
            title!,
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
              labelText: label!,
              labelStyle: blackText.copyWith(fontSize: 16),
            ),
          ),
        ),
      ],
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
