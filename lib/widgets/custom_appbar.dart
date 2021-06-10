import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parenteach/utils/utils.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool enableLeading;
  final String title;
  final bool enableNotifIcon;
  final double height;

  const CustomAppBar({
    Key? key,
    required this.enableLeading,
    required this.title,
    required this.enableNotifIcon,
    this.height = kToolbarHeight,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      leading: enableLeading
          ? Center(
              child: GestureDetector(
                onTap: () => Get.back(),
                child: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    Icons.arrow_back,
                    color: pinkColor,
                  ),
                ),
              ),
            )
          : null,
      actions: enableNotifIcon
          ? [
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.notifications,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
            ]
          : null,
      centerTitle: true,
      title: Text(
        title,
        style: whiteTextBold.copyWith(fontSize: 24),
      ),
    );
  }
}
