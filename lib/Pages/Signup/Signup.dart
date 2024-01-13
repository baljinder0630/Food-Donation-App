import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:food_donation_app/Pages/Signup/Componets/signupForm.dart';
import 'package:food_donation_app/Pages/Widgets/background.dart';
import 'package:food_donation_app/constants.dart';

@RoutePage()
class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Background(
        title: "Sign Up",
        customWidget: Scaffold(
          // body: SingleChildScrollView(child: SignupForm()),
          resizeToAvoidBottomInset: true,
          backgroundColor: Colors.transparent,

          bottomSheet: Container(
              color: Colors.white,
              height: height * 0.77,
              child: SingleChildScrollView(child: SignupForm())),
          // bottomSheet: SignupForm(),
        ),
      ),
    );
  }
}
