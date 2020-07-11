import 'package:flutter/material.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Colors.orangeAccent,
          title: Text('Our Media'),
          actions: <Widget>[
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/aboutus');
              },
              icon: Icon(
                Icons.arrow_forward,
                color: Colors.white,
              ),
            )
          ],
        ),
        body: ListView(
          children: <Widget>[
            Image.asset('images/ta_logo_final.png'),
            Center(child: Text('Join the campaign', style: TextStyle(fontSize: 30),),),
            SizedBox(height: 10,),
            Center(child: Text('#exposeitendit'),),
            SizedBox(height: 5,),
            
            Image.asset('images/globe.png')
          ],
        ),
      ),
    );
  }
}
