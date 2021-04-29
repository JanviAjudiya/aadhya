import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

const _url = 'https://paytm.com/paytmwallet';
const url = 'https://www.paypal.com/in/signin';
const url1 = 'https://play.google.com/store/apps/details?id=com.google.android.apps.nbu.paisa.user';

class UPI_mandate extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UPI Transactions',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'UPI Transactions'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 50.0,
            ),
            Container(
              margin: EdgeInsets.all(25),
              child: FlatButton(
                child: Text('Pay with PayTM', style: TextStyle(fontSize: 20.0),),
                color: Colors.blue[400],
                textColor: Colors.white,
                onPressed: _launchURL,
              ),
            ),
            Container(
              margin: EdgeInsets.all(25),
              child: FlatButton(
                child: Text('Pay with PayPal', style: TextStyle(fontSize: 20.0),),
                color: Colors.blue[400],
                textColor: Colors.white,
                onPressed: _launchURL1,
              ),
            ),
            Container(
              margin: EdgeInsets.all(25),
              child: FlatButton(
                child: Text('Pay with GooglePay', style: TextStyle(fontSize: 20.0),),
                color: Colors.blue[400],
                textColor: Colors.white,
                onPressed: _launchURL2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
void _launchURL() async =>
    await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';

void _launchURL1() async =>
    await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';

void _launchURL2() async =>
    await canLaunch(url1) ? await launch(url1) : throw 'Could not launch $url1';
