import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parenteach/utils/utils.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool enableLeading;
  final String title;
  final bool enableNotifIcon;
  final double height;
  final Color backgroundColor;
  final Color foregroundColor;

  const CustomAppBar({
    Key? key,
    required this.enableLeading,
    required this.title,
    required this.enableNotifIcon,
    required this.backgroundColor,
    required this.foregroundColor,
    this.height = kToolbarHeight,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      elevation: 0,
      leading: enableLeading
          ? Container(
              padding: const EdgeInsets.only(
                left: 22,
              ),
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () => Get.back(),
                child: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    color: foregroundColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    Icons.arrow_back,
                    color: backgroundColor,
                  ),
                ),
              ),
            )
          : Container(),
      actions: enableNotifIcon
          ? [
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.notifications_rounded,
                    color: foregroundColor,
                    size: 28,
                  ),
                ),
              ),
            ]
          : null,
      centerTitle: true,
      title: Text(
        title,
        style: whiteTextBold.copyWith(
          fontSize: 24,
          color: foregroundColor,
        ),
      ),
    );
  }
}
