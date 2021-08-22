import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icon.dart';
import 'package:parenteach/controllers/login_controller.dart';
import 'package:parenteach/widgets/pilih_reminding_card.dart';
import '../../controllers/reminding_controller.dart';
import '../../routes/route_name.dart';

import '../../utils/utils.dart';

class AdminRemindingPage extends StatefulWidget {
  @override
  _AdminRemindingPageState createState() => _AdminRemindingPageState();
}

class _AdminRemindingPageState extends State<AdminRemindingPage> {
  final TextEditingController searchReminding = TextEditingController();
  final RemindingController remindingController = Get.find();
  final LoginController loginController = Get.find();

  @override
  Widget build(BuildContext context) {
    int selectedItem = 0;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: 250,
              width: Get.width,
              decoration: BoxDecoration(color: pinkColor),
              child: Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Image.asset(
                  'assets/reminding_illustration.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () => Get.back(),
                            child: Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Icon(
                                Icons.arrow_back,
                                color: pinkColor,
                                size: 20,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Reminding',
                            style: whiteTextBold,
                          )
                        ],
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(routeName.reverse[
                                  RouteName.ADMINTAMBAHREMINDINGPAGE]!);
                            },
                            child: LineIcon.plus(
                              color: Colors.white,
                            ),
                          ),
                          PopupMenuButton<int>(
                            icon: Icon(
                              Icons.more_vert,
                              color: Colors.white,
                            ),
                            onSelected: (item) {
                              setState(() {
                                selectedItem = item;
                                handleThreeDots(selectedItem);
                              });
                            },
                            itemBuilder: (context) => [
                              PopupMenuItem<int>(
                                value: 0,
                                child: Text(
                                  'Profile',
                                  style: blackText,
                                ),
                              ),
                              PopupMenuItem<int>(
                                value: 1,
                                child: Text(
                                  'About Us',
                                  style: blackText,
                                ),
                              ),
                              PopupMenuItem<int>(
                                value: 2,
                                child: Text(
                                  'Logout',
                                  style: blackText,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 170,
                  ),
                  // Text(
                  //   'Reminding Favorite',
                  //   style: whiteText.copyWith(fontSize: 18),
                  // ),
                  // SizedBox(
                  //   height: 10,
                  // ),
                  // Obx(
                  //   () => remindingController.isLoading.value
                  //       ? CircularProgressIndicator()
                  //       : Row(
                  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //           children: remindingController.listReminding
                  //               .map(
                  //                 (e) => FavoriteRemindingCard(
                  //                   reminding: e.pertanyaan,
                  //                 ),
                  //               )
                  //               .take(2)
                  //               .toList(),
                  //         ),
                  // ),
                  // SizedBox(
                  //   height: 15,
                  // ),
                  // RemindingPageTextField(),
                  Container(
                    color: Colors.white,
                    child: TextField(
                      controller: searchReminding,
                      onChanged: (value) {
                        setState(() {});
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                          color: pinkColor,
                        ),
                        contentPadding: EdgeInsets.all(10),
                        border: InputBorder.none,
                        labelText: 'Cari Asmaul Husna',
                        labelStyle: blackText.copyWith(fontSize: 12),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Pilih Remindingmu',
                    style: blackText,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Obx(
                            () => remindingController.isLoading.value
                                ? Center(child: CircularProgressIndicator())
                                : SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        ListView.builder(
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          shrinkWrap: true,
                                          itemCount: remindingController
                                              .listReminding.length,
                                          itemBuilder: (context, index) {
                                            if (searchReminding.text.isEmpty) {
                                              return PilihRemindingCard(
                                                idReminding: remindingController
                                                    .listReminding[index]
                                                    .idReminding,
                                                pertanyaan: remindingController
                                                    .listReminding[index]
                                                    .pertanyaan,
                                              );
                                            } else if (remindingController
                                                    .listReminding[index]
                                                    .pertanyaan!
                                                    .toLowerCase()
                                                    .contains(
                                                        searchReminding.text) ||
                                                remindingController
                                                    .listReminding[index]
                                                    .pertanyaan!
                                                    .toLowerCase()
                                                    .contains(
                                                        searchReminding.text)) {
                                              return PilihRemindingCard(
                                                  idReminding:
                                                      remindingController
                                                          .listReminding[index]
                                                          .idReminding,
                                                  pertanyaan:
                                                      remindingController
                                                          .listReminding[index]
                                                          .pertanyaan);
                                            } else {
                                              return Container();
                                            }
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void handleThreeDots(int? item) {
    switch (item) {
      case 0:
        Get.toNamed(routeName.reverse[RouteName.PROFILPAGE]!);
        break;
      case 1:
        Get.toNamed(routeName.reverse[RouteName.WEBVIEW]!);
        break;
      case 2:
        loginController.userLogout();
    }
  }
}
