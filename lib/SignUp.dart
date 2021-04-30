import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sgp/Login.dart';

import 'HomePage.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('sgp');
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _name, _email, _password, _phone, _confirm_password;
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  checkAuthentication() async {
    _auth.authStateChanges().listen((user) async {
      if (user != null) {
        Navigator.pushReplacementNamed(context, "/");
      }
    });
  }

  @override
  void initState() {
    super.initState();
    this.checkAuthentication();
  }

  signUp() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      try {
        UserCredential user = await _auth.createUserWithEmailAndPassword(
            email: _email, password: _password);
        if (user != null) {
          await _auth.currentUser.updateProfile(displayName: _name);
        }
      } catch (e) {
        showError(e.message);
        print(e);
      }
    }
  }

  showError(String errormessage) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('ERROR'),
            content: Text(errormessage),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'))
            ],
          );
        });
  }
  navigateToLogin() async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: 400,
                  child: Image(
                    image: AssetImage("images/signup.jpg"),
                    fit: BoxFit.contain,
                  ),
                ),
                Container(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: TextFormField(
                              validator: (input) {
                                if (input.isEmpty) return 'Enter Name';
                              },
                              decoration: InputDecoration(
                                labelText: 'Username',
                                prefixIcon: Icon(Icons.person),
                              ),
                              onSaved: (input) => _name = input),
                        ),
                        Container(
                          child: TextFormField(
                              validator: (input) {
                                if (input.isEmpty) return 'Enter Email';
                                if (!RegExp(r'\S+@\S+\.\S+').hasMatch(input)) {
                                  return 'Please enter a valid email address';
                                }
                              },
                              decoration: InputDecoration(
                                  labelText: 'Email',
                                  prefixIcon: Icon(Icons.email)),
                              onSaved: (input) => _email = input),
                        ),
                        Container(
                          child: TextFormField(
                              keyboardType: TextInputType.number,
                              validator: (input) {
                                if (input.isEmpty) return 'Enter Phone Number';
                                if(input.length < 10 || input.length > 10)
                                {
                                  return 'Enter valid 10 digit phone number';
                                }
                              },
                              decoration: InputDecoration(
                                  labelText: 'Phone Number',
                                  prefixIcon: Icon(Icons.phone)),
                              onSaved: (input) => _phone = input),
                        ),
                        Container(
                          child: TextFormField(
                              controller: _passwordController,
                              validator: (input) {
                                if (input.length < 6)
                                  return 'Provide Minimum 6 Character';
                                Pattern pattern =
                                    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
                                RegExp regex = new RegExp(pattern);
                                print(input);
                                if (!regex.hasMatch(input))
                                  return 'Enter valid password';
                              },
                              decoration: InputDecoration(
                                labelText: 'Password',
                                prefixIcon: Icon(Icons.lock),
                              ),
                              obscureText: true,
                              onSaved: (input) => _password = input),
                        ),
                        Container(
                          child: TextFormField(
                              controller: _confirmPasswordController,
                              validator: (input) {
                                if (input != _passwordController.text)
                                  return 'Password doesnot match';
                              },
                              decoration: InputDecoration(
                                labelText: 'Confirm Password',
                                prefixIcon: Icon(Icons.lock),
                              ),
                              obscureText: true,
                              onSaved: (input) => _confirm_password = input),
                        ),
                        SizedBox(height: 20),
                        RaisedButton(
                          padding: EdgeInsets.fromLTRB(70, 10, 70, 10),
                          onPressed: ()async{
                            _formKey.currentState.save();
                            if (_formKey.currentState.validate()) {
                              try {
                                UserCredential userCredential = await FirebaseAuth
                                    .instance
                                    .createUserWithEmailAndPassword(
                                  email: _email,
                                  password: _password,
                                );
                                users.doc(_email).set({
                                  'username': _name,
                                  'email': _email,
                                  'pass': _password,
                                  'phone number': _phone,
                                });
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HomePage(),
                                  ),
                                );
                              } on FirebaseAuthException catch (e) {
                                if (e.code == 'weak-password') {
                                  print('The password provided is too weak.');
                                } else if (e.code == 'email-already-in-use') {
                                  print(
                                      'The account already exists for that email.');
                                }
                              } catch (e) {
                                print(e);
                              }
                            }
                          },
                          child: Text('SignUp',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold)),
                          color: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                GestureDetector(
                  child: Text('Already have an account?', style: TextStyle(fontWeight: FontWeight.bold),),
                  onTap: navigateToLogin,
                )
              ],
            ),
          ),
        ));
  }
}