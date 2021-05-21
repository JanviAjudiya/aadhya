import 'package:flutter/material.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:path/path.dart';


class my_account extends StatefulWidget {

  @override
  _my_account createState() => _my_account();
}

class _my_account extends State<my_account> {
  File _image;
  var url;
  final picker = ImagePicker();
  var pickedFile;
  final GlobalKey<FormState> _globalkey = GlobalKey<FormState>();
  final User adminuser = FirebaseAuth.instance.currentUser;
  String name, location, email;
  CollectionReference collectionReference = FirebaseFirestore.instance.collection('admins');

  @override
  Widget build(BuildContext context) {
    Future getImage(BuildContext context) async {
      pickedFile = await picker.getImage(source: ImageSource.gallery);

      setState(() {
        _image = File(pickedFile.path);
      });
    }

    Future uploadPic(BuildContext context) async {
      String fileName = basename(_image.path);

      firebase_storage.Reference firebaseStorageRef = firebase_storage
          .FirebaseStorage.instance
          .ref()
          .child('uploads/$fileName');
      firebase_storage.UploadTask uploadTask =
      firebaseStorageRef.putFile(_image);
      firebase_storage.TaskSnapshot taskSnapshot = await uploadTask;
      firebaseStorageRef.getDownloadURL().then((fileUrl) => url = fileUrl);
    }
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(FontAwesomeIcons.arrowLeft),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text('Profile'),
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
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Align(
                            alignment: Alignment.center,
                            child: CircleAvatar(
                              radius: 100,
                              backgroundColor: Color(0xffdadde7),
                              child: ClipOval(
                                child: new SizedBox(
                                  width: 200.0,
                                  height: 200.0,
                                  child: (_image != null) ? Image.file(
                                    _image,
                                    fit: BoxFit.fill,
                                  ) : Image.network(
                                    "https://images.unsplash.com/photo-1502164980785-f8aa41d53611?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Center(
                            child: Padding(
                              padding: EdgeInsets.only(top: 135.0, left: 0),
                              child: IconButton(
                                icon: Icon(
                                  FontAwesomeIcons.camera,
                                  size: 30.0,
                                ),
                                onPressed: () {
                                  getImage(context);
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        SizedBox(
                          height: 20.0,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value.isEmpty) return "Name can't be empty";
                            return null;
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.teal,
                                )),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.green,
                                  width: 2,
                                )),
                            prefixIcon: Icon(
                              Icons.person,
                              color: Colors.black87,
                            ),
                            suffixIcon: Icon(
                              Icons.edit,
                              color: Colors.black87,
                            ),
                            labelText: "Full Name",
                            hintText: "Full Name",
                          ),
                          onChanged: (String value) {
                            name = value;
                          },
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
                                  labelText: 'Email',
                                  labelStyle: TextStyle(
                                    color: Colors.blue,
                                  ),
                                  prefixIcon: Icon(Icons.email,  color: Colors.black87,),
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
                        TextFormField(

                          validator: (value) {
                            if (value.isEmpty) return "Phone number can not be empty";
                            return null;
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.teal,
                                )),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.green,
                                  width: 2,
                                )),
                            prefixIcon: Icon(
                              Icons.phone,
                              color: Colors.black87,
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(Icons.edit,
                                color: Colors.black87,),
                              onPressed: () {},
                            ),
                            labelText: "Phone number",
                            hintText: "Phone number",
                          ),
                          onChanged: (String value) {
                            location = value;
                          },
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        TextFormField(

                          validator: (value) {
                            if (value.isEmpty) return "DOB can't be empty";
                            return null;
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.teal,
                                )),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.green,
                                  width: 2,
                                )),
                            prefixIcon: Icon(
                              Icons.location_city,
                              color: Colors.black87,
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(Icons.edit,
                                color: Colors.black87,),
                              onPressed: () {},
                            ),
                            labelText: "Location",
                            hintText: "Location",
                          ),
                          onChanged: (String value) {
                            location = value;
                          },
                        ),
                        SizedBox(
                          height: 20.0,
                        ),

                        // ignore: deprecated_member_use
                        Row(
                          children: [
                            SizedBox(
                              width: 90.0,
                            ),
                            RaisedButton(
                              color: Colors.blue,
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              elevation: 4.0,
                              splashColor: Colors.blueGrey,
                              child: Text(
                                'Cancel',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16.0),
                              ),
                            ),
                            SizedBox(
                              width: 40.0,
                            ),
                            InkWell(
                              onTap: () {
                                if (_globalkey.currentState.validate()) {
                                  print("Validated!");
                                }
                              },
                              child: RaisedButton(
                                color: Colors.blue,
                                onPressed: () {
                                  uploadPic(context);
                                  collectionReference.doc(email)
                                      .update({
                                    "name": name,
                                    "location":location,
                                    "url": url
                                  });
                                },

                                elevation: 4.0,
                                splashColor: Colors.blueGrey,
                                child: Text(
                                  'Edit Profile',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16.0),
                                ),
                              ),
                            ),
                          ],
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