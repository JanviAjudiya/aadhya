import 'package:flutter/material.dart';


class scan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Scan'),
        ),
        body: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(top: 200.0),
          child: Column(
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.no_photography_outlined,
                  color: Colors.grey,
                ),
                onPressed: () {},
              ),
              Text("Scan failed",
                  style: TextStyle(color: Colors.grey, fontSize: 12.0)),
              SizedBox(
                height: 10.0,
              ),
              Text("Looks like something went wrong",
                  style: TextStyle(color: Colors.grey, fontSize: 18.0)),
            ],
          ),
        ),
      ),
    );
  }
}