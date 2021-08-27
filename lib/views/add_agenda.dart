import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../utils/theme.dart';
import '../../widgets/custom_appbar.dart';

class AddAgenda extends StatelessWidget {
  final TextEditingController tanggalController = TextEditingController();
  final TextEditingController agendaController = TextEditingController();
  final DateTime currentDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    DateTime? selectedDate;
    return Scaffold(
      appBar: CustomAppBar(
        enableLeading: true,
        title: 'Tambah Kelas',
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
                  buildTextField(
                      agendaController, 'Nama Agenda', 'Tulis Nama Di Sini'),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: tanggalController,
                    onTap: () {
                      _selectDate(context, selectedDate);
                    },
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
                        if (agendaController.text == "") {
                          Get.snackbar(
                            'Ruangan Masih Kosong',
                            'Silakan isi nama ruangan',
                            backgroundColor: Colors.white,
                          );
                        } else {
                          // kelasController.addOrUpdateKelas();
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
    );
  }

  Widget buildTextField(
    TextEditingController namaController,
    String? text,
    String? label,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text!,
          style: blackTextBold,
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
                labelStyle: blackText.copyWith(fontSize: 16)),
          ),
        ),
      ],
    );
  }

  _selectDate(BuildContext context, DateTime? selectedDate) async {
    DateTime? newSelectedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate != null ? selectedDate : currentDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2040),
    );

    if (newSelectedDate != null) {
      selectedDate = newSelectedDate;
      tanggalController..text = DateFormat.yMMMMEEEEd().format(selectedDate);
    }
  }
}
