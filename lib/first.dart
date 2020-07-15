import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class First extends StatelessWidget {

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
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    return MaterialApp(
      home: Scaffold(
        body: Container(
          color: Colors.white,
          child: ListView(
            children: <Widget>[
              Image.asset('images/ta_logo_final.png', height:  (height /10) * 3.5  ),
              Padding(

                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 15),
                child: Material(
                  elevation: 3.0,
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),

                  child: MaterialButton(

                    onPressed: () {
                      Navigator.pushNamed(context, '/abuse');
                    },
                    minWidth: 200,
                    height: (height / 10) * 1.2,
                    child: Text(
                      'Report an abuse',
                      style: TextStyle(fontWeight: FontWeight.normal,  fontSize: 20),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16,horizontal: 15),
                child: Material(
                  elevation: 3.0,
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/suspicious');
                    },
                    minWidth: 200,
                    height: (height / 10) * 1.2,
                    child: Text(
                      'Report a suspicious behavior',
                      style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16,horizontal: 15),
                child: Material(
                  elevation: 3.0,
                  color: Colors.white,
                  borderOnForeground: true,
                  borderRadius: BorderRadius.circular(25),
                  child: MaterialButton(
//              onPressed: submitData,
                    onPressed: _launchURL,
                    minWidth: 200,
                    height: (height / 10) * 1.2,
                    child: Text(
                      'Share your story',
                      style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
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
      )
    );
  }
}
