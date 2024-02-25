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
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    login(email, password) async {
      if (await ref
          .read(authStateProvider.notifier)
          .login(email, password, context)) {
        context.router.replace(AppBottomNavigationBarRoute());
        // context.router.replace(OnBoardingScreenRoute());
      }
    }

    final height = MediaQuery.of(context).size.height * 0.017;
    return Form(
      key: _formKey,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20.0),
        width: 0.95 * screenWidth,
        height: 0.5 * screenHeight,
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
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
            SizedBox(height: 30.0),
            Container(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
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
            SizedBox(height: 0.2 * height),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("New User?",
                    style: TextStyle(fontSize: 16, color: Colors.black)),
                TextButton(
                  onPressed: () => context.replaceRoute(SignUpPageRoute()),
                  child: const Text("Create your account",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.green)),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
