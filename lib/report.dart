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
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 10,
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
                SizedBox(height: 10,),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Email (Optional)',
                      labelStyle: TextStyle(color: Colors.white)),
                ),
                SizedBox(height: 10,),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Phone Number (Optional)',
                      labelStyle: TextStyle(color: Colors.white)),
                ),
                SizedBox(height: 10,),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Location (Optional)',
                      labelStyle: TextStyle(color: Colors.white)),
                ),
                SizedBox(height: 10,),
            TextFormField(
                    maxLines: 4,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelStyle: TextStyle(color: Colors.white),
                        labelText: 'Description'),
                  ),
                SizedBox(height: 15,),
//                Text('Upload Image/Video', style: TextStyle(color: Colors.white),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                      color: Colors.white,
                      child: Text('Upload Image', style: TextStyle(color: Colors.white),),
                    ),
                    SizedBox(width: 30,),
                    RaisedButton(
                      color: Colors.white,
                      child: Text('Upload Video', style: TextStyle(color: Colors.white),),
                    )
                  ],
                ),
                MaterialButton(

                  child: Text('SUBMIT'),
                ),

                IconButton(
                  padding: EdgeInsets.only(left: 300),
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
//          Form(
//              key: formKey,
//              child: Column(
//                crossAxisAlignment: CrossAxisAlignment.start,
////                padding: EdgeInsets.all(30),
//                children: <Widget>[
//                  Row(
//                    children: <Widget>[
//                      SizedBox(
//                        width: 10,
//                      ),
//                      TextFormField(
//                          style: TextStyle(color: Colors.white),
//                          decoration: InputDecoration(
//                            labelText: 'Name (Optional)',
//                            labelStyle: TextStyle(color: Colors.white),
//                          )),
//                    ],
//                  ),
//                  SizedBox(
//                    height: 30,
//                  ),
//                  TextFormField(
//                      style: TextStyle(color: Colors.white),
//                      decoration: InputDecoration(
//                        labelText: 'Email (Optional)',
//                        labelStyle: TextStyle(color: Colors.white),
//                      )),
//                  SizedBox(
//                    height: 30,
//                  ),
//                  TextFormField(
//                      style: TextStyle(color: Colors.white),
//                      decoration: InputDecoration(
//                        labelText: 'Phone Number (Optional)',
//                        labelStyle: TextStyle(color: Colors.white),
//                      )),
//                  SizedBox(
//                    height: 30,
//                  ),
//                  TextFormField(
//                      style: TextStyle(color: Colors.white),
//                      decoration: InputDecoration(
//                        labelText: 'Location (Optional)',
//                        labelStyle: TextStyle(color: Colors.white),
//                      )),
//                  SizedBox(
//                    height: 30,
//                  ),
//                  TextFormField(
//                    maxLines: 7,
//                    decoration: InputDecoration(
//                        border: OutlineInputBorder(),
//                        labelStyle: TextStyle(color: Colors.white),
//                        labelText: 'Description'),
//                  )
//                ],
//              )),
        ],
      ),
    );
  }
}
