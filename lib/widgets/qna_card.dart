import 'package:flutter/material.dart';

import '../utils/theme.dart';

class QnaCard extends StatelessWidget {
  final String titleCard;

  const QnaCard({
    Key? key,
    required this.titleCard,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Container(
          padding: const EdgeInsets.all(12),
          width: 400,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
          ),
          child: Row(
            children: [
              Flexible(
                child: Text(
                  titleCard,
                  style: blackTextBold.copyWith(
                    fontSize: 14,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text(
                  '5\nJawaban',
                  textAlign: TextAlign.center,
                  style: pinkText.copyWith(
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
