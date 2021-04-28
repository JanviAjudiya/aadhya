import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sgp/paymentFailed.dart';
import 'package:sgp/paymentSuccess.dart';
import './VPA.dart';
import './razorpay.dart';

class CheckRazor extends StatefulWidget {
  final amountHolder;
  final remarkHolder;
  final nameHolder;
  final phoneHolder;
  const CheckRazor({Key key, this.nameHolder, this.phoneHolder, this.amountHolder, this.remarkHolder}) : super(key: key);

  @override
  _CheckRazorState createState() => _CheckRazorState(this.nameHolder, this.phoneHolder, this.amountHolder, this.remarkHolder);
}

class _CheckRazorState extends State<CheckRazor> {
  Razorpay _razorpay = Razorpay();
  final amountHolder;
  final remarkHolder;
  final nameHolder;
  final phoneHolder;
  var options;

  _CheckRazorState(this.nameHolder, this.phoneHolder, this.amountHolder, this.remarkHolder);
  Future payData() async {
    try {
      _razorpay.open(options);
    } catch (e) {
      print("errror occured here is ......................./:$e");
    }

    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) async {
    print("payment has succedded");
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => SuccessPage(
          response: response,
        ),
      ),
          (Route<dynamic> route) => false,
    );
    _razorpay.clear();
    // Do something when payment succeeds
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    print("payment has error00000000000000000000000000000000000000");
    // Do something when payment fails
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => FailedPage(
          response: response,
        ),
      ),
          (Route<dynamic> route) => false,
    );
    _razorpay.clear();
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    print("payment has externalWallet33333333333333333333333333");

    _razorpay.clear();
    // Do something when an external wallet is selected
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    options = {
      'key': "rzp_test_xtqtwAu5AmQpgn", // Enter the Key ID generated from the Dashboard

      'amount': amountHolder, //in the smallest currency sub-unit.
      'name': nameHolder,
      'currency': "INR",
      'theme.color': "0FF2196F3",
      'buttontext': "Pay with Razorpay",
      'description': remarkHolder,
      'prefill': {
        'contact': phoneHolder,
        'email': 'barbie@example.com',
      }
    };
  }

  @override
  Widget build(BuildContext context) {
    // print("razor runtime --------: ${_razorpay.runtimeType}");
    return Scaffold(
      body: FutureBuilder(
          future: payData(),
          builder: (context, snapshot) {
            return Container(
              child: Center(
                child: Text(
                  "Loading...",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            );
          }),
    );
  }
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('amountHolder', amountHolder));
  }
}