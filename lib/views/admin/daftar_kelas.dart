import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parenteach/routes/route_name.dart';
import '../../utils/theme.dart';
import '../../widgets/custom_appbar.dart';

class DaftarKelas extends StatelessWidget {
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
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
            width: Get.width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: DataTable(
                showCheckboxColumn: false,
                columnSpacing: 8,
                columns: [
                  DataColumn(label: Text("No")),
                  DataColumn(label: Text("Nama Kelas")),
                  DataColumn(label: Text("Ruang")),
                ],
                rows: [
                  DataRow(
                    onSelectChanged: (e) {},
                    cells: [
                      DataCell(
                        Text('1'),
                      ),
                      DataCell(
                        Text('Satu'),
                      ),
                      DataCell(
                        Text('a'),
                      ),
                    ],
                  ),
                ])
            // .toList(),
            ),
      ),
    );
  }
}
