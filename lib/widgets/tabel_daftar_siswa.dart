import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/siswa_controller.dart';
import '../routes/route_name.dart';

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
                  showCheckboxColumn: false,
                  columnSpacing: 8,
                  columns: [
                    DataColumn(label: Text("No")),
                    DataColumn(label: Text("Nama")),
                    DataColumn(label: Text("NIS")),
                  ],
                  rows: _siswaController.listSiswa
                      .map(
                        (siswa) => DataRow(
                          onSelectChanged: (e) {
                            _siswaController.indexSiswa.value =
                                _siswaController.listSiswa.indexWhere(
                                    (element) => element.nis == siswa.nis);
                            Get.toNamed(
                              routeName.reverse[RouteName.PROFILSISWAPAGE]!,
                            );
                          },
                          cells: [
                            DataCell(
                              Text(
                                (_siswaController.listSiswa.indexWhere(
                                            (element) =>
                                                element.nis == siswa.nis) +
                                        1)
                                    .toString(),
                              ),
                            ),
                            DataCell(Text(siswa.nama!)),
                            DataCell(Text(siswa.nis!)),
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
