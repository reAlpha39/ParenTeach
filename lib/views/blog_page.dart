import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/theme.dart';

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
              height: Get.height / 2 + 150,
              margin: EdgeInsets.only(top: Get.height / 2 - 150),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Apa itu parenting?',
                        style: blackTextBold,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Tanggal',
                        style: blackTextBold,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Parenting adalah cara mengasuh dan mendidik anak. Anda tentu sudah sangat sering mendengar istilah ini kehidupan sehari-hari. Namun, sudah tepatkah pemahaman Anda tentang konsep parenting itu sendiri? Berikut penjelasan singkat tentang pengertian parenting beserta jenis-jenisnya.',
                        style: blackText,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Parenting adalah cara mengasuh dan mendidik anak. Anda tentu sudah sangat sering mendengar istilah ini kehidupan sehari-hari. Namun, sudah tepatkah pemahaman Anda tentang konsep parenting itu sendiri? Berikut penjelasan singkat tentang pengertian parenting beserta jenis-jenisnya.',
                        style: blackText,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Parenting adalah cara mengasuh dan mendidik anak. Anda tentu sudah sangat sering mendengar istilah ini kehidupan sehari-hari. Namun, sudah tepatkah pemahaman Anda tentang konsep parenting itu sendiri? Berikut penjelasan singkat tentang pengertian parenting beserta jenis-jenisnya.',
                        style: blackText,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Parenting adalah cara mengasuh dan mendidik anak. Anda tentu sudah sangat sering mendengar istilah ini kehidupan sehari-hari. Namun, sudah tepatkah pemahaman Anda tentang konsep parenting itu sendiri? Berikut penjelasan singkat tentang pengertian parenting beserta jenis-jenisnya.',
                        style: blackText,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Parenting adalah cara mengasuh dan mendidik anak. Anda tentu sudah sangat sering mendengar istilah ini kehidupan sehari-hari. Namun, sudah tepatkah pemahaman Anda tentang konsep parenting itu sendiri? Berikut penjelasan singkat tentang pengertian parenting beserta jenis-jenisnya.',
                        style: blackText,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Parenting adalah cara mengasuh dan mendidik anak. Anda tentu sudah sangat sering mendengar istilah ini kehidupan sehari-hari. Namun, sudah tepatkah pemahaman Anda tentang konsep parenting itu sendiri? Berikut penjelasan singkat tentang pengertian parenting beserta jenis-jenisnya.',
                        style: blackText,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Parenting adalah cara mengasuh dan mendidik anak. Anda tentu sudah sangat sering mendengar istilah ini kehidupan sehari-hari. Namun, sudah tepatkah pemahaman Anda tentang konsep parenting itu sendiri? Berikut penjelasan singkat tentang pengertian parenting beserta jenis-jenisnya.',
                        style: blackText,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        elevation: 0,
        backgroundColor: pinkColor,
        child: Container(
            width: 30, height: 30, child: Image.asset('assets/send.png')),
      ),
    );
  }
}
