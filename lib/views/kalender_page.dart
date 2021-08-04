import 'package:flutter/material.dart';
import 'package:parenteach/routes/route_name.dart';

import '../utils/utils.dart';
import '../widgets/custom_appbar.dart';

class KalenderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController tahunAwal = TextEditingController();
    return GestureDetector(
      onTap: () =>
          WidgetsBinding.instance!.focusManager.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: CustomAppBar(
          enableLeading: true,
          title: 'Kalender',
          isAdmin: false,
          backgroundColor: pinkColor,
          foregroundColor: Colors.white,
          route: RouteName.ADMINADDQNAPAGE,
        ),
        backgroundColor: greyBackgroundColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              buildTextField(
                namaController: tahunAwal,
                namaController2: tahunAwal,
                title: 'Tambah Tahun',
                label1: 'Tahun Awal',
                label2: 'Tahun Akhir',
                isDouble: true,
              ),
              buildTextField(
                namaController: tahunAwal,
                label1: 'asa',
                isDouble: false,
                title: 'asas',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container buildButton({required VoidCallback onPressed}) {
    return Container(
      margin: const EdgeInsets.only(
        top: 12,
      ),
      width: 130,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(blueColor),
          elevation: MaterialStateProperty.all<double>(0),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Text(
              'Simpan',
              style: whiteText,
            ),
          ),
        ),
        onPressed: () {
          onPressed();
        },
      ),
    );
  }

  Widget buildTextField({
    required TextEditingController namaController,
    TextEditingController? namaController2,
    required String title,
    required String label1,
    String? label2,
    required bool isDouble,
  }) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(
              top: 12,
              bottom: 4,
            ),
            child: Text(
              title,
              style: blackTextBold.copyWith(fontSize: 16),
            ),
          ),
          Container(
            height: 50,
            child: TextFormField(
              style: blackText.copyWith(
                fontSize: 14,
              ),
              controller: namaController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                labelText: label1,
                labelStyle: blackText.copyWith(fontSize: 16),
              ),
            ),
          ),
          (isDouble == true)
              ? Container(
                  height: 50,
                  margin: EdgeInsets.only(top: 10),
                  child: TextFormField(
                    style: blackText.copyWith(
                      fontSize: 14,
                    ),
                    controller: namaController2!,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      labelText: label2!,
                      labelStyle: blackText.copyWith(fontSize: 16),
                    ),
                  ),
                )
              : SizedBox(),
          buildButton(onPressed: () {}),
        ],
      ),
    );
  }

  // static Widget _eventIcon = Container(
  //     decoration: BoxDecoration(
  //       color: Colors.green,
  //       borderRadius: BorderRadius.all(Radius.circular(1000)),
  //     ),
  //     child: null);
  // static Widget _eventIcon2 = Container(
  //     decoration: BoxDecoration(
  //       color: Colors.yellow[700],
  //       borderRadius: BorderRadius.all(Radius.circular(1000)),
  //     ),
  //     child: null);
  // static Widget _eventIcon3 = Container(
  //     decoration: BoxDecoration(
  //       color: Colors.cyan,
  //       borderRadius: BorderRadius.all(Radius.circular(1000)),
  //     ),
  //     child: null);

  // final EventList<Event> _markedDateMap = new EventList<Event>(
  //   events: {
  //     new DateTime(2021, 7, 10): [
  //       new Event(
  //         date: new DateTime(2021, 7, 10),
  //         title: 'Event 1',
  //         icon: _eventIcon,
  //       ),
  //     ],
  //     new DateTime(2021, 7, 12): [
  //       new Event(
  //         date: new DateTime(2021, 7, 12),
  //         title: 'Event 1',
  //         icon: _eventIcon2,
  //       ),
  //     ],
  //     new DateTime(2021, 7, 29): [
  //       new Event(
  //         date: new DateTime(2021, 7, 29),
  //         title: 'Event 1',
  //         icon: _eventIcon3,
  //       ),
  //     ],
  //   },
  // );

  // Widget buildKalenderTile(String? title, String? date, Color? dot) {
  //   return Container(
  //     margin: EdgeInsets.symmetric(vertical: 10),
  //     decoration: BoxDecoration(
  //       color: Colors.white,
  //       borderRadius: BorderRadius.circular(10),
  //     ),
  //     child: Row(
  //       children: [
  //         Padding(
  //           padding: const EdgeInsets.all(15.0),
  //           child: Container(
  //             height: 15,
  //             width: 15,
  //             decoration: BoxDecoration(
  //               color: dot,
  //               borderRadius: BorderRadius.circular(15),
  //             ),
  //           ),
  //         ),
  //         SizedBox(
  //           width: 10,
  //         ),
  //         Expanded(
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               Padding(
  //                 padding: const EdgeInsets.only(top: 20.0),
  //                 child: Text(
  //                   title!,
  //                   maxLines: 2,
  //                   overflow: TextOverflow.ellipsis,
  //                   style: blackTextBold,
  //                 ),
  //               ),
  //               Padding(
  //                 padding: const EdgeInsets.only(bottom: 20.0),
  //                 child: Text(
  //                   date!,
  //                   style: blackText.copyWith(
  //                     color: Colors.grey,
  //                   ),
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
