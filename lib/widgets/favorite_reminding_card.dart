import 'package:flutter/material.dart';

import '../utils/utils.dart';

class FavoriteRemindingCard extends StatelessWidget {
  const FavoriteRemindingCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 195,
      width: 152,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 15),
            height: 20,
            child: Stack(
              children: [
                Container(
                  width: 130,
                  height: 20,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/yellow_tie.png'),
                        fit: BoxFit.cover),
                  ),
                  child: Center(
                    child: Text(
                      'Kesukaan mu lo',
                      style: whiteText.copyWith(fontSize: 11),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              'Sudahkah anda mengapresiasi anak anda hari ini?',
              style: blackTextBold,
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              margin: EdgeInsets.all(8),
              height: 20,
              child: Image.asset('assets/send_icon_pink.png'),
            ),
          )
        ],
      ),
    );
  }
}
