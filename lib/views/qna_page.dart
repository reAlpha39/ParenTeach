import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/login_controller.dart';
import '../controllers/qna_controller.dart';
import '../models/user_type.dart';
import '../routes/route_name.dart';

import '../utils/utils.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/qna_card.dart';

class QnaPage extends StatelessWidget {
  QnaPage({Key? key}) : super(key: key);
  final LoginController _loginController = Get.find();
  final QnaController _qnaController = Get.find();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          WidgetsBinding.instance!.focusManager.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: CustomAppBar(
          enableLeading: true,
          title: 'QnA',
          isAdmin:
              _loginController.user.value.type == UserType.ADMIN ? true : false,
          backgroundColor: pinkColor,
          foregroundColor: Colors.white,
          route: RouteName.ADMINADDQNAPAGE,
          additionalLeadingFunction: () => _qnaController.clearText(),
        ),
        body: Stack(
          children: [
            _loginController.user.value.type == UserType.ADMIN
                ? Container()
                : Container(
                    width: Get.width,
                    height: 200,
                    child: Container(
                      color: pinkColor,
                      alignment: Alignment.topCenter,
                      padding: const EdgeInsets.only(
                        bottom: 12,
                      ),
                      width: 200,
                      child: Image.asset(
                        'assets/Qna_bg.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
            Padding(
              padding: _loginController.user.value.type == UserType.ADMIN
                  ? EdgeInsets.only(top: 12)
                  : EdgeInsets.only(
                      top: 135,
                      left: 32,
                      right: 32,
                    ),
              child: _loginController.user.value.type == UserType.ADMIN
                  ? Container()
                  : Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 14,
                      ),
                      margin: EdgeInsets.only(top: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 8),
                                child: Icon(
                                  Icons.search_rounded,
                                  color: pinkColor,
                                ),
                              ),
                              Container(
                                width: 250,
                                height: 20,
                                child: TextField(
                                  decoration: InputDecoration.collapsed(
                                    hintText: 'Cari pertanyaan disini',
                                    hintStyle: blackText.copyWith(
                                        color: Colors.grey, fontSize: 13),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: GestureDetector(
                              onTap: () {},
                              child: Icon(
                                Icons.keyboard_arrow_down,
                                color: Color(0xff909090),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
            ),
            Container(
              alignment: Alignment.topCenter,
              padding: _loginController.user.value.type == UserType.ADMIN
                  ? EdgeInsets.only(
                      top: 20,
                      left: 32,
                      right: 32,
                    )
                  : EdgeInsets.only(
                      top: 190,
                      left: 32,
                      right: 32,
                    ),
              child: Obx(
                () => _qnaController.isLoading.value
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Column(
                          children: List<Widget>.generate(
                            _qnaController.listQna.length,
                            (index) => QnaCard(
                              titleCard:
                                  _qnaController.listQna[index].pertanyaan!,
                              answer: _qnaController.listQna[index].jawaban!,
                              idQna: _qnaController.listQna[index].idQna!,
                            ),
                          )..insert(
                              0,
                              SizedBox(
                                height: 20,
                              )),
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
