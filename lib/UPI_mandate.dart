import 'package:flutter/material.dart';


class UPI_mandate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'UPI Mandate';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Container(
          margin: EdgeInsets.all(20),
          child: ListView(

            children: <Widget>[
              Container(
                height: 40.0,
                color: Colors.blue[100],
                child: Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.note_add_outlined,
                        color: Colors.grey[800],
                      ),
                      onPressed: () {},
                    ),
                    Text("Create New",
                        style: TextStyle(color: Colors.grey[800], )),
                    IconButton(
                      icon: Icon(
                        Icons.navigate_next_outlined,
                        color: Colors.grey[800],

                      ),
                      onPressed: () {},
                      padding: EdgeInsets.only(left: 182.0),
                    )

                  ],

                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                height: 40.0,
                color: Colors.blue[100],
                child: Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.file_upload,
                        color: Colors.grey[800],
                      ),
                      onPressed: () {},
                    ),
                    Text("Request Received",
                        style: TextStyle(color: Colors.grey[800], )),
                    IconButton(
                      icon: Icon(
                        Icons.navigate_next_outlined,
                        color: Colors.grey[800],

                      ),
                      onPressed: () {},
                      padding: EdgeInsets.only(left: 142.0),
                    )

                  ],

                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                height: 40.0,
                color: Colors.blue[100],
                child: Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.assignment_returned_outlined,
                        color: Colors.grey[800],
                      ),
                      onPressed: () {},
                    ),
                    Text("My Mandates",
                        style: TextStyle(color: Colors.grey[800], )),
                    IconButton(
                      icon: Icon(
                        Icons.navigate_next_outlined,
                        color: Colors.grey[800],

                      ),
                      onPressed: () {},
                      padding: EdgeInsets.only(left: 165.0),
                    )

                  ],

                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                height: 40.0,
                color: Colors.blue[100],
                child: Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.qr_code_scanner_rounded,
                        color: Colors.grey[800],
                      ),
                      onPressed: () {},
                    ),
                    Text("Scan to Receive",
                        style: TextStyle(color: Colors.grey[800], )),
                    IconButton(
                      icon: Icon(
                        Icons.navigate_next_outlined,
                        color: Colors.grey[800],

                      ),
                      onPressed: () {},
                      padding: EdgeInsets.only(left: 150.0),
                    )

                  ],

                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}