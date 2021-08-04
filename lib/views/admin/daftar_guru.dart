import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/guru_controller.dart';
import '../../routes/route_name.dart';
import '../../utils/utils.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/search_guru_siswa.dart';
import '../../widgets/table_guru.dart';

class DaftarGuruPage extends StatelessWidget {
  final GuruController _guruController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greyBackgroundColor,
      appBar: CustomAppBar(
        enableLeading: true,
        title: 'Daftar Guru',
        isAdmin: true,
        backgroundColor: pinkColor,
        foregroundColor: greyBackgroundColor,
        route: RouteName.ADMINTAMBAHGURUPAGE,
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
                    cariController: _guruController.searchGuruTEC,
                    textFieldLabel: 'Cari Guru Di Sini',
                  )
                ],
              ),
            ),
            TabelGuru(),
          ],
        ),
      ),
    );
  }
}
