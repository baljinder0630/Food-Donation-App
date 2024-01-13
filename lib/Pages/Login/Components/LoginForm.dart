import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:food_donation_app/Provider/userProvider.dart';
import 'package:food_donation_app/Router/route.gr.dart';
import 'package:food_donation_app/constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginForm extends ConsumerStatefulWidget {
  const LoginForm({super.key});

  @override
  ConsumerState<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends ConsumerState<LoginForm> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    login(email, password) async {
      if (await ref.read(authStateProvider.notifier).login(email, password)) {
        context.router.replace(const HomePageRoute());
      }
    }

    final height = MediaQuery.of(context).size.height * 0.017;
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Welcome",
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: height),
          TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            onEditingComplete: () => FocusScope.of(context).nextFocus(),
            decoration: const InputDecoration(label: Text("Email")),
            validator: (passCurrentValue) {
              RegExp regex = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
              var passNonNullValue = passCurrentValue ?? "";
              if (passNonNullValue.isEmpty) {
                return ("Email is required");
              } else if (!regex.hasMatch(passNonNullValue.trim())) {
                return ("Invalid Email! ");
              }
              return null;
            },
          ),
          SizedBox(height: height),
          TextFormField(
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
            onEditingComplete: () => FocusScope.of(context).nextFocus(),
            decoration: const InputDecoration(label: Text("Password")),
            controller: _passwordController,
            validator: (value) {
              var passNonNullValue = value ?? "";
              if (passNonNullValue.isEmpty) {
                return ("Password is required");
              } else if (passNonNullValue.length < 8) {
                return ("Password must be 8 characters long");
              }
              return null;
            },
          ),
          SizedBox(height: height * 7),
          Container(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate() &&
                    ref.watch(authStateProvider).authStatus !=
                        AuthStatus.processing)
                  login(_emailController.text.trim(),
                      _passwordController.text.trim());
              },
              child: ref.watch(authStateProvider).authStatus ==
                      AuthStatus.processing
                  ? const CircularProgressIndicator(
                      color: Colors.white,
                    )
                  : const Text(
                      "Sign In",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
            ),
          ),
          SizedBox(height: height),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Don't have account?",
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
      ),
    );
  }
}
