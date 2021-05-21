import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:sgp/HomePage.dart';
import './fade_animation.dart';


class OSignUp extends StatefulWidget {
  @override
  _OSignUpState createState() => _OSignUpState();
}

class _OSignUpState extends State<OSignUp> {
  bool _isHidden = true;
  String shopname, categories, delivery, range;
  int phone;
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  CollectionReference collectionReference = FirebaseFirestore.instance.collection('sgp');

  String _chosenValue;
  static List<Animal> _animals = [
    Animal(id: 1, name: "Automotive"),
    Animal(id: 2, name: "Baby & Toddler"),
    Animal(id: 3, name: "Clothing & Shoes"),
    Animal(id: 4, name: "Computers"),
    Animal(id: 5, name: "Health & Beauty"),
    Animal(id: 6, name: "Entertainment & Arts "),
    Animal(id: 7, name: "Electronics"),
    Animal(id: 8, name: "Food & Gifts "),
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
                  child: Form(
                    key: _globalKey,
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
                              Column(
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
                                        onSaved: (input) => shopname = input
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Column(
                                children: <Widget>[
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
                                      onSaved: (input) => phone = input as int,
                                  ),
                                  GestureDetector(
                                    child: Text('Click Here to get OTP', style: TextStyle(fontWeight: FontWeight.bold),),
                                    onTap: navigateToOTP,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  children: <Widget>[
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
                                        _selectedAnimals2 = results;
                                      },
                                    ),
                                    SizedBox(height: 10),
                                  ],
                                ),
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
                              Column(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    child: TextFormField(
                                      validator: (input) {
                                        if (input.isEmpty) return 'Enter Delivery range';
                                      },
                                      decoration: InputDecoration(
                                        labelText: 'Delivery range(in km)',
                                        border: OutlineInputBorder(
                                        ),
                                      ),
                                      onSaved: (input) => range = input,
                                    ),
                                  ),
                                ],

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
                          onPressed: () {
                            if (_globalKey.currentState.validate()) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Processing Data')));
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => HomePage()),);
                              Firestore.instance
                                  .collection('sgp')
                                  .document('email')
                                  .updateData({
                                'Shop name': shopname,
                                'Phone number': phone,
                                'Delivery range': range,
                              });
                            }
                          }
                        ),


                      ],
                    ),
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