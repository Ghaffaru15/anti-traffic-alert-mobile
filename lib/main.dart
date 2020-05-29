import 'package:flutter/material.dart';
import './welcome.dart';
import './report.dart';
import './education.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      initialRoute: '/',
      routes: {
        '/': (context) => Welcome(),
        '/report': (context) => Report(),
        '/education': (context) => Education()
      },
    );
  }
}
