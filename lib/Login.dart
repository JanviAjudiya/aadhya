import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './Login_email.dart';

import 'Login_mobile.dart';
import 'fade_animation.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
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
                          child: Text("Login", style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.bold),),
                        ),
                      )),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(30.0),
                child: Column(
                  children: <Widget>[
                    FadeAnimation(1.8, Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromRGBO(143, 148, 251, .2),
                                blurRadius: 20.0,
                                offset: Offset(0, 10)
                            )
                          ]
                      ),
                      child: Column(
                        children: <Widget>[


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
                                child: Text("Login with Mobile", style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),),

                              ),
                            ),
                            onPressed: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => MLogin()),
                              );
                            },
                          ),

                          SizedBox(height: 10,),

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
                                child: Text("Login with Email", style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),),

                              ),
                            ),
                            onPressed: () async{
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ELogin()),
                              );
                            },
                          ),



                        ],
                      ),

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