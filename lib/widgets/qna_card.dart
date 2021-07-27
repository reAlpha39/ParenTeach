import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import '../utils/theme.dart';

class QnaCard extends StatelessWidget {
  final String titleCard;
  final String? answer;

  const QnaCard({
    Key? key,
    required this.titleCard,
    this.answer,
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
          child: ExpandableNotifier(
            child: ScrollOnExpand(
              child: ExpandablePanel(
                theme: const ExpandableThemeData(
                  headerAlignment: ExpandablePanelHeaderAlignment.center,
                  tapBodyToExpand: true,
                  tapBodyToCollapse: false,
                  hasIcon: true,
                  expandIcon: LineIcons.chevronCircleDown,
                  collapseIcon: LineIcons.chevronCircleUp,
                  iconColor: pinkColor,
                ),
                header: Text(
                  titleCard,
                  style: blackTextBold.copyWith(
                    fontSize: 14,
                  ),
                ),
                collapsed: Container(),
                expanded: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                  ),
                  child: Text(
                    answer == null ? "" : answer!,
                    overflow: TextOverflow.clip,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
