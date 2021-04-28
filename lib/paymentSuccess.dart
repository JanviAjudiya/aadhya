import 'package:flutter/material.dart';

import './razorpay.dart';

class SuccessPage extends StatelessWidget {
  final PaymentSuccessResponse response;
  SuccessPage({
    @required this.response,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Payment Success"),
      ),
      body: Center(
        child: Container(
          child: Text(
            "Your payment is successful\nPaymentId: ${response.paymentId}",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 22,
              color: Colors.green,
            ),
          ),
        ),
      ),
    );
  }
}