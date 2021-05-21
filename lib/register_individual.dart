import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:sgp/HomePage.dart';
import 'package:sgp/skip_after.dart';
import './fade_animation.dart';

class ISignUp extends StatefulWidget {
  @override
  _ISignUpState createState() => _ISignUpState();
}

class _ISignUpState extends State<ISignUp> {
  bool _isHidden = true;
  String _chosenValue;
  static List<Animal> _animals = [
    Animal(id: 1, name: "Lion"),
    Animal(id: 2, name: "Flamingo"),
    Animal(id: 3, name: "Hippo"),
    Animal(id: 4, name: "Horse"),
    Animal(id: 5, name: "Tiger"),
    Animal(id: 6, name: "Leapord"),
    Animal(id: 7, name: "Peacock"),
  ];
  final _items = _animals
      .map((animal) => MultiSelectItem<Animal>(animal, animal.name))
      .toList();
  List<Animal> _selectedAnimals2 = [];
  List<Animal> _selectedAnimals3 = [];
  List<Animal> _selectedAnimals5 = [];
  final _multiSelectKey = GlobalKey<FormFieldState>();

  @override
  void initState() {
    _selectedAnimals5 = _animals;
    super.initState();
  }
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
                            child: Text("Register as Owner", style: TextStyle(
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
                            Container(
                              padding: EdgeInsets.all(10),
                              child: Row(
                                children: <Widget>[
                                  Text('Category : ', style: TextStyle(fontSize: 18),),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  MultiSelectDialogField(
                                    items: _items,
                                    title: Text("Categories"),
                                    height: 300,
                                    selectedColor: Colors.blue,
                                    decoration: BoxDecoration(
                                      color: Colors.grey.withOpacity(0.1),
                                      border: Border.all(
                                        color: Colors.grey[700],
                                        width: 2,
                                      ),
                                    ),
                                    buttonIcon: Icon(
                                      Icons.arrow_drop_down,
                                      color: Colors.grey[700],
                                    ),
                                    buttonText: Text(
                                      "Select Category",
                                      style: TextStyle(
                                        color: Colors.grey[700],
                                        fontSize: 16,
                                      ),
                                    ),
                                    onConfirm: (results) {
                                      //_selectedAnimals = results;
                                    },
                                  ),
                                  SizedBox(height: 10),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              child: Row(
                                children: <Widget>[
                                  Text('Delivery : ', style: TextStyle(fontSize: 18),),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  DropdownButton<String>(
                                    value: _chosenValue,
                                    focusColor:Colors.pinkAccent,
                                    hint: Text("YES / NO", style: TextStyle(
                                        color: Colors.grey[700],
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600)),
                                    style: TextStyle(color: Colors.black),
                                    items: <String>[
                                      'YES',
                                      'NO',
                                    ].map<DropdownMenuItem<String>>((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                    onChanged: (String value) {
                                      setState(() {
                                        _chosenValue = value;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  labelText: 'Delivery range(in km)',
                                  border: OutlineInputBorder(
                                  ),
                                ),
                                //onSaved: (input) => _name = input
                              ),
                            ),
                          ],
                        ),
                      ),
                      ),


                      SizedBox(height: 30,),
                      Row(
                        children: [
                          MaterialButton(
                            child: Container(
                              height: 50,
                              width: 140,
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
                                child: Text("Skip", style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold, fontSize: 20),
                                ),

                              ),
                            ),
                            onPressed: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Skip()),
                              );
                            },
                          ),
                          MaterialButton(
                            child: Container(
                              height: 50,
                              width: 140,
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

class Animal {
  final int id;
  final String name;

  Animal({
    this.id,
    this.name,
  });
}