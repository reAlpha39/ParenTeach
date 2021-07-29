import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parenteach/controllers/siswa_controller.dart';
import 'package:parenteach/models/siswa.dart';
// import 'package:parenteach/controllers/siswa_controller.dart';
import 'package:parenteach/utils/theme.dart';
import 'package:parenteach/widgets/custom_appbar.dart';

class ProfilSiswaPage extends StatelessWidget {
  final SiswaController siswaController = Get.find();
  @override
  Widget build(BuildContext context) {
    int index = Get.arguments;
    return Scaffold(
      appBar: CustomAppBar(
        backgroundColor: pinkColor,
        enableLeading: true,
        foregroundColor: greyBackgroundColor,
        title: 'Profil Siswa',
      ),
      backgroundColor: greyBackgroundColor,
      body: SingleChildScrollView(
        child: Obx(
          () => siswaController.isLoading.value
              ? CircularProgressIndicator()
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Center(
                        child: Text(
                          siswaController.listSiswa[index].nama!,
                          style: blackText.copyWith(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(yellowAccentColor),
                          elevation: MaterialStateProperty.all<double>(0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Center(
                            child: Text(
                              'Rapot Siswa',
                            ),
                          ),
                        ),
                        onPressed: () {},
                      ),
                      Container(
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            children: [
                              Container(
                                height: 200,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(siswaController
                                          .listSiswa[index].fotoSiswa!),
                                      fit: BoxFit.cover),
                                ),
                              ),
                              buldDataSiswa(
                                'Nama Lengkap',
                                siswaController.listSiswa[index].nama,
                              ),
                              buldDataSiswa(
                                'NIS',
                                siswaController.listSiswa[index].nis,
                              ),
                              buldDataSiswa(
                                'Jenis Kelamin',
                                siswaController.listSiswa[index].jenisKelamin,
                              ),
                              buldDataSiswa(
                                'Kelas',
                                siswaController.listSiswa[index].kelas,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(pinkColor),
                          elevation: MaterialStateProperty.all<double>(0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Center(
                            child: Text(
                              'Edit Siswa',
                              style: blackText,
                            ),
                          ),
                        ),
                        onPressed: () {},
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Delete Siswa',
                        style: blackTextBold,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }

  Column buldDataSiswa(String? label, String? data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 20,
        ),
        Text(
          label!,
          style: blackText.copyWith(fontSize: 12, color: Colors.grey),
        ),
        Divider(),
        Text(
          data!,
          style: blackText,
        ),
      ],
    );
  }
}
