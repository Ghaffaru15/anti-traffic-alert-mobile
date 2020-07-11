import 'package:flutter/material.dart';

class First extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            Image.asset('images/ta_logo_final.png'),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Material(
                elevation: 4.0,
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/abuse');
                  },
                  minWidth: 200,
                  height: 70,
                  child: Text(
                    'Report an Abuse',
                    style: TextStyle(color: Colors.black, fontSize: 25),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Material(
                elevation: 4.0,
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/suspicious');
                  },
                  minWidth: 200,
                  height: 70,
                  child: Text(
                    'Report a Suspicious Behavior',
                    style: TextStyle(color: Colors.black, fontSize: 25),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Material(
                elevation: 4.0,
                color: Colors.white,
                borderOnForeground: true,
                borderRadius: BorderRadius.circular(25),
                child: MaterialButton(
//              onPressed: submitData,
                  minWidth: 200,
                  height: 70,
                  child: Text(
                    'Share your story',
                    style: TextStyle(color: Colors.black, fontSize: 25),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
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
            )
          ],
        ),
      ),
    );
  }
}
