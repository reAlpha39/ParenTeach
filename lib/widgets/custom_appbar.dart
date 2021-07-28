import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parenteach/routes/route_name.dart';

import '../utils/utils.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool enableLeading;
  final String title;
  final double height;
  final Color backgroundColor;
  final Color foregroundColor;
  final bool isAdmin;
  final RouteName? route;
  final VoidCallback? additionalLeadingFunction;

  const CustomAppBar({
    Key? key,
    required this.enableLeading,
    required this.title,
    required this.backgroundColor,
    required this.foregroundColor,
    this.additionalLeadingFunction,
    this.route,
    this.isAdmin = false,
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
                onTap: () {
                  if (additionalLeadingFunction != null) {
                    additionalLeadingFunction!();
                  }
                  Get.back();
                },
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
      actions: isAdmin
          ? [
              IconButton(
                onPressed: () {
                  if (additionalLeadingFunction != null) {
                    additionalLeadingFunction!();
                  }
                  Get.toNamed(routeName.reverse[route]!);
                },
                icon: Icon(
                  Icons.add,
                  color: foregroundColor,
                  size: 28,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.more_vert_rounded,
                    color: foregroundColor,
                    size: 28,
                  ),
                ),
              ),
            ]
          : null,
      centerTitle: false,
      title: Text(
        title,
        style: whiteTextBold.copyWith(
          fontSize: 18,
          color: foregroundColor,
        ),
      ),
    );
  }
}
