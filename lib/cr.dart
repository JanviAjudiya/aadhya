import 'package:flutter/material.dart';
import './CR_vpa.dart';
import './CR_qr.dart';


class cr extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Collect Request'),
            bottom: TabBar(
              tabs: [
                Tab(text: "VPA",icon: Icon(Icons.alternate_email)),
                Tab(text: "QR",icon: Icon(Icons.qr_code)),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              CR_vpa(),
              CR_qr(),
            ],
          ),
        ),
      ),
    );
  }
}