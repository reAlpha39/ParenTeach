import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/guru_controller.dart';
import '../../models/constant.dart';
import '../../utils/theme.dart';
import '../../utils/utils.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/image_preview.dart';

class AdminTambahGuru extends StatelessWidget {
  final GuruController _guruController = Get.find();

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
    return Scaffold(
      appBar: CustomAppBar(
        enableLeading: true,
        title: Get.arguments == null ? 'Tambah Guru' : 'Edit Guru',
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
                    _guruController.namaController!,
                    'Nama',
                    'Tulis nama di sini',
                    false,
                  ),
                  buildTextField(
                    _guruController.nipController!,
                    'NIP',
                    'Tulis nik di sini',
                    false,
                  ),
                  buildDropDown(
                      'Jenis Kelamin', 'Pilih Jenis Kelamin', 'jenisKelamin'),
                  buildDropDown(
                    'Status',
                    'Pilih Status',
                    'status',
                  ),
                  buildDropDown(
                    'Wali Kelas',
                    'Pilih Kelas Di Sini',
                    'waliKelas',
                  ),
                  buildTextField(
                    _guruController.emailController!,
                    'Email',
                    'Tulis email di sini',
                    false,
                  ),
                  buildTextField(
                    _guruController.noHpController!,
                    'No Handphone',
                    'Tulis no handphone di sini',
                    false,
                  ),
                  buildTextField(
                    _guruController.usernameController!,
                    'Username',
                    'Username',
                    false,
                  ),
                  buildTextField(
                    _guruController.passwordController!,
                    'Password',
                    'Password',
                    true,
                  ),
                  buildTextField(
                    _guruController.confirmPasswordController!,
                    'Ulangi Password',
                    'Ulangi Password',
                    true,
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 12,
                      bottom: 4,
                    ),
                    child: Text(
                      'Pratinjau foto',
                      style: blackTextBold.copyWith(fontSize: 16),
                    ),
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: 100,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        border: Border.all(color: Colors.black38),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Obx(
                        () => _guruController.fileName.value != ""
                            ? ClipRRect(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                child: Image.file(
                                  _guruController.image.value,
                                  fit: BoxFit.cover,
                                ),
                              )
                            : _guruController.imageUrl.value != ""
                                ? ImagePreview(
                                    pathPicture: _guruController.imageUrl.value,
                                  )
                                : Center(
                                    child: Text(
                                      'Tidak ada pratinjau foto tersedia',
                                      style: blackText.copyWith(
                                        fontSize: 16,
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 12,
                      bottom: 4,
                    ),
                    child: Text(
                      'Pilih Foto',
                      style: blackTextBold.copyWith(fontSize: 16),
                    ),
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
                          _guruController.imageFromGallery();
                        },
                        child: Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(right: 8),
                              width: 120,
                              height: 37,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Center(
                                child: Obx(
                                  () => Text(
                                    _guruController.fileName.value == ''
                                        ? 'Pilih Foto'
                                        : 'Ganti Foto',
                                    style: blackText,
                                  ),
                                ),
                              ),
                            ),
                            Flexible(
                              child: Obx(
                                () => Text(
                                  _guruController.fileName.value,
                                  maxLines: 1,
                                  overflow: TextOverflow.clip,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 12,
                    ),
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
                        if (Get.arguments == null) {
                          _guruController.saveGuruData();
                        } else {
                          _guruController.saveGuruData(isEdit: true);
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
    String? title,
    String? label,
    bool? isObscure,
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
                      type == 'jenisKelamin'
                          ? _guruController.jenisKelamin.value == ''
                              ? label
                              : _guruController.jenisKelamin.value
                          : type == 'status'
                              ? _guruController.status.value == ''
                                  ? label
                                  : _guruController.status.value
                              : _guruController.waliKelas.value == ''
                                  ? label
                                  : _guruController.waliKelas.value,
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
  final GuruController _guruController = Get.find();

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
              type == 'jenisKelamin'
                  ? jenisKelamins.length
                  : type == 'status'
                      ? status.length
                      : kelass.length,
              (index) => ListTile(
                title: Text(
                  type == 'jenisKelamin'
                      ? jenisKelamins[index]
                      : type == 'status'
                          ? status[index]
                          : kelass[index],
                  style: blackText,
                ),
                onTap: () {
                  if (type == 'jenisKelamin') {
                    _guruController.jenisKelamin.value = jenisKelamins[index];
                  } else if (type == 'status') {
                    _guruController.status.value = status[index];
                  } else {
                    _guruController.waliKelas.value = kelass[index];
                  }
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
