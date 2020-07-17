import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:url_launcher/url_launcher.dart';
import 'drawer.dart';

_launchWebURL() async {
  print('hit');
  const url = 'https://abeyiestudios.com';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchFbURL() async {
  print('hit');
  const url = 'https://facebook.com/abeyieis';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchTwitterURL() async {
  print('hit');
  const url = 'https://twitter.com/abeyieis';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchIGURL() async {
  print('hit');
  const url = 'https://instagram.com/abeyieis';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
_launchYouTubeURL() async {
  print('hit');
  const url = 'https://www.youtube.com/channel/UCGmsn7RFlw6vc4vOZunrQJA';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
_launchLinkedInURL() async {
  print('hit');
  const url = 'https://linkedin.com/company/abeyieinnovationstudios';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: Scaffold(
        drawer: AppDrawer(),
        appBar: AppBar(
//          leading: IconButton(
//            icon: Icon(Icons.arrow_back, color: Colors.white),
//            onPressed: () => Navigator.of(context).pop(),
//          ),
          backgroundColor: Colors.orangeAccent,
          title: Text('Our Media'),
//          actions: <Widget>[
//            IconButton(
//              onPressed: () {
//                Navigator.pushNamed(context, '/aboutus');
//              },
//              icon: Icon(
//                Icons.arrow_forward,
//                color: Colors.white,
//              ),
//            )
//          ],
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
              onPressed: _launchWebURL
            ),
            SizedBox(height: 3,),
            IconButton(

          // Use the FontAwesomeIcons class for the IconData
                icon: FaIcon(FontAwesomeIcons.facebook),
                onPressed: _launchFbURL

        ),
            SizedBox(height: 3,),
            IconButton(
              icon: FaIcon(FontAwesomeIcons.twitter),
              onPressed: _launchTwitterURL
            ),
            SizedBox(height: 3,),
            IconButton(
              icon: FaIcon(FontAwesomeIcons.instagram),
              onPressed: _launchIGURL
            ),

            SizedBox(height: 3,),
            IconButton(
              icon: FaIcon(FontAwesomeIcons.linkedin),
              onPressed: _launchLinkedInURL
            ),

            SizedBox(height: 3,),
            IconButton(
              icon: FaIcon(FontAwesomeIcons.youtube),
              onPressed: _launchYouTubeURL
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column (
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
