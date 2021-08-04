import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/siswa_controller.dart';
import '../../routes/route_name.dart';
import '../../utils/utils.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/search_guru_siswa.dart';
import '../../widgets/tabel_daftar_siswa.dart';

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
