import 'package:flutter/material.dart';

class ViewPage extends StatelessWidget {
  var date;
  var picture;
  var amount;
  var long;
  var lat;
  ViewPage(
      {Key? key, this.amount, this.date, this.lat, this.long, this.picture})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("View Post"),
        ),
        body: Center(
            child: Column(
          children: [
            Text(
              date,
              style: TextStyle(fontSize: 25),
            ),
            SizedBox(height: 100),
            Image.network(
              picture,
              height: 300,
              width: 300,
            ),
            Text(
              '$amount Pieces Of Waste',
              style: TextStyle(fontSize: 25),
            ),
            SizedBox(height: 100),
            Text(
              '($long, $lat)',
              style: TextStyle(fontSize: 25),
            ),
          ],
        )));
  }
}
