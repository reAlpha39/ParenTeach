import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parenteach/routes/login_binding.dart';
import 'package:parenteach/routes/route_name.dart';
import 'package:parenteach/routes/routes.dart';
import 'package:parenteach/utils/utils.dart';

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
