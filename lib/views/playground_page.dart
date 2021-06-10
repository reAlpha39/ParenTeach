import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parenteach/routes/route_name.dart';
import 'package:parenteach/utils/utils.dart';
import 'package:parenteach/widgets/custom_appbar.dart';
import 'package:parenteach/widgets/playground_card.dart';

class PlaygroundPage extends StatelessWidget {
  const PlaygroundPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        enableLeading: true,
        title: 'Playground',
        enableNotifIcon: true,
        backgroundColor: pinkColor,
        foregroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          Container(
            width: Get.width,
            color: pinkColor,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: Get.width,
                  child: Image.asset(
                    'assets/playground.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      bottom: 72,
                      left: 32,
                    ),
                    child: Text(
                      'Ayo Bermain Bunda',
                      style: whiteText.copyWith(fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.topCenter,
            padding: const EdgeInsets.only(
              top: 280,
              left: 32,
              right: 32,
            ),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      PlaygroundCard(
                        route: RouteName.HOMEPAGE,
                        titleCard: 'Melempar Bola',
                        imageAsset: 'assets/beach_ball_icon.png',
                      ),
                      PlaygroundCard(
                        route: RouteName.HOMEPAGE,
                        titleCard: 'Bermain Puzzle',
                        imageAsset: 'assets/puzzle_icon.png',
                      ),
                      PlaygroundCard(
                        route: RouteName.HOMEPAGE,
                        titleCard: 'Barbel',
                        imageAsset: 'assets/barbell_icon.png',
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      PlaygroundCard(
                        route: RouteName.HOMEPAGE,
                        titleCard: 'Memasak',
                        imageAsset: 'assets/soup_icon.png',
                      ),
                      PlaygroundCard(
                        route: RouteName.HOMEPAGE,
                        titleCard: 'Bersepeda',
                        imageAsset: 'assets/bicycle_icon.png',
                      ),
                      PlaygroundCard(
                        route: RouteName.HOMEPAGE,
                        titleCard: 'Bermain Catur',
                        imageAsset: 'assets/chess_icon.png',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
