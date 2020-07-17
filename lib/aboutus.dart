import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'drawer.dart';

_launchURL() async {

  const url = 'https://traffikalert.com/#about-section';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

class AboutUs extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double heightSize = size.height;
    return MaterialApp(

      home: Scaffold(
        drawer: AppDrawer(),
        appBar: AppBar(
//          leading: IconButton(
//            icon: Icon(Icons.arrow_back, color: Colors.white),
//            onPressed: () => Navigator.of(context).pop(),
//          ),
          backgroundColor: Colors.orangeAccent,
        ),
        body: ListView(
          children: <Widget>[
            Image.asset(
              'images/ta_logo_final.png',
              height: (heightSize / 10) * 2,
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(
                      child: Text(
                    'About Us',
                    style: TextStyle(fontSize: 25),
                  )),
                  Center(
                    child: Text('TRAFFIK ALERT is an innovative '),
                  ),
                  SizedBox(height: 3,),
                  Center(
                    child: Text('solution to be proactive in saving lives '),
                  ),
                  SizedBox(height: 3,),
                  Center(
                    child: Text('from the horrid criminality of human '),
                  ),
                  SizedBox(height: 3,),
                  Center(
                    child: Text('trafficking, domestic violence '
                        'and modern slavery.'),
                  ),
                  SizedBox(height: 3,),

                  Center(
                    child: Text('With this platform, you can '),
                  ),
                  SizedBox(height: 3,),
                  Center(
                    child: Text(' anonymously and securely report '),
                  ),
                  SizedBox(height: 3,),
                  Center(
                    child: Text('suspicious behaviors in order to '),
                  ),
                  SizedBox(height: 3,),
                  Center(
                    child: Text('prevent the incident from occuring. '),
                  ),
                  SizedBox(height: 3,),
                  Center(
                    child: Text('You can also report an abuse.'),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  SizedBox(height: 3,),
                  Center(
                    child: Text('These reports help identify trends and '),
                  ),SizedBox(height: 3,),
                  Center(
                    child: Text('patterns to prevent possible incidents, '),
                  ),SizedBox(height: 3,),
                  Center(
                    child: Text('but we advise you to contact your local '),
                  ),SizedBox(height: 3,),
                  Center(
                    child: Text('law enforcement authorities'),
                  ),SizedBox(height: 3,),
                  Center(
                      child: FlatButton(
                        onPressed: _launchURL,
                    child: Text('LEARN MORE'),
                  )),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Text(
                            'Powered by',
                            style:
                                TextStyle(fontSize: 10, color: Colors.black54),
                          ),
                          Text(
                            'Abeyie Innovation Studios',
                            style:
                                TextStyle(fontSize: 15, color: Colors.black54),
                          )
                        ],
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
