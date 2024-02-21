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
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    signup(email, password, name) async {
      if (await ref
          .read(authStateProvider.notifier)
          .signUp(email, password, name, context)) {
        context.router.replace(AppBottomNavigationBarRoute());
      }
    }

    final height = MediaQuery.of(context).size.height * 0.017;
    return Form(
      key: _formKey,
      child: Container(
        width: 0.95 * screenWidth,
        height: 0.75 * screenHeight,
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: height),
            TextFormField(
              controller: _nameController,
              cursorColor: Colors.green,
              keyboardType: TextInputType.text,
              onEditingComplete: () => FocusScope.of(context).nextFocus(),
              decoration: InputDecoration(
                hintText: 'Name',
                prefixIcon: const Icon(Icons.person),
                hintStyle: const TextStyle(
                  color: Colors.black,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.green,
                    width: 1.5,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.green,
                    width: 1.5,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.green,
                    width: 1.5,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.green,
                    width: 1.5,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                errorStyle: const TextStyle(color: Colors.black),
              ),
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
              cursorColor: Colors.green,
              keyboardType: TextInputType.text,
              onEditingComplete: () => FocusScope.of(context).nextFocus(),
              decoration: InputDecoration(
                hintText: 'Email',
                prefixIcon: const Icon(Icons.email),
                hintStyle: const TextStyle(
                  color: Colors.black,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.green,
                    width: 1.5,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.green,
                    width: 1.5,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.green,
                    width: 1.5,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.green,
                    width: 1.5,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                errorStyle: const TextStyle(color: Colors.black),
              ),
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
              cursorColor: Colors.green,
              keyboardType: TextInputType.visiblePassword,
              onEditingComplete: () => FocusScope.of(context).nextFocus(),
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Password',
                prefixIcon: const Icon(Icons.lock),
                hintStyle: const TextStyle(
                  color: Colors.black,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.green,
                    width: 1.5,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.green,
                    width: 1.5,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.green,
                    width: 1.5,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.green,
                    width: 1.5,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                errorStyle: const TextStyle(color: Colors.black),
              ),
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
              cursorColor: Colors.green,
              keyboardType: TextInputType.visiblePassword,
              onEditingComplete: () => FocusScope.of(context).nextFocus(),
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Confirm Password',
                prefixIcon: const Icon(Icons.lock_person),
                hintStyle: const TextStyle(
                  color: Colors.black,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.green,
                    width: 1.5,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.green,
                    width: 1.5,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.green,
                    width: 1.5,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.green,
                    width: 1.5,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                errorStyle: const TextStyle(color: Colors.black),
              ),
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
            SizedBox(height: height * 2),
            Container(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
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
      ),
    );
  }
}
