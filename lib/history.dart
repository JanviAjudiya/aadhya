import 'package:flutter/material.dart';

class history extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('History'),
        ),
        body: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(top: 200.0),
          child: Column(
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.history,
                  color: Colors.grey,
                ),
                onPressed: () {},
              ),
              Text("No History yet!",
                  style: TextStyle(color: Colors.grey, )),
            ],
          ),
        ),
      ),
    );
  }
}