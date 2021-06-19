import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parenteach/utils/theme.dart';

class RapotPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: 170,
              width: Get.width,
              decoration: BoxDecoration(
                color: pinkColor,
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(
                            Icons.arrow_back,
                            color: pinkColor,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Raport',
                        style: whiteTextBold.copyWith(fontSize: 24),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  // TODO: Add TabBar To Change Raport Type
                  SizedBox(
                    height: 130,
                  ),
                  Container(
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
                              '90 %',
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
                              'BAIK',
                              style: blackTextBold,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      buildKategoriRapot(blueColor, 'Pengetahuan'),
                      SizedBox(
                        width: 20,
                      ),
                      buildKategoriRapot(Colors.yellow, 'Keterampilan'),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Column(
                        children: List.generate(
                          10,
                          (index) => Container(
                            margin: EdgeInsets.only(
                              bottom: 10,
                            ),
                            width: Get.width,
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
                                        '1. ',
                                        style: blackTextBold.copyWith(
                                            color: pinkColor, fontSize: 18),
                                      ),
                                      Text(
                                        'Ilmu Pengetahuan Alam',
                                        style: blackText,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        '80',
                                        style: blackTextBold.copyWith(
                                            color: blueColor, fontSize: 18),
                                      ),
                                      Text(
                                        ' : ',
                                        style: blackTextBold.copyWith(
                                            fontSize: 18),
                                      ),
                                      Text(
                                        '78',
                                        style: blackTextBold.copyWith(
                                            color: Colors.yellow, fontSize: 18),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
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
