import 'dart:io';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:mime_type/mime_type.dart';
import 'package:http/http.dart' as http;
import 'package:modal_progress_hud/modal_progress_hud.dart';
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
  File fileToSubmit;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  String fileEmpty;
  String fileName;

  bool showSpinner = false;

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

  Future showUploadSuccess() async {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Report Added'),
            content: Text(
              'Thank you for saving a life, your case has been recorded',
              style: TextStyle(color: Colors.orangeAccent),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Back'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

  Future showSubmissionError() async {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Ooops'),
            content: Text(
              'There was a problem recording your case, please try again',
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
  File validateFile(File file) {

    if (file != null) {
      setState(() {
        fileEmpty = '';
      });
      String mimetype = mime(file.path);
      print(mimetype);
      List mimeArray = mimetype.split('/');
      if (mimeArray[0] != 'image' && mimeArray[0] != 'video') {
        showUploadError();
        print('Invalid File Type, Please Upload an image or video');
      } else if (file.lengthSync() > 100000000) {
        showFileSizeError();
      } else {
        setState(() {

          fileToSubmit = file;
          fileName = file.path.split('/').last;

        });
      }
    } else {
      print('No file uploaded');
      setState(() {
        fileEmpty = 'Please upload an image/video';
        fileName = '';
      });
    }

    return file;
  }

  void onFileUploadPressed() async {
    File file = await FilePicker.getFile();

    validateFile(file);
  }

  submitData() async {
    if (!formKey.currentState.validate()) {
      print('Failed Validation');
      return;
    }
    if (validateFile(fileToSubmit) != null) {
      formKey.currentState.save();
      setState(() {
        showSpinner = true;
      });
      final request = http.MultipartRequest('POST',
      Uri.parse('http://10.0.2.2:8000/api/report'));

      final finalFile = await http.MultipartFile.fromPath('media_url', fileToSubmit.path);

      request.files.add(finalFile);

      request.fields.addAll({
        'name': name,
        'email': email,
        'phone_number': phoneNumber,
        'location' : location,
        'description' : description
      });

      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200) {
        setState(() {
          showSpinner = false;
        });
        showUploadSuccess();
        nameController.clear();
        emailController.clear();
        phoneController.clear();
        locationController.clear();
        descriptionController.clear();
        setState(() {
          name = '';
          email = '';
          phoneNumber = '';
          location = '';
          description = '';
          fileToSubmit = null;
          fileName = '';
        });
      } else {
        print(response.statusCode);
        showSpinner = false;
        showSubmissionError();

//        nameController.clear();
//        emailController.clear();
//        phoneController.clear();
//        locationController.clear();
//        descriptionController.clear();
        setState(() {
          name = '';
          email = '';
          phoneNumber = '';
          location = '';
          description = '';
          fileToSubmit = null;
          fileName = '';
        });
      }
    }
    ;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: Text('Report Case'),
        actions: <Widget>[
          IconButton(

            icon: Icon(Icons.arrow_forward,
              color: Colors.white,),
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: ModalProgressHUD(inAsyncCall: showSpinner,
          child: ListView(
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
                          controller: nameController,
                          onSaved: (String value) {
                            setState(() {
                              name = value;
                            });
                          },
                          style: TextStyle(color: Colors.blue),
                          decoration: InputDecoration(
                              labelText: 'Name (Optional)',
                              labelStyle: TextStyle(color: Colors.orangeAccent)),
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        TextFormField(
                          controller: emailController,
                          onSaved: (String value) {
                            setState(() {
                              email = value;
                            });
                          },
                          style: TextStyle(color: Colors.blue),
                          decoration: InputDecoration(
                              labelText: 'Email (Optional)',
                              labelStyle: TextStyle(color: Colors.orangeAccent)),
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        TextFormField(
                          controller: phoneController,
                          onSaved: (String value) {
                            setState(() {
                              phoneNumber = value;
                            });
                          },
                          style: TextStyle(color: Colors.blue),
                          decoration: InputDecoration(
                              labelText: 'Phone Number (Optional)',
                              labelStyle: TextStyle(color: Colors.orangeAccent)),
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        TextFormField(
                          controller: locationController,
                          onSaved: (String value) {
                            setState(() {
                              location = value;
                            });
                          },
                          style: TextStyle(color: Colors.blue),
                          decoration: InputDecoration(
                              labelText: 'Location (Optional)',
                              labelStyle: TextStyle(color: Colors.orangeAccent)),
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        TextFormField(
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
                        fileEmpty != null
                            ? Text(
                          fileEmpty,
                          style: TextStyle(color: Colors.red),
                        )
                            : Text(''),

                        fileName != null ?
                        Text(fileName,
                          style: TextStyle(color: Colors.orangeAccent),
                        ) : Text(''),
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

//                        IconButton(
//                          padding: EdgeInsets.only(left: 270),
//                          onPressed: () {
//                            Navigator.pushNamed(context, '/education');
//                          },
//                          alignment: Alignment.bottomRight,
//                          icon: Icon(
//                            Icons.arrow_forward_ios,
//                            color: Colors.orangeAccent,
//                          ),
//                          iconSize: 40,
//                          color: Colors.white,
//                        ),
                      ],
                    ),
                  ))
            ],
          ),)
    );
  }
}
