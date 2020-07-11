import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:file_picker/file_picker.dart';
import 'package:mime_type/mime_type.dart';
import 'dart:io';
import 'package:modal_progress_hud/modal_progress_hud.dart';
class Abuse extends StatefulWidget {
  @override
  _AbuseState createState() => _AbuseState();
}

class _AbuseState extends State<Abuse> {

  final GlobalKey<FormState> formKey = GlobalKey();

  String description;
  String fileEmpty;
  String fileName;
  File fileToSubmit;

  bool showSpinner = false;

  Future showUploadError() async {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('File Error'),
            content: Text(
              'Invalid file uploaded. Please Upload an Image, Video/Audio',
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

  Future showUploadVideoError() async {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('File Error'),
            content: Text(
              'Invalid file uploaded. Please Upload a Video or Audio',
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

  TextEditingController descriptionController = TextEditingController();
  File validateFile(File file) {
    if (file != null) {
      setState(() {
        fileEmpty = '';
      });
      String mimetype = mime(file.path);
      print(mimetype);
      List mimeArray = mimetype.split('/');
      if (mimeArray[0] != 'image' && mimeArray[0] != 'video' && mimeArray[0] != 'audio') {
        showUploadError();
        print('Invalid File Type, Please Upload an Image, Video or Audio');
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
        fileEmpty = 'Please upload an image/video/audio';
        fileName = '';
      });
    }

    return file;
  }

  File validateVideo(File file) {
    if (file != null) {
      setState(() {
        fileEmpty = '';
      });
      String mimetype = mime(file.path);
      print(mimetype);
      List mimeArray = mimetype.split('/');
      if (mimeArray[0] != 'video' && mimeArray[0] != 'audio') {
        showUploadVideoError();
        print('Invalid File Type, Please Upload a video or audio');
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

  void onVideoUploadPressed() async {
    File file = await FilePicker.getFile();

    validateVideo(file);
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
      final request = http.MultipartRequest(
          'POST', Uri.parse('http://10.0.2.2:8000/api/report'));

      final finalFile =
      await http.MultipartFile.fromPath('media_url', fileToSubmit.path);

      request.files.add(finalFile);

      request.fields.addAll({
        'description': description
      });

      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200) {
        setState(() {
          showSpinner = false;
        });
        showUploadSuccess();

        descriptionController.clear();
        setState(() {
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
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),

          ),
          backgroundColor: Colors.orangeAccent,
          title: Text('Report Abuse'),
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
        body: ModalProgressHUD(
          inAsyncCall: showSpinner,
          color: Colors.orangeAccent,
          child: ListView(
            children: <Widget>[
              Image.asset('images/ta_logo_final.png', height: 150,),
              Row(
                children: <Widget>[
                  SizedBox(width: 10,),
                  Text(
                    'Report an abuse ',
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
                        FlatButton (child: Image.asset(
                          'images/file_upload.png',
                          height: 60,
                          width: 60,
                        ),
                          onPressed: onFileUploadPressed,
                    ),


//                      SizedBox(
//                        width: 20,
//                      ),
//                      FlatButton(
//                          onPressed: onVideoUploadPressed,
//                          child: Image.asset(
//
//                        'images/file_music-upload-512.png',
//                        height: 50,
//                      ))
                      ],
                    ),

                    fileEmpty != null
                        ? Text(
                      fileEmpty,
                      style: TextStyle(color: Colors.red),
                    )
                        : Text(''),

                    fileName != null
                        ? Text(
                      fileName,
                      style: TextStyle(color: Colors.orangeAccent),
                    )
                        : Text(''),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      child: Material(
                        elevation: 4.0,
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        child: MaterialButton(
                          onPressed: submitData,
                          minWidth: 200,
                          height: 40,
                          child: Text(
                            'SUBMIT',
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
      ),
    );
  }
}
