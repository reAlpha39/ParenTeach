import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:get/get.dart';
import '../routes/route_name.dart';

import '../utils/utils.dart';
import '../widgets/custom_appbar.dart';
// import 'package:intl/intl.dart' show DateFormat;

class KalenderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DateTime _currentDate = DateTime.now();

    return GestureDetector(
      onTap: () =>
          WidgetsBinding.instance!.focusManager.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: CustomAppBar(
          enableLeading: false,
          title: 'Kalender',
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
                  'assets/Calendar_bg.png',
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
                height: 70,
                width: Get.width,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Apa agenda kamu hari ini?',
                        style: blackText.copyWith(
                            fontSize: 14, color: Colors.grey),
                      ),
                      Text(
                        'Miftah',
                        style: blackTextBold.copyWith(
                            fontSize: 18, color: pinkColor),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.topCenter,
              padding: EdgeInsets.only(
                top: 220,
                left: 20,
                right: 20,
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                      ),
                      child: Text(
                        "tandai waktumu",
                        style: blackTextBold,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                      ),
                      child: CalendarCarousel<Event>(
                        onDayPressed: (DateTime date, List<Event> events) {
                          //take an action with date and its events
                        },
                        daysTextStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: blackTextBold.fontWeight,
                        ),
                        weekendTextStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: blackTextBold.fontWeight,
                        ),
                        weekdayTextStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: blackTextBold.fontWeight),
                        thisMonthDayBorderColor: Colors.grey,
                        headerTextStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: blackTextBold.fontWeight,
                        ),
                        weekFormat: false,
                        markedDatesMap: _markedDateMap,
                        height: Get.height / 2.1,
                        selectedDateTime: _currentDate,
                        showIconBehindDayText: true,
                        isScrollable: false,
                        markedDateShowIcon: true,
                        selectedDayTextStyle: TextStyle(
                          color: Colors.white,
                        ),
                        todayTextStyle: TextStyle(
                          color: Colors.blue,
                        ),
                        markedDateIconBuilder: (event) {
                          return event.icon ?? Icon(Icons.help_outline);
                        },
                        minSelectedDate:
                            _currentDate.subtract(Duration(days: 360)),
                        maxSelectedDate: _currentDate.add(Duration(days: 360)),
                        todayButtonColor: Colors.transparent,
                        todayBorderColor: Colors.green,
                        markedDateMoreShowTotal: true,
                      ),
                    ),
                    Column(
                      // Masih dummy
                      children: List.generate(
                        2,
                        (index) => buildKalenderTile(
                            'Belanja', '23 September 2020', Colors.yellow[700]),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _eventIcon = Container(
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.all(Radius.circular(1000)),
      ),
      child: null);
  static Widget _eventIcon2 = Container(
      decoration: BoxDecoration(
        color: Colors.yellow[700],
        borderRadius: BorderRadius.all(Radius.circular(1000)),
      ),
      child: null);
  static Widget _eventIcon3 = Container(
      decoration: BoxDecoration(
        color: Colors.cyan,
        borderRadius: BorderRadius.all(Radius.circular(1000)),
      ),
      child: null);

  final EventList<Event> _markedDateMap = new EventList<Event>(
    events: {
      new DateTime(2021, 7, 10): [
        new Event(
          date: new DateTime(2021, 7, 10),
          title: 'Event 1',
          icon: _eventIcon,
        ),
      ],
      new DateTime(2021, 7, 12): [
        new Event(
          date: new DateTime(2021, 7, 12),
          title: 'Event 1',
          icon: _eventIcon2,
        ),
      ],
      new DateTime(2021, 7, 29): [
        new Event(
          date: new DateTime(2021, 7, 29),
          title: 'Event 1',
          icon: _eventIcon3,
        ),
      ],
    },
  );

  Widget buildKalenderTile(String? title, String? date, Color? dot) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              height: 15,
              width: 15,
              decoration: BoxDecoration(
                color: dot,
                borderRadius: BorderRadius.circular(15),
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
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Text(
                    title!,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: blackTextBold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Text(
                    date!,
                    style: blackText.copyWith(
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
