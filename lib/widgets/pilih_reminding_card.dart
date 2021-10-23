import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/reminding_controller.dart';

import '../utils/utils.dart';

class PilihRemindingCard extends StatelessWidget {
  final RemindingController remindingController = Get.find();
  final String? idReminding;
  final String? pertanyaan;
  final bool? isAdmin;

  PilihRemindingCard(
      {Key? key, this.idReminding, this.pertanyaan, this.isAdmin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 14),
      height: 170,
      width: Get.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset('assets/soup_icon.png'),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Text(
                  pertanyaan!,
                  style: blackTextBold.copyWith(fontSize: 11),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Row(
                children: [
                  isAdmin == true
                      ? GestureDetector(
                          onTap: () {
                            Get.defaultDialog(
                              radius: 17,
                              title: 'Konfirmasi Hapus Data',
                              content: Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 4,
                                  horizontal: 12,
                                ),
                                child: Center(
                                  child: Text(
                                    'Anda yakin ingin menghapus data ini?',
                                    style: blackText,
                                  ),
                                ),
                              ),
                              textConfirm: 'OK',
                              textCancel: 'Batal',
                              buttonColor: pinkColor,
                              cancelTextColor: Colors.black87,
                              confirmTextColor: Colors.white,
                              onConfirm: () {
                                remindingController
                                    .deleteReminding(idReminding!);
                                Navigator.of(Get.overlayContext!).pop();
                              },
                              onCancel: () =>
                                  Navigator.of(Get.overlayContext!).pop(),
                            ).then((value) => value = false);
                          },
                          child: Icon(
                            Icons.delete,
                            color: pinkColor,
                          ),
                        )
                      : Text(
                          'Yes',
                          style: pinkText,
                        ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 20,
                    child: Image.asset('assets/send_icon_pink.png'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
