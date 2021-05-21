import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:sgp/HomePage.dart';
import './fade_animation.dart';

class Skip extends StatefulWidget {
  @override
  _SkipState createState() => _SkipState();
}

class _SkipState extends State<Skip> {
  navigateToOTP() async {
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
                            child: Text("Registration", style: TextStyle(
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
                              padding: EdgeInsets.all(10),
                              child: TextFormField(
                                validator: (input) {
                                  if (input.isEmpty) return 'Enter Shop Name';
                                },
                                decoration: InputDecoration(
                                  labelText: 'Shop Name',
                                  border: OutlineInputBorder(
                                  ),
                                ),
                                //onSaved: (input) => _name = input
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            IntlPhoneField(
                              keyboardType: TextInputType.number,
                              maxLength: 10,
                              validator: (input) {
                                if (input.isEmpty) return 'Enter Mobile Number';
                              },
                              decoration: InputDecoration(
                                labelText: 'Phone Number',
                                border: OutlineInputBorder(
                                ),
                              ),
                              initialCountryCode: 'IN', //default contry code, IN for India
                              onChanged: (phone) {
                                print(phone.completeNumber);
                                print(phone.countryCode);
                                print(phone.number);
                              },
                            ),
                            GestureDetector(
                              child: Text('Click Here to get OTP', style: TextStyle(fontWeight: FontWeight.bold),),
                              onTap: navigateToOTP,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                      ),


                      SizedBox(height: 30,),


                      MaterialButton(
                        child: Container(
                          height: 50,
                          width: 300,
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
                            child: Text("Submit", style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold, fontSize: 20),
                            ),

                          ),
                        ),
                        onPressed: (){
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
