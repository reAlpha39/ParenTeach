import 'package:get/get.dart';

import '../views/reminding_page.dart';
import '../views/views.dart';
import 'login_binding.dart';
import 'route_name.dart';

class Routes {
  static final route = [
    GetPage(
      name: routeName.reverse[RouteName.LOGINPAGE]!,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: routeName.reverse[RouteName.HOMEPAGE]!,
      page: () => HomePage(),
    ),
    GetPage(
      name: routeName.reverse[RouteName.PLAYGROUNDPAGE]!,
      page: () => PlaygroundPage(),
    ),
    GetPage(
      name: routeName.reverse[RouteName.ACTIVITIESPAGE]!,
      page: () => ActivitiesPage(),
    ),
    GetPage(
      name: routeName.reverse[RouteName.BLOGPAGE]!,
      page: () => BlogPage(),
    ),
    GetPage(
      name: routeName.reverse[RouteName.REMINDINGPAGE]!,
      page: () => RemindingPage(),
    ),
    GetPage(
      name: routeName.reverse[RouteName.QNAPAGE]!,
      page: () => QnaPage(),
    ),
  ];
}
