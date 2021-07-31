import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../routes/route_name.dart';
import '../utils/utils.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/playground_card.dart';

class PlaygroundPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        enableLeading: true,
        title: 'Playground',
        isAdmin: false,
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
                  width: 210,
                  child: Image.asset(
                    'assets/Playground_bg.png',
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: 100,
                )
              ],
            ),
          ),
          Container(
            alignment: Alignment.topCenter,
            padding: const EdgeInsets.only(
              top: 250,
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
                        route: RouteName.WEBVIEW,
                        titleCard: 'Melempar Bola',
                        imageAsset: 'assets/beach_ball_icon.png',
                        url: 'https://kumparan.com/',
                      ),
                      PlaygroundCard(
                        route: RouteName.WEBVIEW,
                        titleCard: 'Bermain Puzzle',
                        imageAsset: 'assets/puzzle_icon.png',
                        url: 'https://kumparan.com/',
                      ),
                      PlaygroundCard(
                        route: RouteName.WEBVIEW,
                        titleCard: 'Barbel',
                        imageAsset: 'assets/barbell_icon.png',
                        url: 'https://kumparan.com/',
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      PlaygroundCard(
                        route: RouteName.WEBVIEW,
                        titleCard: 'Memasak',
                        imageAsset: 'assets/soup_icon.png',
                        url: 'https://kumparan.com/',
                      ),
                      PlaygroundCard(
                        route: RouteName.WEBVIEW,
                        titleCard: 'Bersepeda',
                        imageAsset: 'assets/bicycle_icon.png',
                        url: 'https://kumparan.com/',
                      ),
                      PlaygroundCard(
                        route: RouteName.WEBVIEW,
                        titleCard: 'Bermain Catur',
                        imageAsset: 'assets/chess_icon.png',
                        url: 'https://kumparan.com/',
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
