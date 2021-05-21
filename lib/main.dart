import 'package:flutter/material.dart';
import 'package:sgp/Signup.dart';
import 'package:sgp/Login.dart';
import 'package:sgp/splash.dart';
import 'HomePage.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      theme: ThemeData(
          primaryColor: Colors.blue
      ),
      debugShowCheckedModeBanner: false,
      home: Splash(),

      routes: <String,WidgetBuilder>{

        "Login" : (BuildContext context)=>Login(),
        "SignUp":(BuildContext context)=>SignUp(),
        "start":(BuildContext context)=>Splash(),
      },

    );
  }

}