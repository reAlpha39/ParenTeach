import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:parenteach/routes/login_binding.dart';
import 'package:parenteach/routes/route_name.dart';
import 'package:parenteach/routes/routes.dart';
import 'package:parenteach/utils/theme.dart';
import 'package:parenteach/utils/utils.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> init = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: init,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Error goes here');
        }
        if (snapshot.connectionState == ConnectionState.done) {
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
        return CircularProgressIndicator();
      },
    );
  }
}
