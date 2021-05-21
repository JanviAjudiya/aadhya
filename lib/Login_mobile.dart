import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import './fade_animation.dart';
import './authservice.dart';
import 'HomePage.dart';

class MLogin extends StatefulWidget {
  @override
  _MLoginState createState() => _MLoginState();
}

class _MLoginState extends State<MLogin> {
  TextEditingController _controller = TextEditingController();
  String phoneNo, verificationId, smsCode;

  bool codeSent = false;

  Future<void> verifyPhone() async {
    final PhoneVerificationCompleted verified = (AuthCredential authResult) {
      AuthService().signIn(authResult);
      print('verified');
    };

    final PhoneVerificationFailed verificationfailed =
        (FirebaseAuthException authException) {
      print('${authException.message}');
    };

    final PhoneCodeSent smsSent = (String verId, [int forceResend]) {
      this.verificationId = verId;
      smsCodeDialog(context).then((value) => print('Sign In'));
      setState(() {
        this.codeSent = true;
      });
    };

    final PhoneCodeAutoRetrievalTimeout autoTimeout = (String verId) {
      this.verificationId = verId;
    };

    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: this.phoneNo,
        timeout: const Duration(seconds: 5),
        verificationCompleted: verified,
        verificationFailed: verificationfailed,
        codeSent: smsSent,
        codeAutoRetrievalTimeout: autoTimeout);
  }

  Future<bool> smsCodeDialog(BuildContext context) {
    return showDialog(context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new AlertDialog(
            title: Text('Enter SMS code'),
            content: TextField(
              onChanged: (value) {
                this.smsCode = value;
              },
            ),
            contentPadding: EdgeInsets.all(10.0),
            actions: <Widget>[
              new FlatButton(
                  child: Text('Done'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  }
              )
            ],
          );
        });
  }

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
                            child: Text("Login with Mobile", style: TextStyle(
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
                            Container(
                                padding: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide(
                                        color: Colors.grey[100]))
                                ),
                                child: IntlPhoneField(
                                  maxLength: 10,
                                  validator: (input) {
                                    if (input.isEmpty)
                                      return 'Enter Mobile Number';
                                  },
                                  decoration: InputDecoration(
                                    labelText: 'Phone Number',
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(),
                                    ),
                                  ),
                                  controller: _controller,
                                  initialCountryCode: 'IN',
                                  //default contry code, IN for India
                                  onChanged: (phone) {
                                    print(phone.completeNumber);
                                    print(phone.countryCode);
                                    print(phone.number);
                                    setState(() {
                                      this.phoneNo = phoneNo;
                                    });
                                  },
                                )
                            ),

                            Container(
                              padding: EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(
                                      color: Colors.grey[100]))
                              ),
                              child: TextFormField(
                                validator: (input) {
                                  if (input.isEmpty) return 'Enter OTP';
                                },
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "OTP",
                                  hintStyle: TextStyle(
                                      color: Colors.grey[400]),
                                ),
                              ),
                            ),

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
                        onPressed: () {
                          FirebaseAuth.instance.signInWithPhoneNumber(phoneNo);
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HomePage()),
                          );
                        },
                      ),

                    ],
                  ),

                ),

              ],
            ),
          ),
        )
    );
  }
}


