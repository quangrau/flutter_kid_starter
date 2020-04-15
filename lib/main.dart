import 'package:flutter/material.dart';
import 'package:flutterkutkit/constant.dart';
import 'package:flutterkutkit/screens/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kid Starter',
      theme: ThemeData(
        scaffoldBackgroundColor: kBackgroundColor,
        fontFamily: "CabinSketch",
        textTheme: TextTheme(
          body1: TextStyle(color: kBodyTextColor),
        ),
      ),
      home: HomeScreen(),
    );
  }
}
