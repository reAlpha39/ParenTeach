import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parenteach/utils/theme.dart';

class PlaygroundPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greyBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: Get.width,
                    height: 400,
                    decoration: BoxDecoration(
                      color: pinkColor,
                      image: DecorationImage(
                          image: AssetImage('assets/playground.png'),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: margin),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                Get.back();
                              },
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
                            Text(
                              'Playground',
                              style: whiteTextBold.copyWith(fontSize: 24),
                            ),
                            Icon(
                              Icons.notifications,
                              color: Colors.white,
                              size: 30,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 250,
                        ),
                        Text(
                          'Ayo Bermain',
                          style: whiteText.copyWith(fontSize: 18),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        //TODO: Buat Permainan
                        Center(
                          child: Wrap(
                            runSpacing: 20,
                            spacing: 20,
                            runAlignment: WrapAlignment.spaceBetween,
                            children: List.generate(
                              6,
                              (index) => Container(
                                height: 170,
                                width: 170,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                        ),
                        // Container(
                        //   child: Expanded(
                        //     child: GridView.count(
                        //       crossAxisCount: 2,
                        //       children: <Widget>[
                        //         FlutterLogo(),
                        //         FlutterLogo(),
                        //         FlutterLogo(),
                        //         FlutterLogo(),
                        //       ],
                        //     ),
                        //   ),
                        // )
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
