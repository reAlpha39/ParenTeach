import 'package:get/get.dart';
import 'package:parenteach/routes/login_binding.dart';
import 'package:parenteach/routes/route_name.dart';
import 'package:parenteach/views/home_page.dart';
import 'package:parenteach/views/login_page.dart';

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
  ];
}
