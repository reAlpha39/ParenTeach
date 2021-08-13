import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/siswa_controller.dart';
import '../routes/route_name.dart';
import '../widgets/custom_appbar.dart';
import '../utils/theme.dart';
import '../widgets/card_nilai_raport.dart';

class RapotPage extends StatelessWidget {
  final SiswaController siswaController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        enableLeading: true,
        backgroundColor: pinkColor,
        foregroundColor: greyBackgroundColor,
        title: 'Rapot Page',
        isAdmin: true,
        route: RouteName.ADMINTAMBAHNILAIRAPOTPAGE,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: 170,
              width: Get.width,
              decoration: BoxDecoration(
                color: pinkColor,
                image: DecorationImage(
                  image: AssetImage('assets/bubble_bg.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    siswaController
                        .listSiswa[siswaController.indexSiswa.value].nama!,
                    style: whiteText.copyWith(fontSize: 18),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Tahun Ajaran',
                                style: whiteText,
                              ),
                              buildDropDown(
                                  height: 50,
                                  width: Get.width / 2.5,
                                  hint: '2018 / 2019'),
                            ],
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Semester',
                                style: whiteText,
                              ),
                              buildDropDown(height: 50, width: 61, hint: '2'),
                            ],
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () => Get.toNamed(
                            routeName.reverse[RouteName.NILAIHARIANPAGE]!),
                        child: Text(
                          'Nilai Harian',
                          style: whiteText,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  buildPresensiSikapSiswa(jumlahPresensi: 90, sikap: 'BAIK'),
                  SizedBox(
                    height: 30,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Column(
                        children: List.generate(
                          10,
                          (index) => CardNilaiRaport(
                            isPengetahuan: true,
                          ),
                        )
                          ..insert(
                            0,
                            Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: Row(
                                children: [
                                  buildKategoriRapot(blueColor, 'Pengetahuan'),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  buildKategoriRapot(
                                      Colors.yellow, 'Keterampilan'),
                                ],
                              ),
                            ),
                          )
                          ..add(
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                    bottom: 10,
                                  ),
                                  width: Get.width / 3,
                                  height: 55,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Rangking',
                                          style: blackText,
                                        ),
                                        Text(
                                          '2',
                                          style: blackTextBold.copyWith(
                                              color: blueColor, fontSize: 18),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
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
                                              '80',
                                              style: blackTextBold.copyWith(
                                                  color: blueColor,
                                                  fontSize: 18),
                                            ),
                                            Text(
                                              ' : ',
                                              style: blackTextBold.copyWith(
                                                  fontSize: 18),
                                            ),
                                            Text(
                                              '78',
                                              style: blackTextBold.copyWith(
                                                  color: Colors.yellow,
                                                  fontSize: 18),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                          ..add(
                            downloadRaportButton(),
                          )
                          ..add(
                            Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Siswa Di Sekolah',
                                  style: blackTextBold.copyWith(
                                    fontSize: 18,
                                    color: pinkColor,
                                  ),
                                ),
                              ],
                            ),
                          )
                          ..add(
                            Container(
                              height: 150,
                              width: Get.width,
                              decoration: BoxDecoration(
                                color: Colors.white,
                              ),
                              child: Column(
                                children: [
                                  Table(
                                    children: [
                                      TableRow(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(10),
                                            child: Text(
                                              'Nama Bakat',
                                              style: blackText.copyWith(
                                                  color: blueColor,
                                                  fontSize: 16),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(10),
                                            child: Text(
                                              'Nilai',
                                              style: blackText.copyWith(
                                                  color: Colors.yellow,
                                                  fontSize: 16),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Table(
                                    border: TableBorder.all(),
                                    children: [
                                      TableRow(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(10),
                                            child: Text(
                                              '1. Futsal',
                                              style: blackTextBold,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(10),
                                            child: Text(
                                              'A',
                                              style: blackTextBold,
                                            ),
                                          ),
                                        ],
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
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Container buildPresensiSikapSiswa(
      {required int? jumlahPresensi, required String? sikap}) {
    return Container(
      width: Get.width,
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                'Presensi Siswa',
                style: blackText,
              ),
              Text(
                '${jumlahPresensi!} %',
                style: blackTextBold,
              ),
            ],
          ),
          Container(
            color: Colors.grey.withOpacity(0.3),
            height: 70,
            width: 1,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                'Sikap siswa',
                style: blackText,
              ),
              Text(
                sikap!.toUpperCase(),
                style: blackTextBold,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container buildDropDown({
    required double? width,
    required double? height,
    required String? hint,
  }) {
    return Container(
      padding: EdgeInsets.all(10),
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: DropdownButton(
        elevation: 0,
        hint: Text(hint!),
        isExpanded: true,
        underline: SizedBox(
          height: 0,
        ),
        icon: Icon(Icons.arrow_drop_down),
        items: ['A', 'B', 'C', 'D'].map((String value) {
          return DropdownMenuItem(
            value: value,
            child: new Text(value),
          );
        }).toList(),
        onChanged: (_) {},
      ),
    );
  }

  Widget downloadRaportButton() {
    return ElevatedButton(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all<double>(0),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Text(
            'Download Raport',
            style: whiteText,
          ),
        ),
      ),
      onPressed: () {},
    );
  }

  Row buildKategoriRapot(Color color, String kategori) {
    return Row(
      children: [
        Container(
          height: 13,
          width: 13,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          kategori,
          style: blackTextBold,
        ),
      ],
    );
  }
}
