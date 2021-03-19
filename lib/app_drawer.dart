import 'package:flutter/material.dart';
import 'package:sgp/HomePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './Contact.dart';

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
            Padding(
              padding: EdgeInsets.only(top: 5.0),
              child: FlatButton.icon(
                icon: Icon(
                  Icons.arrow_right,
                  color: Color(0xFF015FFF),
                ),
                onPressed: null,
                label: Text("View Profile",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12.0,
                        color: Colors.black)),
                color: Colors.black,
              ),
            ),
            buildMenuItem(Icons.account_balance, " MY ACCOUNT",
                opacity: 1.0, color: Color(0xFF015FFF)),
            Divider(),
            buildMenuItem(Icons.history, "TRANSACTION HISTORY"),
            Divider(),
            buildMenuItem(Icons.person, "CONTACT MANAGEMENT"),
            Divider(),
            buildMenuItem(Icons.brightness_5_outlined, "UNBLOCK UPI ID"),
            Divider(),
            buildMenuItem(Icons.toggle_on_outlined, "DISABLE UPI SERVICES"),
            Divider(),
            buildMenuItem(Icons.share_rounded, "INVITE"),
            Divider(),
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


  /*@override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _createDrawerItem(
              icon: Icons.account_balance,
              text: 'MY ACCOUNT',
              onTap: () =>
                  Navigator.pushReplacementNamed(context, my_account())),
          _createDrawerItem(
              icon: Icons.history,
              text: 'TRANSACTION HISTORY',
              onTap: () =>
                  Navigator.pushReplacementNamed(context, transaction())),
          _createDrawerItem(
              icon: Icons.person,
              text: 'CONTACT MANAGEMENT',
              onTap: () =>
                  Navigator.pushReplacementNamed(context, Contact())),
          _createDrawerItem(
              icon: Icons.brightness_5_outlined,
              text: 'UNBLOCK UPI ID',
              onTap: () =>
                  Navigator.pushReplacementNamed(context, unblock_upi())),
          _createDrawerItem(
              icon: Icons.toggle_on_outlined,
              text: 'DISABLE UPI ID',
              onTap: () =>
                  Navigator.pushReplacementNamed(context, disable())),
          _createDrawerItem(
              icon: Icons.block,
              text: 'DEREGISTER',
              onTap: () =>
                  Navigator.pushReplacementNamed(context, deregister())),
          _createDrawerItem(
              icon: Icons.contact_support_outlined,
              text: 'FAQs',
              onTap: () =>
                  Navigator.pushReplacementNamed(context, faqs())),
          _createDrawerItem(
              icon: Icons.share_rounded,
              text: 'INVITE',
              onTap: () =>
                  Navigator.pushReplacementNamed(context, invite())),
          _createDrawerItem(
              text: 'Log Out',
              icon: Icons.logout,
              onTap: () =>
                  Navigator.pushReplacementNamed(context, signOut())),
        ],
      ),
    );
  }


  Widget _createDrawerItem(
      {IconData icon, String text, GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(text),
          )
        ],
      ),
      onTap: onTap,
    );
  }*/

  Opacity buildMenuItem(IconData icon, String title,
      {double opacity = 0.3, Color color = Colors.black}) {
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

