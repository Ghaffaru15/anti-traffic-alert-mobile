import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'package:url_launcher/url_launcher.dart';


//_launchURL(String url) {
//  launch(url);
//}

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
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
            Image.asset('images/ta_logo_final.png', height: 170,),
            Center(child: Text('Join the campaign', style: TextStyle(fontSize: 20),),),
            SizedBox(height: 10,),
            Center(child: Text('#exposeitendit'),),
            SizedBox(height: 3,),
            IconButton(

              // Use the FontAwesomeIcons class for the IconData
              icon: FaIcon(FontAwesomeIcons.globe),
              onPressed: () {  }
            ),
            SizedBox(height: 3,),
            IconButton(

          // Use the FontAwesomeIcons class for the IconData
                icon: FaIcon(FontAwesomeIcons.facebook),
                onPressed: () { print('Pressed'); }

        ),
            SizedBox(height: 3,),
            IconButton(
              icon: FaIcon(FontAwesomeIcons.twitter),
              onPressed: () {print('Pressed'); },
            ),
            SizedBox(height: 3,),
            IconButton(
              icon: FaIcon(FontAwesomeIcons.instagram),
              onPressed: () {print('Pressed'); },
            ),

            SizedBox(height: 3,),
            IconButton(
              icon: FaIcon(FontAwesomeIcons.linkedin),
              onPressed: () {print('Pressed'); },
            ),

            SizedBox(height: 3,),
            IconButton(
              icon: FaIcon(FontAwesomeIcons.youtube),
              onPressed: () {print('Pressed'); },
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text('Powered by', style: TextStyle(fontSize: 10, color: Colors.black54),),
                    Text('Abeyie Innovation Studios', style: TextStyle(fontSize: 15, color: Colors.black54),)
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
