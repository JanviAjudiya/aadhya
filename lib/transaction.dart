import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  Widget build(BuildContext context){

    // Material App
    return MaterialApp(

      // Scaffold Widget
        home: Scaffold(
          appBar: AppBar(

            // AppBar takes a Text Widget
            // in it's title parameter
            title: Text('Transaction History'),
          ),
          body: Center(
              child: Text('No Transaction History yet!', style: TextStyle(color: Colors.grey,)), )
          ),
        );

  }
}
