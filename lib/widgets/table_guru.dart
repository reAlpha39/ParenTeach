import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/guru_controller.dart';
import '../routes/route_name.dart';

class TabelGuru extends StatelessWidget {
  final GuruController _guruController = Get.find();
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
          () => _guruController.isLoading.value
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : DataTable(
                  showCheckboxColumn: false,
                  columnSpacing: 8,
                  columns: [
                    DataColumn(label: Text("No")),
                    DataColumn(label: Text("Nama")),
                    DataColumn(label: Text("NIP")),
                  ],
                  rows: _guruController.listGuru
                      .map(
                        (guru) => DataRow(
                          onSelectChanged: (e) {
                            Get.toNamed(
                              routeName.reverse[RouteName.PROFILGURUPAGE]!,
                              arguments: _guruController.listGuru.indexWhere(
                                  (element) => element.nip == guru.nip),
                            );
                          },
                          cells: [
                            DataCell(
                              Text(
                                (_guruController.listGuru.indexWhere(
                                            (element) =>
                                                element.nip == guru.nip) +
                                        1)
                                    .toString(),
                              ),
                            ),
                            DataCell(Text(guru.nama == null ? '' : guru.nama!)),
                            DataCell(Text(guru.nip == null ? '' : guru.nip!)),
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
