import 'package:flutter/material.dart';


class CR_qr extends StatelessWidget {
@override
Widget build(BuildContext context) {
  //final title = 'Pay';

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

                        labelText: '   Collect From',
                      ),
                    ),

                  ),


                  Container(

                    child: TextField(
                      decoration: InputDecoration(
                          labelText: 'Amount',
                          prefixIcon: Icon(Icons.attach_money)),
                    ),

                  ),
                  
                  Container(

                    child: TextField(
                      decoration: InputDecoration(
                          labelText: 'Remarks(Optional)',
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

                        labelText: '   Collect To',
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