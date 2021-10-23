import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parenteach/controllers/kelas_controller.dart';
import 'package:parenteach/routes/route_name.dart';
import '../../utils/theme.dart';
import '../../widgets/custom_appbar.dart';

class DaftarKelas extends StatelessWidget {
  final KelasController kelasController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        enableLeading: true,
        title: 'Daftar Kelas',
        backgroundColor: pinkColor,
        foregroundColor: greyBackgroundColor,
        isAdmin: true,
        route: RouteName.ADMINTAMBAHKELAS,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Obx(
          () => kelasController.isLoading.value
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Container(
                  width: Get.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: DataTable(
                    showCheckboxColumn: false,
                    columnSpacing: 8,
                    columns: [
                      DataColumn(
                        label: Text("No"),
                      ),
                      DataColumn(
                        label: Text("Nama Kelas"),
                      ),
                      DataColumn(
                        label: Text("Ruang"),
                      ),
                      DataColumn(
                        label: Text("Aksi"),
                      ),
                    ],
                    rows: kelasController.listKelas
                        .map(
                          (element) => DataRow(
                            onSelectChanged: (e) {},
                            cells: [
                              DataCell(
                                Text(element.idKelas!),
                              ),
                              DataCell(
                                Text(element.tingkat!),
                              ),
                              DataCell(
                                Text(element.ruangan!),
                              ),
                              DataCell(
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        kelasController.loadText(
                                            element.tingkat!, element.ruangan!);
                                        Get.toNamed(
                                          routeName.reverse[
                                              RouteName.ADMINTAMBAHKELAS]!,
                                          arguments: element.idKelas!,
                                        );
                                      },
                                      child: Icon(
                                        Icons.edit,
                                        color: pinkColor,
                                      ),
                                    ),
                                    GestureDetector(
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
                                            kelasController
                                                .deleteKelas(element.idKelas!);
                                            Navigator.of(Get.overlayContext!)
                                                .pop();
                                          },
                                          onCancel: () =>
                                              Navigator.of(Get.overlayContext!)
                                                  .pop(),
                                        ).then((value) => value = false);
                                      },
                                      child: Icon(
                                        Icons.delete,
                                        color: pinkColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                        .toList(),
                  ),
                ),
        ),
      ),
    );
  }
}
