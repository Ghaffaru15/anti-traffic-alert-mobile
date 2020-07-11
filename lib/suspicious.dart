import 'package:flutter/material.dart';

class Suspicious extends StatefulWidget {
  @override
  _SuspiciousState createState() => _SuspiciousState();
}

class _SuspiciousState extends State<Suspicious> {

  final GlobalKey<FormState> formKey = GlobalKey();

  String description;

  TextEditingController descriptionController = TextEditingController();

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
          title: Text('Report Suspicion'),
          actions: <Widget>[
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/fact');
              },
              icon: Icon(
                Icons.arrow_forward,
                color: Colors.white,
              ),
            )
          ],
        ),
        backgroundColor: Colors.white,
        body: ListView(
          children: <Widget>[
            Image.asset('images/ta_logo_final.png', height: 150,),
            Row(
              children: <Widget>[
                SizedBox(width: 10,),
                Text(
                  'Report a suspicious behavior',
                  style: TextStyle(color: Colors.black54, fontSize: 20),
                ),
                Icon(Icons.error),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(children: <Widget>[
              SizedBox(width: 10,),
              Text('Describe what you have seen, heard or experienced'),
            ],),
            SizedBox(
              height: 20,
            ),
            Form(

              key: formKey,
              child: Column(

                children: <Widget>[

                  Container(
                    margin: EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: descriptionController,
                      onSaved: (String value) {
                        setState(() {
                          description = value;
                        });
                      },
                      validator: (String description) {
                        if (description.isEmpty) {
                          return 'The description field is required';
                        }
                      },
                      style: TextStyle(color: Colors.black),
                      maxLines: 4,
                      decoration: InputDecoration(

                          border: OutlineInputBorder(),

                          labelStyle: TextStyle(color: Colors.black),
                          labelText: 'Description'),
                    ),
                  ),

                  SizedBox(
                    height: 20,
                  ),
                  Text(
                      'Do you have a video, image or audio to attach ? Upload here'),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
//                    SizedBox(width: 20),
                      Image.asset(
                        'images/images.png',
                        height: 50,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Image.asset(
                        'images/file_music-upload-512.png',
                        height: 50,
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Material(
                      elevation: 4.0,
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      child: MaterialButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/abuse');
                        },
                        minWidth: 200,
                        height: 40,
                        child: Text(
                          'Report an Abuse',
                          style: TextStyle(color: Colors.black, fontSize: 25),
                        ),
                      ),
                    ),
                  ),



                ],
              ),
            ),
            SizedBox(height: 20,),
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
