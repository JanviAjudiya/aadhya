import 'package:flutter/material.dart';
import './VPA.dart';


class pay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 1,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Pay'),
            bottom: TabBar(
              tabs: [
                Tab(text: "VPA",icon: Icon(Icons.alternate_email)),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              VPA(),
            ],
          ),
        ),
      ),
    );
  }
}