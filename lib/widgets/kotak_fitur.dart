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
          height: 95,
          width: 110,
          decoration: BoxDecoration(
            color: pinkColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Image.asset(
            buildFiturImage(fitur),
          ),
        ),
        Text(
          fitur,
          style: blackText,
        )
      ],
    );
  }

  String buildFiturImage(String fitur) {
    switch (fitur) {
      case 'Reminding':
        return 'assets/fitur1.png';
      case 'Activities':
        return 'assets/fitur2.png';
      case 'Playground':
        return 'assets/fitur3.png';
      case 'Rapot':
        return 'assets/fitur4.png';
      case 'QnA':
        return 'assets/fitur5.png';
      case 'Blog':
        return 'assets/fitur6.png';
      default:
        return '';
    }
  }
}
