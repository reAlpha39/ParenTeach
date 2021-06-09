import 'package:get/get.dart';
import 'package:parenteach/routes/login_binding.dart';
import 'package:parenteach/routes/route_name.dart';
import 'package:parenteach/views/views.dart';

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
  ];
}
