import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

const _url = 'https://dashboard.razorpay.com/app/payments';

class history extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "History",
      home: Material(
        child: Center(
          child: RaisedButton(
            onPressed: _launchURL,
            color: Colors.blue,
            child: Text('Show History'),
          ),
        ),
      ),
    );
  }
}


void _launchURL() async =>
    await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';