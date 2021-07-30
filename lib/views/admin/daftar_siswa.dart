import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parenteach/controllers/siswa_controller.dart';
import 'package:parenteach/routes/route_name.dart';
import 'package:parenteach/utils/utils.dart';
import 'package:parenteach/widgets/custom_appbar.dart';
import 'package:parenteach/widgets/search_guru_siswa.dart';
import 'package:parenteach/widgets/tabel_daftar_siswa.dart';

class DaftarSiswaPage extends StatelessWidget {
  final SiswaController _siswaController = Get.find();
  @override
  Widget build(BuildContext context) {
    TextEditingController? cariController;
    return Scaffold(
      backgroundColor: greyBackgroundColor,
      appBar: CustomAppBar(
        enableLeading: true,
        title: 'Daftar Siswa',
        isAdmin: true,
        backgroundColor: pinkColor,
        foregroundColor: greyBackgroundColor,
        route: RouteName.ADMINTAMBAHSISWAPAGE,
        additionalAddIconFunction: () => _siswaController.resetState(),
      ),
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
                  SearchGuruSiswa(
                    cariController: cariController,
                    textFieldLabel: 'Cari Siswa Di sini',
                  )
                ],
              ),
            ),
            TabelDaftarSiswa()
          ],
        ),
      ),
    );
  }
}
