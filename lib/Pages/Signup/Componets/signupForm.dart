import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:food_donation_app/Router/route.gr.dart';
import 'package:food_donation_app/constants.dart';

class SignupForm extends StatelessWidget {
  SignupForm({super.key});

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
          onEditingComplete: () => FocusScope.of(context).nextFocus(),
          keyboardType: TextInputType.name,
          decoration: const InputDecoration(label: Text("Name")),
        ),
        SizedBox(height: height),
        TextFormField(
          onEditingComplete: () => FocusScope.of(context).nextFocus(),
          keyboardType: TextInputType.emailAddress,
          decoration:
              const InputDecoration(label: Text("Email / Phone Number")),
        ),
        SizedBox(height: height),
        TextFormField(
          onEditingComplete: () => FocusScope.of(context).nextFocus(),
          keyboardType: TextInputType.visiblePassword,
          decoration: const InputDecoration(label: Text("Password")),
        ),
        SizedBox(height: height),
        TextFormField(
          onEditingComplete: () => FocusScope.of(context).nextFocus(),
          keyboardType: TextInputType.visiblePassword,
          decoration: const InputDecoration(label: Text("Confirm Password")),
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
              onPressed: () => context.pushRoute(LoginPageRoute()),
              child: const Text("Sign In",
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
