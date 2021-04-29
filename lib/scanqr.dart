import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/cupertino.dart';

class ScanScreen extends StatefulWidget {
  @override
  _ScanScreenState createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  double height, width;
  String qrString = "Not Scanned";
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Scan QR Code"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            qrString,
            style: TextStyle(color: Colors.blue, fontSize: 30),
          ),
          ElevatedButton(
            onPressed: scanQR,
            child: Text("Scan QR Code"),
          ),
          SizedBox(width: width),
        ],
      ),
    );
  }

  Future<void> scanQR() async {
    final PermissionStatus permissionStatus = await _getPermission();
    if (permissionStatus == PermissionStatus.granted) {
      try {
        FlutterBarcodeScanner.scanBarcode(
            "#2A99CF", "Cancel", true, ScanMode.QR)
            .then((value) {
          setState(() {
            qrString = value;
          });
        });
      } catch (e) {
        setState(() {
          qrString = "unable to read the qr";
        });
      }
    }
    else {
      //If permissions have been denied show standard cupertino alert dialog
      showDialog(
          context: context,
          builder: (BuildContext context) => CupertinoAlertDialog(
            title: Text('Permissions error'),
            content: Text('Please enable contacts access '
                'permission in system settings'),
            actions: <Widget>[
              CupertinoDialogAction(
                child: Text('OK'),
                onPressed: () => Navigator.of(context).pop(),
              )
            ],
          ));
    }
  }
}
Future<PermissionStatus> _getPermission() async {
  final PermissionStatus permission = await Permission.camera.status;
  if (permission != PermissionStatus.granted &&
      permission != PermissionStatus.denied) {
    final Map<Permission, PermissionStatus> permissionStatus =
    await [Permission.camera].request();
    return permissionStatus[Permission.camera] ??
        PermissionStatus.undetermined;
  } else {
    return permission;
  }
}
