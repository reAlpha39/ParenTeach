import 'package:flutter/material.dart';
import 'package:parenteach/utils/theme.dart';

class KotakFitur extends StatelessWidget {
  final String fitur;

  const KotakFitur({Key? key, required this.fitur}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 110,
          width: 100,
          decoration: BoxDecoration(
            color: pinkColor,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        Text(
          fitur,
          style: blackText,
        )
      ],
    );
  }
}
