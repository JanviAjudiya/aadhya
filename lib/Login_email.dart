import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'HomePage.dart';
import 'SignUp.dart';
import 'fade_animation.dart';

class ELogin extends StatefulWidget {
  @override
  _ELoginState createState() => _ELoginState();
}

class _ELoginState extends State<ELogin> {
  bool _isHidden = true;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email, _password;
  var isLoading = false;

  checkAuthentification() async {
    _auth.authStateChanges().listen((user) {
      if (user != null) {
        print(user);

        Navigator.pushReplacementNamed(context, "/");
      }
    });
  }

  @override
  void initState() {
    super.initState();
    this.checkAuthentification();
  }

  login() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      try {
        await _auth.signInWithEmailAndPassword(
            email: _email, password: _password);
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
                            child: Text("Login with Email", style: TextStyle(
                                color: Colors.white,
                                fontSize: 35,
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
                                child: TextFormField(
                                    validator: (input) {
                                      if (input.isEmpty) return 'Enter Email';
                                    },
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Email",
                                      prefixIcon: Icon(Icons.email),
                                      hintStyle: TextStyle(
                                          color: Colors.grey[400]),
                                    ),
                                    onSaved: (input) => _email = input
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(8.0),
                                child: TextFormField(
                                    validator: (input) {
                                      if (input.length < 6)
                                        return 'Provide Minimum 6 Character';
                                    },
                                    obscureText: _isHidden,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Password',
                                      prefixIcon: Icon(Icons.lock),
                                      hintStyle: TextStyle(
                                          color: Colors.grey[400]),
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
                              )
                            ],
                          ),
                        ),
                        ),
                        SizedBox(height: 30,),


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
                              child: Text("Login", style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),),

                            ),
                          ),
                          onPressed: (){
                           if(_formKey.currentState.validate()){
                             ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Processing Data')));

                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => HomePage()),
                            );}
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
        ));
  }

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
}