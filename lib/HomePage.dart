import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sgp/app_drawer.dart';
import './pay.dart';
import './scan.dart';
import './cr.dart';
import './UPI_mandate.dart';
import './history.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User user;
  bool isloggedin = false;

  checkAuthentification() async {
    _auth.authStateChanges().listen((user) {
      if (user == null) {
        Navigator.of(context).pushReplacementNamed("start");
      }
    });
  }

  getUser() async {
    User firebaseUser = _auth.currentUser;
    await firebaseUser?.reload();
    firebaseUser = _auth.currentUser;

    if (firebaseUser != null) {
      setState(() {
        this.user = firebaseUser;
        this.isloggedin = true;
      });
    }
  }

  signOut() async {
    _auth.signOut();

  }

  @override
  void initState() {
    super.initState();
    this.checkAuthentification();
    this.getUser();
  }

  Card topArea() => Card(
    margin: EdgeInsets.all(10.0),
    elevation: 1.0,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(50.0))),
    child: Container(
        decoration: BoxDecoration(
            gradient: RadialGradient(
                colors: [Color(0xFF0288D1), Color(0xFF0288D1)])),
        padding: EdgeInsets.all(5.0),
        // color: Color(0xFF015FFF),
        child: Column(

          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Barbie@sbi",
                    style: TextStyle(color: Colors.white, fontSize: 20.0)),
                IconButton(
                  icon: Icon(
                    Icons.arrow_drop_down,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                )
              ],
            ),

            SizedBox(height: 35.0),
          ],
        )),
  );


  navigateTopay() async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => pay()));
  }

  navigateToscan() async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => scan()));
  }

  navigateTocr() async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Collect()));
  }

  navigateToUPI() async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => UPI_mandate()));
  }

  navigateTohistory() async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => history()));
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: AppDrawer(),
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.blue, //change your color here
          ),
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: Text(
            "Home",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.notifications_none,
                color: Colors.blue,
              ),
              onPressed: () {},
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Column(
              children: <Widget>[
                topArea(),
                SizedBox(
                  height: 20.0,
                ),
                new Container(
                  margin: EdgeInsets.all(10.0),
                  child: GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    padding: const EdgeInsets.all(10),
                    // Generate 100 widgets that display their index in the List.
                    children: <Widget>[
                      GestureDetector(
                        child: Container(
                            padding: const EdgeInsets.all(8),
                            color: Colors.lightBlueAccent[100],
                            child: Center(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Expanded(
                                        child: Icon(Icons.home, size:50.0, color: Colors.grey[700])),
                                    Text("Pay", style: new TextStyle(fontSize: 15.0,color: Colors.black),),
                                  ]
                              ),
                            )
                        ),
                        onTap: navigateTopay,
                      ),

                      GestureDetector(
                        child: Container(
                            padding: const EdgeInsets.all(8),
                            color: Colors.lightBlueAccent[100],
                            child: Center(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Expanded(
                                        child: Icon(Icons.qr_code_scanner_rounded, size:50.0, color: Colors.grey[700])),
                                    Text("Scan", style: new TextStyle(fontSize: 15.0,color: Colors.black),),
                                  ]
                              ),
                            )
                        ),
                        onTap: navigateToscan,
                      ),

                      GestureDetector(
                        child: Container(
                            padding: const EdgeInsets.all(8),

                            color: Colors.lightBlueAccent[100],
                            child: Center(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Expanded(
                                        child: Icon(Icons.map, size:50.0, color: Colors.grey[700])),
                                    Text("Collect", style: new TextStyle(fontSize: 15.0,color: Colors.black),),
                                  ]
                              ),
                            )
                        ),
                        onTap: navigateTocr,
                      ),

                      GestureDetector(
                        child: Container(
                            padding: const EdgeInsets.all(8),
                            color: Colors.lightBlueAccent[100],
                            child: Center(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Expanded(
                                        child: Icon(Icons.send, size:50.0, color: Colors.grey[700])),
                                    Text("UPI Mandate", style: new TextStyle(fontSize: 15.0,color: Colors.black),),
                                  ]
                              ),
                            )

                        ),
                        onTap: navigateToUPI,
                      ),

                      GestureDetector(

                        child: Container(
                            padding: const EdgeInsets.all(8),
                            color: Colors.lightBlueAccent[100],
                            child: Center(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Expanded(
                                        child: Icon(Icons.history, size:50.0, color: Colors.grey[700])),
                                    Text("History", style: new TextStyle(fontSize: 15.0,color: Colors.black),),
                                  ]
                              ),
                            )
                        ),
                        onTap: navigateTohistory,
                      ),
                    ],


                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
