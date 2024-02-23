import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_donation_app/constants.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController controller;

  const CustomTextField({
    super.key,
    required this.hintText,
    this.inputFormatters,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: 10,
      inputFormatters: inputFormatters,
      controller: controller,
      cursorColor: primaryColor,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.black,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: primaryColor,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: primaryColor,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: primaryColor,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: primaryColor,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        errorStyle: const TextStyle(color: Colors.black),
      ),
    );
  }
}
