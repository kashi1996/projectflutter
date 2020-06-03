import 'package:flutter/material.dart';
import 'package:testingcode/Screens/LandingPage.dart';

import 'Services/Auth.dart';
//import 'package:testingcode/app_sign_in.dart';
//import 'package:testingcode/LandingPage.dart';
//import 'package: testingcode/app-sign-in.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Time Tracker',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        backgroundColor: Colors.red,
        accentColor: Colors.green,

      ),
      home: LandingPage(
        auth: Auth(),
      ),
    );
  }
}