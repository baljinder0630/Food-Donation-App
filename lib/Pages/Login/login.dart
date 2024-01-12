import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:food_donation_app/Pages/Login/Components/LoginForm.dart';
import 'package:food_donation_app/Pages/Widgets/background.dart';
import 'package:food_donation_app/constants.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Background(
        title: "Sign In",
        customWidget: Scaffold(
          // body: SingleChildScrollView(child: LoginForm()),
          resizeToAvoidBottomInset: true,
          backgroundColor: Colors.transparent,

          bottomSheet: Container(
              color: Colors.white,
              height: height * 0.77,
              child: SingleChildScrollView(child: LoginForm())),
          // bottomSheet: LoginForm(),
        ),
      ),
    );
  }
}
