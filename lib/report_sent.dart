import 'package:flutter/material.dart';

class ReportSent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double heightSize = size.height;
    double widthSize = size.width;

    return Scaffold(

        appBar: AppBar(
          backgroundColor: Colors.orangeAccent,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: ListView(
          children: <Widget>[
            Image.asset('images/ta_logo_final.png', height: (heightSize / 10) * 3,),
            Center(

              child: Text('Report Sent', style: TextStyle(fontSize: 25),),
            ),
            SizedBox(height: (heightSize / 10) * 0.5,),
            Center(child: Text('That took a lot of courage')),
            Icon(Icons.check, color: Colors.green, size: 50,),
            SizedBox(height: (heightSize / 10) * 0.5,),
//            Center(child: Text('To give more details', style: TextStyle(fontSize: 20),)),
//            SizedBox(height: (heightSize / 10) * 0.2,),
//            Padding(
//              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
//              child: Material(
//                elevation: 4.0,
//                color: Colors.white,
//                borderRadius: BorderRadius.circular(15),
//                child: MaterialButton(
//                  minWidth: (widthSize / 5),
//                  height: 35,
//                  child: Text(
//                    'Fill the form',
//                    style: TextStyle(color: Colors.black, fontSize: 20),
//                  ),
//                ),
//              ),
//            ),
            SizedBox(height: (heightSize / 10) * 0.8,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text(
                      'Powered by',
                      style:
                      TextStyle(fontSize: 10, color: Colors.black54),
                    ),
                    Text(
                      'Abeyie Innovation Studios',
                      style:
                      TextStyle(fontSize: 15, color: Colors.black54),
                    )
                  ],
                )
              ],
            )
          ],
        ),


      );
//    );
  }
}
