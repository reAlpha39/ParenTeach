import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parenteach/routes/route_name.dart';
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
        appBar: CustomAppBar(
          enableLeading: true,
          backgroundColor: pinkColor,
          foregroundColor: Colors.white,
          title: 'QnA',
          isAdmin: true,
          // Masih Dummy belum bisa masuk ya
          route: RouteName.PLAYGROUNDPAGE,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: List<Widget>.generate(
              dummyText.length,
              (index) => QnaCard(
                titleCard: dummyText[index],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
