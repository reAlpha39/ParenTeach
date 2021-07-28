import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parenteach/controllers/siswa_controller.dart';

class TabelDaftarSiswa extends StatelessWidget {
  final SiswaController _siswaController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: Get.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Obx(
          () => _siswaController.isLoading.value
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : DataTable(
                  columnSpacing: 8,
                  columns: [
                    DataColumn(label: Text("No")),
                    DataColumn(label: Text("Nama")),
                    DataColumn(label: Text("NIS")),
                  ],
                  rows: _siswaController.listSiswa
                      .map(
                        (e) => DataRow(
                          cells: [
                            DataCell(
                              Text((_siswaController.listSiswa.indexWhere(
                                          (element) => element.nis == e.nis) +
                                      1)
                                  .toString()),
                            ),
                            DataCell(Text(e.nama!)),
                            DataCell(Text(e.nis!)),
                          ],
                        ),
                      )
                      .toList(),
                ),
        ),
      ),
    );
  }
}
