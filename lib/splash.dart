//import 'package:flutter/material.dart';
//import 'package:splashscreen/splashscreen.dart';
//import 'first.dart';
//
//class Splash extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return new SplashScreen(
//      seconds: 5,
//      navigateAfterSeconds: new First(),
//      image: new Image.asset('images/ta_logo_final.png', width: 2000, height: 2000,),
//      loadingText:  Text('\t\tPowered By\nAbeyie Innovation Studios'),
//
//      );
//
//
//  }
//}


import 'dart:async';

import 'package:flutter/material.dart';
import 'first.dart';

class Splash extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => StartState();
}

class StartState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return initScreen(context);
  }


  @override
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() async {
    var duration = Duration(seconds: 10);
    return new Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) => First()
    )
    );
  }

  initScreen(BuildContext context) {

    return Scaffold(
//      backgroundColor: Colors.blueAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Image.asset("images/ta_logo_final.png"),
            ),
            Padding(padding: EdgeInsets.only(top: 20.0)),
            
            Padding(padding: EdgeInsets.only(top: 20.0)),
            CircularProgressIndicator(
              backgroundColor: Colors.white,
              strokeWidth: 1,
            ),

            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text(
                        'Powered by',
                        style: TextStyle(fontSize: 10, color: Colors.black54),
                      ),
                      Text(
                        'Abeyie Innovation Studios',
                        style: TextStyle(fontSize: 15, color: Colors.black54),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
