import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parenteach/routes/route_name.dart';

import '../utils/utils.dart';
import '../widgets/custom_appbar.dart';

class BlogPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          WidgetsBinding.instance!.focusManager.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: CustomAppBar(
          enableLeading: true,
          title: 'Blog',
          isAdmin: false,
          backgroundColor: pinkColor,
          foregroundColor: Colors.white,
          route: RouteName.ADMINADDQNAPAGE,
        ),
        backgroundColor: greyBackgroundColor,
        body: Stack(
          children: [
            Container(
              width: Get.width,
              height: 160,
              child: Container(
                color: pinkColor,
                alignment: Alignment.topCenter,
                padding: const EdgeInsets.only(
                  bottom: 12,
                ),
                child: Image.asset(
                  'assets/Blog_bg.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 135,
                left: 32,
                right: 32,
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 14,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: Icon(
                            Icons.search_rounded,
                            color: pinkColor,
                          ),
                        ),
                        Container(
                          width: 250,
                          height: 20,
                          child: TextField(
                            decoration: InputDecoration.collapsed(
                              hintText: 'Cari blog di sini',
                              hintStyle: blackText.copyWith(
                                  color: Colors.grey, fontSize: 13),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: GestureDetector(
                        onTap: () {},
                        child: Icon(
                          Icons.keyboard_arrow_down,
                          color: Color(0xff909090),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              alignment: Alignment.topCenter,
              padding: EdgeInsets.only(
                top: 190,
                left: 20,
                right: 20,
              ),
              child: SingleChildScrollView(
                child: Column(
                  // Masih dummy
                  children: List.generate(
                    10,
                    (index) => buildBlogTile(
                      'ahsiausaushahsu ahsbauhs asbabs ba shbahsa s hasbhas a hasi',
                      '23 September 2020',
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBlogTile(String? title, String? date) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      'https://static.wikia.nocookie.net/onepiece/images/f/ff/Marshall_D._Teach_Anime_Post_Timeskip_Infobox.png/revision/latest?cb=20200112104542'),
                  fit: BoxFit.cover),
              borderRadius: BorderRadiusDirectional.horizontal(
                start: Radius.circular(10),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: blackTextBold,
                ),
                Text(
                  date!,
                  style: blackText.copyWith(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }
}
