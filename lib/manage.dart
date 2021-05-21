import 'package:flutter/material.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class manage extends StatefulWidget {

  @override
  _manage createState() => _manage();
}

class _manage extends State<manage> {
  File _image;
  var url;
  final GlobalKey<FormState> _globalkey = GlobalKey<FormState>();
  final User adminuser = FirebaseAuth.instance.currentUser;
  String name, location, email;
  CollectionReference collectionReference = FirebaseFirestore.instance.collection('admins');

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Account Detail'),
      ),
      body: SingleChildScrollView(
        child: Builder(
          key: _globalkey,
          builder: (context) =>
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 30.0,
                    ),


                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        SizedBox(
                          height: 20.0,
                        ),

                        StreamBuilder(
                          stream: FirebaseFirestore.instance.collection('sgp').snapshots(),
                          builder: (context, snapshot){
                            if (!snapshot.hasData) return Text('Loading data... Please Wait...');
                            return

                              Container(
                              child: InputDecorator(
                                decoration: InputDecoration(
                                  labelText: 'Email',
                                  labelStyle: TextStyle(
                                    color: Colors.blue,
                                  ),
                                  prefixIcon: Icon(Icons.person,  color: Colors.black87,),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide:  BorderSide(color: Colors.green),
                                  ),
                                ),
                                child: Text(snapshot.data.documents[0]['email'].toString(), style: TextStyle(fontSize: 17.0, color: Colors.black.withOpacity(0.6)),),
                              ),
                            );
                          },
                        ),
                        SizedBox(
                          height: 20.0,
                        ),

                        SizedBox(
                          height: 20.0,
                        ),
                        StreamBuilder(
                          stream: FirebaseFirestore.instance.collection('sgp').snapshots(),
                          builder: (context, snapshot){
                            if (!snapshot.hasData) return Text('Loading data... Please Wait...');
                            return Container(
                              child: InputDecorator(
                                decoration: InputDecoration(
                                  labelText: 'Password',
                                  labelStyle: TextStyle(
                                    color: Colors.blue,
                                  ),
                                  prefixIcon: Icon(Icons.lock,  color: Colors.black87,),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide:  BorderSide(color: Colors.green),
                                  ),
                                ),
                                child: Text(snapshot.data.documents[0]['pass'].toString(), style: TextStyle(fontSize: 17.0, color: Colors.black.withOpacity(0.6)), ),
                              ),
                            );
                          },
                        ),


                      ],
                    ),
                  ],
                ),
              ),
        ),
      ),
    );
  }
}