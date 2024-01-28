import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

@RoutePage()
class RazorpayPaymentGateway extends StatefulWidget {
  const RazorpayPaymentGateway({super.key});

  @override
  State<RazorpayPaymentGateway> createState() => _RazorpayPaymentGatewayState();
}

class _RazorpayPaymentGatewayState extends State<RazorpayPaymentGateway> {
  TextEditingController amountTextEditingController = TextEditingController();
  var _razorpay = Razorpay();

  @override
  void initState() {
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    super.initState();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Do something when payment succeeds
    if (kDebugMode) {
      print("Payment Done");
    }
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
    if (kDebugMode) {
      print("Payment Fail");
    }
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet is selected
  }

  @override
  void dispose() {
    _razorpay.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: TextField(
                controller: amountTextEditingController,
                decoration:
                    const InputDecoration(hintText: "Enter your Amount"),
              ),
            ),
            CupertinoButton(
                color: Colors.grey,
                child: const Text("Pay Amount"),
                onPressed: () {
                  var options = {
                    'key': "rzp_test_5qGuiLCMwKPmFo",
                    'amount':
                        (int.parse(amountTextEditingController.text) * 100)
                            .toString(),
                    'name': 'Aahar',
                    'description': 'Aahar Fund Request Payment',
                    'timeout': 300, //in seconds
                  };
                  _razorpay.open(options);
                })
          ],
        ),
      ),
    );
  }
}
