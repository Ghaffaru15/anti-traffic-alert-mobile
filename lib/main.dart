import 'package:flutter/material.dart';
import './welcome.dart';
import './report.dart';
import './education.dart';
import 'splash.dart';
import 'abuse.dart';
import 'suspicious.dart';
import 'facts.dart';
import 'about.dart';
import 'aboutus.dart';
import 'report_sent.dart';
import 'first.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return
    MaterialApp(
      debugShowCheckedModeBanner: false,

      initialRoute: '/splash',
      routes: {
//        '/': (context) => Welcome(),
        '/': (context) => First(),
        '/splash' : (context) => Splash(),
        '/report': (context) => Report(),
        '/education': (context) => Education(),
        '/abuse' : (context) => Abuse(),
        '/suspicious': (context) => Suspicious(),
        '/fact' : (context) => Fact(),
        '/about' : (context) => About(),
        '/aboutus' : (context) => AboutUs(),
        '/report_sent': (context) => ReportSent(),
      },
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute(
            builder: (BuildContext context) => ReportSent());
      },
    );
  }
}
