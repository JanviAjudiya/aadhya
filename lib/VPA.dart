import 'package:flutter/material.dart';

import 'check.dart';


class VPA extends StatefulWidget {
  @override
  _VPAState createState() => _VPAState();
}
class _VPAState extends State<VPA>{
  @override
  Widget build(BuildContext context) {
    final amount = new TextEditingController();
    final remark = new TextEditingController();
    final name = new TextEditingController();
    final phone = new TextEditingController();

    return MaterialApp(
      //title: title,
      home: Scaffold(
        appBar: AppBar(
          // title: Text(title),
        ),
        body: Container(
          margin: EdgeInsets.all(20),


          child: ListView(

            children: <Widget>[
              Container(

                color: Colors.white,
                child: Column(
                  children: <Widget>[

                    Container(

                      child: TextField(
                        decoration: InputDecoration(

                          labelText: '   Pay To',
                        ),
                      ),

                    ),

                    Container(
                      child: TextFormField(
                        controller: name,
                        decoration: InputDecoration(
                            hintText: 'Beneficiary VPA',
                            prefixIcon: Icon(Icons.alternate_email)),
                      ),

                    ),
                    Container(
                      child: TextFormField(
                        controller: amount,
                        decoration: InputDecoration(
                            hintText: 'Amount',
                            prefixIcon: Icon(Icons.attach_money)),
                      ),

                    ),

                    Container(
                      child: TextFormField(
                        controller: remark,
                        decoration: InputDecoration(
                            hintText: 'Remarks(Optional)',
                            prefixIcon: Icon(Icons.article_outlined)),
                      ),

                    ),

                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(

                color: Colors.white,
                child: Column(
                  children: <Widget>[

                    Container(

                      child: TextField(
                        decoration: InputDecoration(

                          labelText: '   Pay From',
                        ),
                      ),

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
                      child: TextFormField(
                        controller: phone,
                        decoration: InputDecoration(
                            hintText: 'Phone Number',
                            prefixIcon: Icon(Icons.phone)),
                      ),

                    ),


                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Center(
                  child: Column(
                    children: [
                      RaisedButton(
                        color: Colors.lightBlueAccent,
                        onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (context) => CheckRazor(
                              amountHolder: amount.text,
                              nameHolder: name.text,
                              phoneHolder: phone.text,
                              remarkHolder: remark.text,
                            ),
                          ),
                              (Route<dynamic> route) => false,
                        ),
                        child: Text(
                          "Pay Now",
                        ),
                      ),
                    ],
                  ),

                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}