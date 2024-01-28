import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pinput/pinput.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_donation_app/Pages/Donate/donateform.dart';

@RoutePage()
class OtpScreen extends StatefulWidget {
  final String id;

  OtpScreen({Key? key, required this.id}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(15),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Colors.orange),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: const Color.fromRGBO(234, 239, 243, 1),
      ),
    );
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.05,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Pinput(
                length: 6,
                defaultPinTheme: defaultPinTheme,
                focusedPinTheme: focusedPinTheme,
                submittedPinTheme: submittedPinTheme,
                pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                showCursor: true,
                onChanged: (pin) => setState(() {
                  _codeController.text = pin;
                }),
                onCompleted: (pin) => setState(() {
                  _codeController.text = pin;
                }),
              ),
              SizedBox(
                height: 40.h,
              ),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState?.validate() ?? false) {
                    // Form is valid, proceed with verification
                    if (kDebugMode) {
                      print(widget.id);
                      print(_codeController.text);
                    }
                    try {
                      PhoneAuthCredential credential =
                          PhoneAuthProvider.credential(
                        verificationId: widget.id,
                        smsCode: _codeController.text,
                      );

                      UserCredential user =
                          await auth.signInWithCredential(credential);
                      if (kDebugMode) {
                        print(user);
                      }
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DonateForm()),
                      );
                    } catch (e) {
                      if (kDebugMode) {
                        print("Error: $e");
                      }
                    }
                  }
                },
                child: const Text("Verify Phone Number"),
              ),
              SizedBox(
                height: 20.h,
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Edit Phone Number?"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
