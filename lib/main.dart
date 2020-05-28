import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body:Column(
          children: <Widget>[
            SizedBox(height: 80,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Welcome', style: TextStyle(fontSize: 30, color: Colors.orangeAccent),)
              ],
            ),
            SizedBox(height: 100,),
            Row(
              children: <Widget>[
                SizedBox(width: 20,),
                Container(
                  height: 120.0,
                  width: 2.0,
                  color: Colors.orangeAccent,
                  margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                ),
                Column(
                  children: <Widget>[
                    Text('Together', style: TextStyle(fontSize: 30),),
                    Text('We can', style: TextStyle(),),
                    Text('save lives')
                  ],
                )
              ],
            )

          ],
        ) ,
      )
    );
  }
}

