import 'package:flutter/material.dart';
import 'package:sgp/scanqr.dart';


class scan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Scan'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  print("tapped on scan QR button.");
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) => ScanScreen(),
                    ),
                  );
                },
                child: Text("Scan QR"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}