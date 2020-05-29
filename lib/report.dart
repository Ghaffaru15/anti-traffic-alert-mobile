import 'package:flutter/material.dart';
//import 'package:flutter_uploader/flutter_uploader.dart';

class Report extends StatefulWidget {
  @override
  _ReportState createState() => _ReportState();
}

class _ReportState extends State<Report> {
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: size.height * 0.04,
          ),
          Row(
            children: <Widget>[
              SizedBox(
                width: 10,
              ),
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/');
                },
                alignment: Alignment.topLeft,
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
                iconSize: 50,
                color: Colors.white,
              ),
            ],
          ),
          Container(
              padding: EdgeInsets.all(20),
              child: Form(
                key: formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Name (Optional)',
                          labelStyle: TextStyle(color: Colors.white)),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Email (Optional)',
                          labelStyle: TextStyle(color: Colors.white)),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Phone Number (Optional)',
                          labelStyle: TextStyle(color: Colors.white)),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Location (Optional)',
                          labelStyle: TextStyle(color: Colors.white)),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    TextFormField(
                      maxLines: 4,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelStyle: TextStyle(color: Colors.white),
                          labelText: 'Description'),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
//                Text('Upload Image/Video', style: TextStyle(color: Colors.white),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RaisedButton(
                          color: Colors.white,
                          child: Text(
                            'Upload Image',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        RaisedButton(
                          color: Colors.white,
                          child: Text(
                            'Upload Video',
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      ],
                    ),
                    MaterialButton(
                      child: Text('SUBMIT'),
                    ),

                    IconButton(
                      padding: EdgeInsets.only(left: 270),
                      onPressed: () {
                        Navigator.pushNamed(context, '/education');
                      },
                      alignment: Alignment.bottomRight,
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                      ),
                      iconSize: 50,
                      color: Colors.white,
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
