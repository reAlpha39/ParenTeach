import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/utils.dart';

class CardNilaiRaport extends StatelessWidget {
  final bool? isPengetahuan;
  final String? nomor;
  final String? mapel;
  final String? nilaiPengetahuan;
  final String? nilaiKeterampilan;

  const CardNilaiRaport(
      {Key? key,
      this.isPengetahuan,
      this.nomor,
      this.mapel,
      this.nilaiPengetahuan,
      this.nilaiKeterampilan})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  nomor!,
                  style: blackTextBold.copyWith(color: pinkColor, fontSize: 18),
                ),
                Text(
                  mapel!,
                  style: blackText,
                ),
              ],
            ),
            Row(
              children: [
                (isPengetahuan!)
                    ? Row(
                        children: [
                          Text(
                            nilaiKeterampilan!,
                            style: blackTextBold.copyWith(
                                color: blueColor, fontSize: 18),
                          ),
                          Text(
                            ' : ',
                            style: blackTextBold.copyWith(fontSize: 18),
                          ),
                        ],
                      )
                    : SizedBox(),
                Text(
                  nilaiPengetahuan!,
                  style: blackTextBold.copyWith(
                      color: Colors.yellow, fontSize: 18),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
