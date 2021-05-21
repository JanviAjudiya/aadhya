import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sgp/Login.dart';
import 'package:sgp/register_individual.dart';
import 'package:sgp/register_owner.dart';
import 'fade_animation.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _isHidden = true;
  FirebaseAuth _auth = FirebaseAuth.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('sgp');
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _name, _email, _password;
  final _passwordController = TextEditingController();

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
                            child: Text("SignUp", style: TextStyle(
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
                  child: Form(
                    key: _formKey,
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
                              Container(
                                padding: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide(
                                        color: Colors.grey[100]))
                                ),
                                child: Container(
                                  child: TextFormField(
                                      validator: (input) {
                                        if (input.isEmpty) return 'Enter Name';
                                      },
                                      decoration: InputDecoration(
                                          hintText: 'Full Name',
                                          border: InputBorder.none,
                                          hintStyle: TextStyle(
                                              color: Colors.grey[400]),
                                          prefixIcon: Icon(Icons.person, color: Colors.grey[400],)),
                                      onSaved: (input) => _name = input
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide(
                                        color: Colors.grey[100]))
                                ),
                                child: Container(
                                  child: TextFormField(
                                      validator: (input) {
                                        if (input.isEmpty) return 'Enter Email';
                                        if (!RegExp(r'\S+@\S+\.\S+').hasMatch(input)) {
                                          return 'Please enter a valid email address';
                                        }
                                      },
                                      decoration: InputDecoration(
                                          hintText: 'Email',
                                          border: InputBorder.none,
                                          hintStyle: TextStyle(
                                              color: Colors.grey[400]),
                                          prefixIcon: Icon(Icons.email, color: Colors.grey[400],)),
                                      onSaved: (input) => _email = input
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(8.0),
                                child: TextFormField(
                                    controller: _passwordController,
                                    validator: (input) {
                                      if (input.length < 6)
                                        return 'Provide Minimum 8 Character';
                                      Pattern pattern =
                                          r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
                                      RegExp regex = new RegExp(pattern);
                                      print(input);
                                      if (!regex.hasMatch(input))
                                        return 'Enter valid password';
                                    },
                                    obscureText: _isHidden,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Password',
                                      hintStyle: TextStyle(
                                          color: Colors.grey[400]),
                                      prefixIcon: Icon(Icons.lock, color: Colors.grey[400],),
                                      suffix: InkWell(
                                        onTap: _togglePasswordView,
                                        child: Icon(
                                          _isHidden
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                          color: Colors.grey[400],
                                        ),
                                      ),
                                    ),
                                    onSaved: (input) => _password = input
                                ),
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
                                    child: Text("Register as Owner", style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),),

                                  ),
                                ),
                                onPressed: ()async {
                                  _formKey.currentState.save();
                                  if (_formKey.currentState.validate()) {
                                    try {
                                      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                                        email: _email,
                                        password: _password,
                                      );
                                      users.doc(_email).set({
                                        'email': _email,
                                        'pass': _password,
                                        'name': _name,
                                      });
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => OSignUp()));
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
                                  };
                                },
                              ),

                              SizedBox(
                                height: 10,
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
                                    child: Text("Register as Individual", style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),),

                                  ),
                                ),
                                onPressed: ()async {
                                  _formKey.currentState.save();
                                  if (_formKey.currentState.validate()) {
                                    try {
                                      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                                        email: _email,
                                        password: _password,
                                      );
                                      users.doc(_email).set({
                                        'email': _email,
                                        'pass': _password,
                                      });
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => ISignUp()));
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
                                  };
                                },
                              ),
                            ],
                          ),
                        ),
                        ),
                        SizedBox(height: 20),

                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ));
  }

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
}
