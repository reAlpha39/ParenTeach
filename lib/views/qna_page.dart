import 'package:flutter/material.dart';
import 'package:parenteach/utils/utils.dart';
import 'package:parenteach/widgets/custom_appbar.dart';

class QnaPage extends StatelessWidget {
  const QnaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        enableLeading: false,
        title: 'QnA',
        enableNotifIcon: false,
        backgroundColor: pinkColor,
        foregroundColor: Colors.white,
      ),
    );
  }
}
