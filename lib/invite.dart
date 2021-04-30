import 'package:flutter/material.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class invite extends StatefulWidget {
  @override
  _invite createState() => _invite();
}

class _invite extends State<invite> {
  String qrString = "Add Data";
  final GlobalKey<FormState> _globalkey = GlobalKey<FormState>();
  final User adminuser = FirebaseAuth.instance.currentUser;
  String email;
  CollectionReference collectionReference = FirebaseFirestore.instance.collection('admins');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Invite"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // qr code
          BarcodeWidget(
            color: Colors.blue,
            data: qrString,
            height: 250,
            width: 250,
            barcode: Barcode.qrCode(),
          ),
          // link
          StreamBuilder(
            stream: FirebaseFirestore.instance.collection('sgp').snapshots(),
            builder: (context, snapshot){
              if (!snapshot.hasData) return Text('Loading data... Please Wait...');
              return Container(
                width: MediaQuery.of(context).size.width * .8,
                child: InputDecorator(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(
                      color: Colors.blue,
                    ),
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
            width: MediaQuery.of(context).size.width,
          ),
        ],
      ),
    );
  }
}