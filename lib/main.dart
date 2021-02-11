import 'package:flutter/material.dart';
import 'package:isj_mobility/screens/LoginTest.dart';
import 'package:isj_mobility/screens/login.dart';
import 'package:isj_mobility/screens/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ISJ MOBILITY',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.transparent,
      ),
      debugShowCheckedModeBanner: false,
      home: new Login(),
    );
  }
}

