import 'package:flutter/material.dart';

class Education extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: Text('Education'),
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Row(
            children: <Widget>[
//              SizedBox(
//                width: 10,
//              ),
//              IconButton(
//                onPressed: () {
//                  Navigator.pushNamed(context, '/report');
//                },
//                alignment: Alignment.topLeft,
//                icon: Icon(
//                  Icons.arrow_back_ios,
//                  color: Colors.white,
//                ),
//                iconSize: 50,
//                color: Colors.white,
//              ),
            ],
          ),
//          Text(
//            'EDUCATION PAGE',
//            textAlign: TextAlign.center,
//            style: TextStyle(
//                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
//          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'This page will give you information on human trafficking safety tips',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 17,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                Text(
                  'Report any unusual activity to your local law enforcement agencies or uploadinformation on this portal.',
                  style: TextStyle(color: Colors.orangeAccent),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Do not engage in any conversation with anyone you are suspicious about.',
                  style: TextStyle(color: Colors.orangeAccent),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'If anyone makes sexual advances at you, report the person to trusted people or to you local law enforcement agencies. Alternatively, you can describe the incident on this portal.',
                  style: TextStyle(color: Colors.orangeAccent),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Do not meet up with strangers alone in unusual places. Try to meet up in public place where you can visibly see people around you. It is advisable to go with a trusted person especially if you are a minor.',
                  style: TextStyle(color: Colors.orangeAccent),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Do not engage in any form of sexual conversation via the internet with anyone especially if they are strangers.',
                  style: TextStyle(color: Colors.orangeAccent),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'If you are a minor (below 18) report all forms of abuse via the internet immediately to person you can trust. You can also report to your local law enforcement agencies Alternatively, describe the incident on this app.',
                  style: TextStyle(color: Colors.orangeAccent),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'If you notice any cases of abuse or you become a victim of abuse, do not be afraid to report the issue to a trusted person or your local law enforcement agency. Alternatively,describe the incident on this app.',
                  style: TextStyle(color: Colors.orangeAccent),
                )
              ],
            ),
            decoration: BoxDecoration(

                shape: BoxShape.rectangle, border: Border.all(width: 2, color: Colors.black),),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Material(
              elevation: 4.0,
              color: Colors.orangeAccent,
              borderRadius: BorderRadius.circular(20),
              child: MaterialButton(
                minWidth: 100,
                height: 42,
                child: Text(
                  'CONTACT US',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
