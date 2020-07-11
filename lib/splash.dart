import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'first.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      seconds: 10,
      navigateAfterSeconds: new First(),
      image: new Image.asset('images/ta_logo_final.png', width: 2000, height: 2000,),
      loadingText:  Text('\t\tPowered By\nAbeyie Innovation Studios'),

      );


  }
}
