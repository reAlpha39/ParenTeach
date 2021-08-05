import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parenteach/controllers/guru_controller.dart';
import 'package:parenteach/routes/route_name.dart';
import 'package:parenteach/utils/theme.dart';
import 'package:parenteach/widgets/custom_appbar.dart';

class ProfilGuruPage extends StatelessWidget {
  final GuruController guruController = Get.find();
  @override
  Widget build(BuildContext context) {
    int index = Get.arguments;
    return Scaffold(
      appBar: CustomAppBar(
        backgroundColor: pinkColor,
        enableLeading: true,
        foregroundColor: greyBackgroundColor,
        title: 'Profil Guru',
      ),
      backgroundColor: greyBackgroundColor,
      body: SingleChildScrollView(
        child: Obx(
          () => guruController.isLoading.value
              ? CircularProgressIndicator()
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Center(
                        child: Text(
                          guruController.listGuru[index].nama == null
                              ? ""
                              : guruController.listGuru[index].nama!,
                          style: blackText.copyWith(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
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
                                      image: NetworkImage(
                                        guruController.listGuru[index].foto ==
                                                null
                                            ? ""
                                            : guruController
                                                .listGuru[index].foto!,
                                      ),
                                      fit: BoxFit.cover),
                                ),
                              ),
                              buldDataGuru(
                                'Nama Lengkap',
                                guruController.listGuru[index].nama == null
                                    ? ""
                                    : guruController.listGuru[index].nama!,
                              ),
                              buldDataGuru(
                                'NIP',
                                guruController.listGuru[index].nip == null
                                    ? ""
                                    : guruController.listGuru[index].nip!,
                              ),
                              buldDataGuru(
                                'Jenis Kelamin',
                                guruController.listGuru[index].jenisKelamin ==
                                        null
                                    ? ""
                                    : guruController
                                        .listGuru[index].jenisKelamin!,
                              ),
                              buldDataGuru(
                                'NoHp',
                                guruController.listGuru[index].noHp == null
                                    ? ""
                                    : guruController.listGuru[index].noHp!,
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
                              'Edit Guru',
                              style: blackText,
                            ),
                          ),
                        ),
                        onPressed: () {
                          guruController.loadGuruState(Get.arguments);
                          Get.toNamed(routeName
                              .reverse[RouteName.ADMINTAMBAHGURUPAGE]!);
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          'Delete Guru',
                          style: blackTextBold,
                        ),
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

  Column buldDataGuru(String? label, String? data) {
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
