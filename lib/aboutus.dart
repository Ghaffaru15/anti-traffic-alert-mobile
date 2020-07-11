import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
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
        ),
        body: ListView(
          children: <Widget>[
            Image.asset('images/ta_logo_final.png'),
            Container(
              margin: EdgeInsets.all(10),
              child: Column(
                
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                Text('TRAFFIK ALERT is an innovative solution to be proactive in saving lives '
                    'from the horrid criminality of human trafficking, domestic violence '
                    'and modern slavery.'),
                  SizedBox(height: 10,),
                  Text('With this platform, you can anonymously and securely report suspicious '
                      'behaviors in order to prevent the incident from occuring. You can prevent the '
                      'incident from occurring. You can also report an abuse.'),

                  SizedBox(height: 15,),
                  Text('These reports help identify trends and patterns to prevent possible incidents, '
                      'but we advice you to contact your local enforcement authorities. '),


                  Center(child: FlatButton(child: Text('LEARN MORE'),)),
                  SizedBox(height: 10,),

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
              ],),
            )
          ],
        ),
      ),
    );
  }
}
