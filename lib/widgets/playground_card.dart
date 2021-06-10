import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../routes/route_name.dart';
import '../utils/theme.dart';

class PlaygroundCard extends StatelessWidget {
  final String imageAsset;
  final String titleCard;
  final RouteName route;

  const PlaygroundCard({
    Key? key,
    required this.imageAsset,
    required this.titleCard,
    required this.route,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.offAndToNamed(routeName.reverse[route]!),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Container(
          height: 150,
          width: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 12,
                  right: 12,
                  top: 8,
                ),
                child: Image.asset(imageAsset),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  titleCard,
                  style: blackText,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
