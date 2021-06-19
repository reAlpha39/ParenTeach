import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'routes/login_binding.dart';
import 'routes/route_name.dart';
import 'routes/routes.dart';
import 'utils/utils.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Parenteach',
      getPages: Routes.route,
      initialRoute: routeName.reverse[RouteName.LOGINPAGE],
      initialBinding: LoginBinding(),
      theme: ThemeData(
        primarySwatch: customMaterialColor(pinkColor),
      ),
    );
  }
}
