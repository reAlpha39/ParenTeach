import 'package:flutter/material.dart';
import 'package:parenteach/utils/theme.dart';
import 'package:parenteach/widgets/custom_appbar.dart';

class AdminAddReminding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
        enableLeading: true,
        title: 'Tambah Reminding',
        enableNotifIcon: false,
        backgroundColor: pinkColor,
        foregroundColor: greyBackgroundColor);
  }
}
