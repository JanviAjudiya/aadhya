import 'package:flutter/material.dart';


class Contact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Contact Management';

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
                child: Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                      onPressed: () {},
                    ),
                    Text("Serach UPI ID to add",
                        style: TextStyle(color: Colors.grey, )),
                    IconButton(
                      icon: Icon(
                        Icons.cancel,
                        color: Colors.grey,
                      ),
                      onPressed: () {},
                      padding: EdgeInsets.only(left: 120.0),
                    )

                  ],

                ),
                color: Colors.white,
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(

                child: Row(
                  children: <Widget>[

                    Text("   Add from Address Book",
                        style: TextStyle(color: Colors.blue,
                        )),
                    IconButton(
                      icon: Icon(
                        Icons.contacts_outlined,
                        color: Colors.grey,
                      ),
                      onPressed: () {},
                      padding: EdgeInsets.only(left: 130.0),
                    )

                  ],

                ),
                color: Colors.white,
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: '   Contact',
                  ),
                  style: TextStyle(color: Colors.black,),

                ),
                color: Colors.white,
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                child: Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.person,
                        color: Colors.grey,
                      ),
                      onPressed: () {},
                    ),
                    Text("VASOYA BARBIE HITESHBHAI\nBarbie@sbi",
                        style: TextStyle(color: Colors.grey, )),
                    IconButton(
                      icon: Icon(
                        Icons.remove_circle_outline,
                        color: Colors.grey,
                      ),
                      onPressed: () {},
                      padding: EdgeInsets.only(left: 60.0),
                    )

                  ],

                ),
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}