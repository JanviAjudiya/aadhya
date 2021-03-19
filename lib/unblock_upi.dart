import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Unblock UPI ID'),
        ),
        body: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(top: 200.0),
          child: Column(
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.sentiment_satisfied_outlined,
                  color: Colors.grey,
                ),
                onPressed: () {},
              ),
              Text("You're staying away from spam!\nNo blocked UPI IDs available",
                  style: TextStyle(color: Colors.grey, )),
            ],
          ),
        ),
      ),
    );
  }
}