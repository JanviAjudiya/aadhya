import 'package:flutter/material.dart';
import './IFSC.dart';
import './VPA.dart';

//void main() => runApp(MyApp());

class pay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Pay'),
            bottom: TabBar(
              tabs: [
                Tab(text: "VPA",icon: Icon(Icons.alternate_email)),
                Tab(text: "IFSC",icon: Icon(Icons.account_balance_outlined)),
                Tab(text: "QR",icon: Icon(Icons.qr_code)),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              VPA(),
              IFSC(),
              Tab(icon: Icon(Icons.no_photography_outlined),text: "Scan failed"),
            ],
          ),
        ),
      ),
    );
  }
}