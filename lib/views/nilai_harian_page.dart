import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/siswa_controller.dart';
import '../routes/route_name.dart';
import '../widgets/custom_appbar.dart';
import '../utils/theme.dart';
import '../widgets/card_nilai_raport.dart';

class NilaiHarianPage extends StatelessWidget {
  final SiswaController siswaController = Get.find();
  @override
  Widget build(BuildContext context) {
    // int index = Get.arguments;
    return Scaffold(
      appBar: CustomAppBar(
        enableLeading: true,
        backgroundColor: pinkColor,
        foregroundColor: greyBackgroundColor,
        title: 'Nilai Harian',
        isAdmin: true,
        route: RouteName.TAMBAHNILAIHARIANPAGE,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: List.generate(
                10,
                (index) => CardNilaiRaport(
                  isPengetahuan: false,
                  nomor: '1',
                  mapel: 'aasas',
                  nilaiKeterampilan: '90',
                  nilaiPengetahuan: '90',
                ),
              )..add(
                  Container(
                    margin: EdgeInsets.only(
                      bottom: 10,
                    ),
                    width: Get.width / 2,
                    height: 55,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Rata-rata',
                                style: blackText,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                '78',
                                style: blackTextBold.copyWith(
                                    color: Colors.yellow, fontSize: 18),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
            ),
          ),
        ),
      ),
    );
  }
}
