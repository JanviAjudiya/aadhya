import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'My Account';

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
                        Icons.alternate_email_outlined,
                        color: Colors.grey,
                      ),
                      onPressed: () {},
                    ),
                    Text("Barbie@sbi",
                        style: TextStyle(color: Colors.grey, )),
                    IconButton(
                      icon: Icon(
                        Icons.arrow_drop_down,
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

              SizedBox(
                height: 10.0,
              ),
              Container(
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: '   Linked Accounts',
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
                        Icons.alternate_email,
                        color: Colors.grey,
                      ),
                      onPressed: () {},
                    ),
                    Text("Barbie@sbi",
                        style: TextStyle(color: Colors.grey, )),
                    IconButton(
                      icon: Icon(
                        Icons.arrow_drop_down,
                        color: Colors.grey,
                      ),
                      onPressed: () {},
                      padding: EdgeInsets.only(left: 178.0),
                    )

                  ],

                ),


              ),

              Container(

                child: Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.title_outlined,
                        color: Colors.grey,
                      ),
                      onPressed: () {},
                    ),
                    Text("XXXXXX8576",
                        style: TextStyle(color: Colors.grey, )),

                    Text("                    View Balance",
                        style: TextStyle(color: Colors.black, )),
                    IconButton(
                      icon: Icon(
                        Icons.arrow_drop_up,
                        color: Colors.grey,
                      ),

                      onPressed: () {},
                      //padding: EdgeInsets.only(left: 100.0),
                    ),

                  ],

                ),

              ),


              Container(
                child: Row(
                  children: <Widget>[

                    Text("   Bank Name",
                        style: TextStyle(color: Colors.grey, )),
                    Text("                      STATE BANK OF INDIA",
                        style: TextStyle(color: Colors.grey, )),

                    //padding: EdgeInsets.only(left: 178.0),
                  ],
                ),
              ),

              SizedBox(
                height: 10.0,
              ),
              Container(
                child: Row(
                  children: <Widget>[

                    Text("   IFSC",
                        style: TextStyle(color: Colors.grey, )),
                    Text("                                                SBIN00340589",
                        style: TextStyle(color: Colors.grey, )),

                    //padding: EdgeInsets.only(left: 178.0),
                  ],
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                child: Row(
                  children: <Widget>[

                    Text("   UPI PIN Status",
                        style: TextStyle(color: Colors.grey, )),
                    Text("                   6 Digit UPI PIN Exists",
                        style: TextStyle(color: Colors.grey, )),

                    //padding: EdgeInsets.only(left: 178.0),
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