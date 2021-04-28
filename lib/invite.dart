import 'package:flutter/material.dart';
import 'package:barcode_widget/barcode_widget.dart';

class invite extends StatefulWidget {
  @override
  _invite createState() => _invite();
}

class _invite extends State<invite> {
  String qrString = "Add Data";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Invite"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // qr code
          BarcodeWidget(
            color: Colors.blue,
            data: qrString,
            height: 250,
            width: 250,
            barcode: Barcode.qrCode(),
          ),
          // link
          Container(
            width: MediaQuery.of(context).size.width * .8,
            child: TextField(
              onChanged: (val) {
                setState(() {
                  qrString = val;
                });
              },
              decoration: InputDecoration(
                hintText: "Enter you email id",
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blue,
                    width: 2,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
          ),
          SizedBox(
            height: 30.0,
          ),
          IconButton(
              icon: Icon(Icons.share),
              color: Colors.blueAccent,
              onPressed: (){})
        ],
      ),
    );
  }
}