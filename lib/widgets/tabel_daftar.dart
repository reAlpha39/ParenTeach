import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parenteach/models/civitas.dart';

class TabelDaftar extends StatelessWidget {
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
        child: DataTable(
          columns: [
            DataColumn(label: Text("No")),
            DataColumn(label: Text("Nama")),
            DataColumn(label: Text("Status")),
          ],
          rows: dummyCivitas
              .map(
                (e) => DataRow(
                  cells: [
                    DataCell(Text(e.idUser.toString())),
                    DataCell(Text(e.nama.toString())),
                    DataCell(Text(e.status.toString())),
                  ],
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
