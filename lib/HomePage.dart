import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sgp/Start.dart';
import 'fade_animation.dart';
import './manage.dart';
import './my_account.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User user;
  bool isloggedin = false;


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
                          child: Text("My Account", style: TextStyle(
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
                                child: Text("Manage Addresses", style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),),

                              ),
                            ),
                            onPressed: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => manage()),
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
                                child: Text("Edit Profile", style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),),

                              ),
                            ),
                            onPressed: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => my_account()),
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
                                child: Text("Log Out", style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),),

                              ),
                            ),
                            onPressed: () async{
                              await FirebaseAuth.instance.signOut();
                              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Start()), (route) => false);
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
                                child: Text("Back", style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),),

                              ),
                            ),
                            onPressed: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Start()),
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
