import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

const _url = 'https://dashboard.razorpay.com/app/payments';
class Transaction extends StatefulWidget {
  @override
  _TransactionState createState() => _TransactionState();
}

class _TransactionState extends State<Transaction> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transaction History'),
      ),
      body: Center(
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