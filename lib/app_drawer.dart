import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sgp/faqs.dart';
import './Contact.dart';
import './my_account.dart';
import './history.dart';
import './unblock.dart';
import './invite.dart';


class AppDrawer extends StatefulWidget {
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
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

  navigateTomy_account() async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => my_account()));
  }
  navigateTotransaction() async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => history()));
  }
  navigateToContact() async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Contact()));
  }
  navigateTounblock_upi() async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Unblock()));
  }
  navigateTofaqs() async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => faqs()));
  }
  navigateToinvite() async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => invite()));
  }
  navigateToderegister() async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => my_account()));
  }


  signOut() async {
    _auth.signOut();

  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200.0,
      child: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            FlatButton(
              color: Colors.white,
              padding: EdgeInsets.all(10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 5.0),
                    child: Icon(
                      Icons.account_balance,
                      color: Color(0xFF015FFF),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5.0),
                    child: Text(
                      "MY ACCOUNT",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
              onPressed: navigateTomy_account,
            ),
            SizedBox(
              height: 10,
            ),
            Divider(),
            SizedBox(
              height: 10,
            ),
            FlatButton(
              color: Colors.white,
              padding: EdgeInsets.all(10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 5.0),
                    child: Icon(
                      Icons.history,
                      color: Color(0xFF015FFF),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5.0),
                    child: Text(
                      "TRANSACTION HISTORY",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
              onPressed: navigateTotransaction,
            ),
            SizedBox(
              height: 10,
            ),
            Divider(),
            SizedBox(
              height: 10,
            ),
            FlatButton(
              color: Colors.white,
              padding: EdgeInsets.all(10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 5.0),
                    child: Icon(
                      Icons.person,
                      color: Color(0xFF015FFF),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5.0),
                    child: Text(
                      "CONTACT MANAGEMENT",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
              onPressed: navigateToContact,
            ),
            SizedBox(
              height: 10,
            ),
            Divider(),
            SizedBox(
              height: 10,
            ),
            FlatButton(
              color: Colors.white,
              padding: EdgeInsets.all(10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 5.0),
                    child: Icon(
                      Icons.brightness_5_outlined,
                      color: Color(0xFF015FFF),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5.0),
                    child: Text(
                      "UIBLOCK",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
              onPressed: navigateTounblock_upi,
            ),
            SizedBox(
              height: 10,
            ),
            Divider(),
            SizedBox(
              height: 10,
            ),
            FlatButton(
              color: Colors.white,
              padding: EdgeInsets.all(10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 5.0),
                    child: Icon(
                      Icons.help_outline,
                      color: Color(0xFF015FFF),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5.0),
                    child: Text(
                      "FAQs",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
              onPressed: navigateTofaqs,
            ),
            SizedBox(
              height: 10,
            ),
            Divider(),
            SizedBox(
              height: 10,
            ),
            FlatButton(
              color: Colors.white,
              padding: EdgeInsets.all(10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 5.0),
                    child: Icon(
                      Icons.share,
                      color: Color(0xFF015FFF),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5.0),
                    child: Text(
                      "INVITE",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
              onPressed: navigateToinvite,
            ),
            SizedBox(
              height: 10,
            ),
            Divider(),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.only(top: 5.0),
              child: FlatButton.icon(
                icon: Icon(
                  Icons.logout,
                  color: Color(0xFF015FFF),
                ),
                onPressed: signOut,
                label: Text("Logout",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12.0,
                        color: Colors.black)),
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }


  Opacity buildMenuItem(IconData icon, String title,
      {double opacity = 0.3, Color color = Colors.black, GestureTapCallback onPressed}) {
    return Opacity(
      opacity: opacity,
      child: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20.0,
            ),
            Icon(
              icon,
              size: 20.0,
              color: color,
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(title,
                style: TextStyle(
                    fontWeight: FontWeight.w500, fontSize: 10.0, color: color)),
            SizedBox(
              height: 10.0,
            ),
          ],
        ),
      ),
    );

  }
}

