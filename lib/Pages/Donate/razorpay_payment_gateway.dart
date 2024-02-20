import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_donation_app/Provider/fundRequestProvider.dart';
import 'package:food_donation_app/Router/route.gr.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class RazorpayPaymentGateway extends ConsumerStatefulWidget {
  const RazorpayPaymentGateway({super.key});

  @override
  ConsumerState<RazorpayPaymentGateway> createState() =>
      _RazorpayPaymentGatewayState();
}

class _RazorpayPaymentGatewayState
    extends ConsumerState<RazorpayPaymentGateway> {
  TextEditingController amountTextEditingController = TextEditingController();
  final _razorpay = Razorpay();

  @override
  void initState() {
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    super.initState();
  }

  showSuccessDialog() {
    showGeneralDialog(
      context: context,
      transitionDuration: Duration(milliseconds: 300),
      barrierDismissible: true,
      barrierLabel: '',
      transitionBuilder: (context, anim1, anim2, child) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, 1),
            end: Offset.zero,
          ).animate(anim1),
          child: child,
        );
      },
      pageBuilder: (context, ani1, ani2) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: SimpleDialog(
            elevation: 0,
            backgroundColor: Colors.transparent,
            children: [
              Container(
                width: 378,
                padding: EdgeInsets.all(19.20),
                decoration: ShapeDecoration(
                  color: Color(0xFFFEFEFE),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28.80),
                  ),
                  shadows: const [
                    BoxShadow(
                      color: Color(0x3F000000),
                      blurRadius: 12,
                      offset: Offset(1.20, 1.20),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Posted Successfully',
                      style: TextStyle(
                        color: Color(0xFF201F24),
                        fontSize: 19.20,
                        fontFamily: 'Outfit',
                        fontWeight: FontWeight.w600,
                        height: 0,
                        letterSpacing: 0.38,
                      ),
                    ),
                    const SizedBox(height: 19.20),
                    Image.asset(
                      "lib/assets/Community/PostSuccessfully.png",
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(height: 19.20),
                    Container(
                      child: const Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'THANK YOU',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF5272FC),
                              fontSize: 19.20,
                              fontStyle: FontStyle.italic,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w800,
                              height: 0,
                              letterSpacing: 4.03,
                            ),
                          ),
                          SizedBox(height: 9.60),
                          SizedBox(
                            width: 323.52,
                            child: Text(
                              '"HOPE IS LIKE A FLAME; IT CAN NEVER BE EXTINGUISHED, EVEN IN THE DARKEST OF TIMES." WE HOPE YOU GET A BETTER SUPPORT',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF201F24),
                                fontSize: 13.44,
                                fontFamily: 'Outfit',
                                fontWeight: FontWeight.w400,
                                height: 0,
                                letterSpacing: 0.54,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 19.20),
                    const Text(
                      'Further Notifications Will be Updated ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF201F24),
                        fontSize: 13.44,
                        fontFamily: 'Outfit',
                        fontWeight: FontWeight.w400,
                        height: 0,
                        letterSpacing: 0.54,
                      ),
                    ),
                    SizedBox(height: 19.20),
                    ElevatedButton(
                      onPressed: () async {
                        await context.pushRoute(const LandDonationRoute());
                      },
                      child: const Center(child: Text('Go back')),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) async {
    String transactionId = response.paymentId ?? '';
    bool success = await ref
        .read(fundRequestProvider.notifier)
        .uploadFundDonationRequest(
            amountTextEditingController.text, transactionId);
    if (success) {
      showSuccessDialog();
    } else {
      Fluttertoast.showToast(
          msg: "Payment could not succeed",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(
        msg: "Payment could not succeed",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {}

  @override
  void dispose() {
    _razorpay.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final paymentStatus = ref.watch(fundRequestProvider).status;
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
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.green),
                child: paymentStatus == 'processing'
                    ? Center(
                        child: SizedBox(
                          width: 20.r,
                          height: 20.r,
                          child: const CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2,
                          ),
                        ),
                      )
                    : Text(
                        'Pay Now',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 28.sp,
                          fontFamily: 'Outfit',
                          fontWeight: FontWeight.w600,
                          height: 0,
                          letterSpacing: 1.12.sp,
                        ),
                      ),
                onPressed: () {
                  var options = {
                    'key': "rzp_test_5qGuiLCMwKPmFo",
                    'amount':
                        (int.parse(amountTextEditingController.text) * 100)
                            .toString(),
                    'name': 'Aahar',
                    'description': 'Aahar Fund Request Payment',
                    'timeout': 300,
                  };
                  _razorpay.open(options);
                })
          ],
        ),
      ),
    );
  }
}
