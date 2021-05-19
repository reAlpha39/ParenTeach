import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:parenteach/views/activities_page.dart';
import 'package:parenteach/views/home_page.dart';

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
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: ActivitiesPage(),
          );
        }
        return CircularProgressIndicator();
      },
    );
  }
}
