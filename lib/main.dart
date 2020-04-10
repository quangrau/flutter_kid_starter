import 'package:flutter/material.dart';
import 'package:flutterkutkit/screens/homeScreen.dart';
import 'package:flutterkutkit/screens/colorScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (context) => HomeScreen(),
        '/colors': (context) => ColorsScreen(),
        '/shapes': (context) => ColorsScreen(),
        '/abc': (context) => ColorsScreen(),
        '/counting': (context) => ColorsScreen(),
        '/stories': (context) => ColorsScreen(),
      },
    );
  }
}
