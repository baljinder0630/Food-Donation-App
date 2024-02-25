import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:food_donation_app/Pages/Signup/Componets/signupForm.dart';

@RoutePage()
class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset('assets/sign_up_background.png', fit: BoxFit.fill),
          GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: const SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 100.0),
                  Center(
                    child: Text(
                      'SIGN UP',
                      style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Center(
                    child: Text(
                      'Let\'s create your account!',
                      style: TextStyle(fontSize: 17.0, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  SignupForm()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
