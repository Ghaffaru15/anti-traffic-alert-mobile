import 'dart:io';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:mime_type/mime_type.dart';
//
//import 'package:flutter_uploader/flutter_uploader.dart';

class Report extends StatefulWidget {
  @override
  _ReportState createState() => _ReportState();
}

class _ReportState extends State<Report> {
  final GlobalKey<FormState> formKey = GlobalKey();
  String name;
  String email;
  String phoneNumber;
  String location;
  String description;
  File file;

  Future showUploadError() async {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('File Error'),
            content: Text(
              'Invalid file uploaded. Please Upload File or Video',
              style: TextStyle(color: Colors.orangeAccent),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Ok'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

  Future showFileSizeError() async {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('File Error'),
            content: Text(
              'Huge file uploaded. Please Upload less than 100MB',
              style: TextStyle(color: Colors.orangeAccent),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Ok'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }
  void onFileUploadPressed() async {
    File file = await FilePicker.getFile();

    if (file.existsSync()) {
      String mimetype = mime(file.path);
      print(mimetype);
      List mimeArray = mimetype.split('/');
      if (mimeArray[0] != 'image' &&
          mimeArray[0] != 'video') {
        showUploadError();
        print('Invalid File Type, Please Upload an image or video');
      } else if (file.lengthSync() > 100) {
          showFileSizeError();
      }

    }
  }

  submitData() async {
    onFileUploadPressed();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: Text('Report Case'),
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
//          SizedBox(
//            height: size.height * 0.04,
//          ),
//          Row(
//            children: <Widget>[
//              SizedBox(
//                width: 10,
//              ),
//              IconButton(
//                onPressed: () {
//                  Navigator.pushNamed(context, '/');
//                },
//                alignment: Alignment.topLeft,
//                icon: Icon(
//                  Icons.arrow_back_ios,
//                  color: Colors.white,
//                ),
//                iconSize: 50,
//                color: Colors.white,
//              ),
//            ],
//          ),
          Container(
              padding: EdgeInsets.all(20),
              child: Form(
                key: formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      style: TextStyle(color: Colors.blue),
                      decoration: InputDecoration(

                          labelText: 'Name (Optional)',
                          labelStyle: TextStyle(color: Colors.orangeAccent)),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    TextFormField(
                      style: TextStyle(color: Colors.blue),
                      decoration: InputDecoration(

                          labelText: 'Email (Optional)',
                          labelStyle: TextStyle(color: Colors.orangeAccent)),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    TextFormField(
                      style: TextStyle(color: Colors.blue),
                      decoration: InputDecoration(
                          labelText: 'Phone Number (Optional)',
                          labelStyle: TextStyle(color: Colors.orangeAccent)),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    TextFormField(
                      style: TextStyle(color: Colors.blue),
                      decoration: InputDecoration(
                          labelText: 'Location (Optional)',
                          labelStyle: TextStyle(color: Colors.orangeAccent)),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    TextFormField(
                      style: TextStyle(color: Colors.blue),
                      maxLines: 4,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelStyle: TextStyle(color: Colors.orangeAccent),
                          labelText: 'Description'),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
//                Text('Upload Image/Video', style: TextStyle(color: Colors.white),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 8),
                          child: Material(

                            elevation: 2.0,
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            child: MaterialButton(
                              onPressed: onFileUploadPressed,
                              minWidth: 100,
                              height: 10,
                              child: Text(
                                'Upload Image/Video',
                                style: TextStyle(color: Colors.orangeAccent),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 30,
                        ),
//                        RaisedButton(
//                          color: Colors.white,
//                          child: Text(
//                            'Upload Video',
//                            style: TextStyle(color: Colors.white),
//                          ),
//                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      child: Material(

                        elevation: 4.0,
                        color: Colors.orangeAccent,
                        borderRadius: BorderRadius.circular(20),
                        child: MaterialButton(
                          onPressed: submitData,
                          minWidth: 200,
                          height: 42,
                          child: Text(
                            'SUBMIT',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),

                    IconButton(
                      padding: EdgeInsets.only(left: 270),
                      onPressed: () {
                        Navigator.pushNamed(context, '/education');
                      },
                      alignment: Alignment.bottomRight,
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.orangeAccent,
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
