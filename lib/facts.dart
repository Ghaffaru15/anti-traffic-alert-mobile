import 'package:flutter/material.dart';
//import 'package:url_launcher/url_launcher.dart';

class Fact extends StatelessWidget {
//  _launchURL() async {
//    const url = 'https://flutter.dev';
//    if (await canLaunch(url)) {
//      await launch(url);
//    } else {
//      throw 'Could not launch $url';
//    }
//  }

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
          title: Text('Education'),
          actions: <Widget>[
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/about');
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
            Center(child: Text('Know the facts', style: TextStyle(fontSize: 30),),),
            SizedBox(height: 10,),
            Container(
              margin: EdgeInsets.only(right: 15, left: 15),
              child: Column(children: <Widget>[
                Text('This is our education page'),
                SizedBox(height: 3,),
                Text("Don't be in the dark about the signs, myths and facts "),
                SizedBox(height: 3,),
                Text("about domestic violence and modern slavery")
              ],)
            ),
            SizedBox(height: 15,),
            Center(child:
            Text('HOW TO IDENTIFY A TRAFFICKING IN PERSONS CASE', ),),
    SizedBox(height: 5,),
            Center(child: Text('Potential Victim: '),),

            SizedBox(height: 5,),
            Center(child: Text('§ Living with employer ', ),),

            SizedBox(height: 5,),
            Center(child: Text('§ Poor living conditions ', ),),

            SizedBox(height: 5,),
            Center(child: Text('§ Inability to speak to people alone ', ),),

            SizedBox(height: 5,),
            Center(child: Text('§ Submissive and fearful ', ),),

            SizedBox(height: 5,),
            Center(child: Text('§ Under 18 and in prostitution ', ),),

            SizedBox(height: 5,),
            Center(child: Text('§ Very little to no pay ', ),),

            Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Material(
                elevation: 4.0,
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                child: MaterialButton(
                  onPressed: () {
//                    onPressed: _launchURL;
                  },
                  minWidth: 200,
                  height: 40,
                  child: Text(
                    'LEARN MORE',
                    style: TextStyle(color: Colors.black, fontSize: 25),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
