import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parenteach/utils/theme.dart';
import 'package:parenteach/widgets/custom_appbar.dart';
import 'package:parenteach/widgets/qna_card.dart';


class AdminQnaPage extends StatelessWidget {
  const AdminQnaPage({Key? key}) : super(key: key);
  static List<String> dummyText = [
    'Bagaimana membangun sifat anak yang baik?',
    'Sikap yang baik itu seperti apa?',
    'Apa peran orang tua agar anak dapat berkelakuan baik?',
    'Bagaimana membangun sifat anak yang baik?',
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          WidgetsBinding.instance!.focusManager.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: CustomAppBar(enableLeading: true, backgroundColor: pinkColor, foregroundColor: Colors.white, title: 'QnA',),
        body: Stack(
          children: [
            Container(
              width: Get.width,
              height: 160,
              child: Container(
                color: pinkColor,
                alignment: Alignment.topCenter,
                padding: const EdgeInsets.only(
                  bottom: 12,
                ),
                width: 200,
                child: Image.asset(
                  'assets/qna_illustration.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 135,
                left: 32,
                right: 32,
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 14,
                ),
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
              padding: const EdgeInsets.only(
                top: 190,
                left: 32,
                right: 32,
              ),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: List<Widget>.generate(
                    dummyText.length,
                    (index) => QnaCard(
                      titleCard: dummyText[index],
                    ),
                  )
                    ..insert(
                      0,
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Sikap',
                          style: pinkText.copyWith(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    )
                    ..add(
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Bakat Siswa',
                          style: pinkText.copyWith(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    )
                    ..addAll([
                      QnaCard(
                        titleCard: dummyText[0],
                      ),
                      QnaCard(
                        titleCard: dummyText[1],
                      ),
                      QnaCard(
                        titleCard: dummyText[2],
                      ),
                    ]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
