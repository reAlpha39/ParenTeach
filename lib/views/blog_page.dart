import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BlogPage extends StatelessWidget {
  const BlogPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: Get.height / 2,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        'https://imgx.parapuan.co/file/parapuan/mobile/crop/0x0:0x0/360x240/photo/2021/04/04/pexels-alexander-suhorucov-64575-20210404075011.jpg'),
                    fit: BoxFit.cover),
              ),
            ),
            Container(
              height: Get.height / 2 + 100,
              margin: EdgeInsets.only(top: Get.height / 2 - 100),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
