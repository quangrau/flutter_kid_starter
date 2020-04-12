import 'package:flutter/material.dart';
import 'package:flutterkutkit/screens/alphabets.dart';
import 'package:flutterkutkit/screens/colors.dart';
import 'package:flutterkutkit/screens/counting.dart';
import 'package:flutterkutkit/screens/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (context) => HomeScreen(),
        '/abc': (context) => AlphabetsScreen(),
        '/colors': (context) => ColorsScreen(),
        '/counting': (context) => CountingScreen(),
        '/shapes': (context) => ColorsScreen(),
        '/stories': (context) => ColorsScreen(),
      },
    );
  }
}
