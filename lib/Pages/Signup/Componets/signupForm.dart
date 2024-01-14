import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:food_donation_app/Provider/userProvider.dart';
import 'package:food_donation_app/Router/route.gr.dart';
import 'package:food_donation_app/constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignupForm extends ConsumerStatefulWidget {
  const SignupForm({super.key});

  @override
  ConsumerState<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends ConsumerState<SignupForm> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    signup(email, password, name) async {
      if (await ref
          .read(authStateProvider.notifier)
          .signUp(email, password, name, context)) {
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
            controller: _nameController,
            onEditingComplete: () => FocusScope.of(context).nextFocus(),
            keyboardType: TextInputType.name,
            maxLength: 25,
            decoration:
                const InputDecoration(label: Text("Name"), counterText: ""),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          SizedBox(height: height),
          TextFormField(
            controller: _emailController,
            onEditingComplete: () => FocusScope.of(context).nextFocus(),
            keyboardType: TextInputType.emailAddress,
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
            controller: _passwordController,
            onEditingComplete: () => FocusScope.of(context).nextFocus(),
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
            decoration: const InputDecoration(label: Text("Password")),
            validator: (passCurrentValue) {
              RegExp upperCaseRegex = RegExp(r'(?=.*?[A-Z])');
              RegExp lowerCaseRegex = RegExp(r'(?=.*?[a-z])');
              RegExp digitRegex = RegExp(r'(?=.*?[0-9])');
              RegExp specialCharRegex = RegExp(r'(?=.*?[!@#\$&*~])');

              var passNonNullValue = passCurrentValue ?? "";
              List<String> errors = [];
              if (passNonNullValue.length < 8) {
                errors.add("min. 8 chars");
              }
              if (!upperCaseRegex.hasMatch(passNonNullValue)) {
                errors.add("uppercase(A-Z)");
              }
              if (!lowerCaseRegex.hasMatch(passNonNullValue)) {
                errors.add("lowercase (a-z)");
              }
              if (!digitRegex.hasMatch(passNonNullValue)) {
                errors.add("digit (0-9)");
              }
              if (!specialCharRegex.hasMatch(passNonNullValue)) {
                errors.add("special char (!@#\$&*~)");
              }
              return errors.isEmpty ? null : "Add " + errors.join(', ');
            },
          ),
          SizedBox(height: height),
          TextFormField(
            controller: _confirmPasswordController,
            onEditingComplete: () => FocusScope.of(context).nextFocus(),
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
            decoration: const InputDecoration(label: Text("Confirm Password")),
            validator: (passCurrentValue) {
              var passNonNullValue = passCurrentValue ?? "";
              if (passNonNullValue.isEmpty) {
                return ("Confirm Password is required");
              } else if (passNonNullValue != _passwordController.text) {
                return ("Password does not match");
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
                  signup(
                      _emailController.text.trim(),
                      _passwordController.text.trim(),
                      _nameController.text.trim());
              },
              child: ref.watch(authStateProvider).authStatus ==
                      AuthStatus.processing
                  ? const CircularProgressIndicator(
                      color: Colors.white,
                    )
                  : const Text(
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
                onPressed: () => context.replaceRoute(LoginPageRoute()),
                child: const Text("Sign In",
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
