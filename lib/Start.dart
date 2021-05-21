import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'Login.dart';
import 'SignUp.dart';
import 'fade_animation.dart';

class Start extends StatefulWidget {
  @override
  _StartState createState() => _StartState();
}

class _StartState extends State<Start> {
  final FirebaseAuth _auth = FirebaseAuth.instance;


  navigateToLogin() async {
    Navigator.pushReplacementNamed(context, "Login");
  }

  navigateToRegister() async {
    Navigator.pushReplacementNamed(context, "SignUp");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              height: 400,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/background.png'),
                      fit: BoxFit.fill
                  )
              ),
              child: Stack(
                children: <Widget>[
                  Positioned(
                    child: FadeAnimation(1.6, Container(
                      margin: EdgeInsets.only(top: 50),
                      child: Center(
                        child: Text("Home", style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold),),
                      ),
                    )),
                  )
                ],
              ),
            ),
            MaterialButton(
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                        colors: [
                          Color.fromRGBO(143, 148, 251, 1),
                          Color.fromRGBO(143, 148, 251, .6),
                        ]
                    )
                ),
                child: Center(
                  child: Text("SignUp", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),

                ),
              ),
              onPressed: () async{
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUp()),
                );
              },
            ),
            SizedBox(
              height: 30,
            ),
            MaterialButton(
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                        colors: [
                          Color.fromRGBO(143, 148, 251, 1),
                          Color.fromRGBO(143, 148, 251, .6),
                        ]
                    )
                ),
                child: Center(
                  child: Text("Login", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),

                ),
              ),
              onPressed: () async{
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}