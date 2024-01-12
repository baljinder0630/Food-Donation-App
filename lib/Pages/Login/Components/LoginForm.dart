import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:food_donation_app/Router/route.gr.dart';
import 'package:food_donation_app/constants.dart';

class LoginForm extends StatelessWidget {
  LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 0.017;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Welcome",
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: height),
        TextFormField(
          keyboardType: TextInputType.emailAddress,
          onEditingComplete: () => FocusScope.of(context).nextFocus(),
          decoration:
              const InputDecoration(label: Text("Email / Phone Number")),
        ),
        SizedBox(height: height),
        TextFormField(
          keyboardType: TextInputType.visiblePassword,
          onEditingComplete: () => FocusScope.of(context).nextFocus(),
          decoration: const InputDecoration(label: Text("Password")),
        ),
        SizedBox(height: height * 7),
        Container(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            onPressed: () {},
            child: const Text(
              "Sign Up",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),
        SizedBox(height: height),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Already have an account?",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey)),
            TextButton(
              onPressed: () => context.pushRoute(SignUpPageRoute()),
              child: const Text("Sign Up",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: primaryColor)),
            )
          ],
        ),
      ],
    );
  }
}
