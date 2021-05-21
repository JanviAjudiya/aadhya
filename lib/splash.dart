import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'Start.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  final FirebaseAuth _auth = FirebaseAuth.instance;




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(height: 35.0),
            Container(
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.height / 1.5,
              width: MediaQuery.of(context).size.width,
              child: AnimatedSplashScreen(
                duration: 3000,
                splash: Image.asset('images/loading.gif',
                  width: MediaQuery.of(context).size.width/1.5,
                  height: MediaQuery.of(context).size.height/1.5,
                  fit: BoxFit.cover,
                ),
                nextScreen: Start(),
                splashTransition: SplashTransition.rotationTransition,
                backgroundColor: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  RichText(
                      text: TextSpan(
                          text: 'We are Here ',
                          style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                          children: <TextSpan>[
                            TextSpan(
                                text: 'For Your comfort',
                                style: TextStyle(
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue))
                          ])),
                  SizedBox(height: 10.0),
                  Text(
                    'Continue your ordering and share feedback with us',
                    style: TextStyle(color: Colors.grey, fontSize: 20),
                  ),
                  ],
              ),
            ),
            SizedBox(height: 30.0),
          ],
        ),
      ),
    );
  }
}