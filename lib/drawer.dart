import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'abuse.dart';
import 'suspicious.dart';
import 'facts.dart';
import 'about.dart';
import 'aboutus.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class AppDrawer extends StatelessWidget {

  _launchURL() async {
    print('hit');
    const url = 'https://traffikalert.com/#contact-section';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _createHeader(),
          _createDrawerItem(
              icon: FontAwesomeIcons.infoCircle,
              text: ' Report an Abuse',
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (BuildContext context) => new Abuse()));

//                Navigator.pushReplacementNamed(context, '/abuse');
              }
              ),
          _createDrawerItem(
            icon: FontAwesomeIcons.infoCircle,
            text: ' Report a Suspicion',
            onTap: () {
              Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (BuildContext context) => Suspicious()));
            }
          ),
          _createDrawerItem(
            icon: FontAwesomeIcons.shareAlt,
            text: ' Share your story',
            onTap: () {
              _launchURL();
            }
          ),
          Divider(
            color: Colors.orangeAccent,
          ),
          _createDrawerItem(
            icon: FontAwesomeIcons.book,
            text: ' Know the facts',
            onTap: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => Fact()));
            }
          ),
          _createDrawerItem(
            icon: FontAwesomeIcons.users,
            text: ' Join the campaign',
            onTap: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => About()));
            }
          ),
          Divider(
            color: Colors.orangeAccent,
          ),
          _createDrawerItem(
            icon: FontAwesomeIcons.info,
            text: ' About Us',
            onTap: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => AboutUs()));
            }
          ),
        ],
      ),
    );
  }
}

Widget _createHeader() {
  return DrawerHeader(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(

          image: DecorationImage(

              fit: BoxFit.fill, image: AssetImage('images/ta_logo_final.png'))),
      child: Stack(children: <Widget>[
        Positioned(
            bottom: 12.0,
            left: 16.0,
            child: Text("Traffik Alert",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500))),
      ]));
}

Widget _createDrawerItem(
    {IconData icon, String text, GestureTapCallback onTap}) {
  return ListTile(
    title: Row(
      children: <Widget>[
        Icon(icon),
        Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Text(text),
        )
      ],
    ),
    onTap: onTap,
  );
}
