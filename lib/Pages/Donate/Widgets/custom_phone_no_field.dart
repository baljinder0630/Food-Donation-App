import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:food_donation_app/constants.dart';

class CustomPhoneNumberField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;

  const CustomPhoneNumberField({
    super.key,
    required this.hintText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      dropdownIcon: const Icon(
        Icons.arrow_drop_down,
        color: Colors.black,
      ),
      controller: controller,
      showCountryFlag: true,
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
            borderRadius: BorderRadius.circular(10.0)),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: primaryColor,
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(10.0)),
        errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: primaryColor,
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(10.0)),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: primaryColor,
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(10.0)),
        errorStyle: const TextStyle(color: Colors.black),
      ),
      cursorColor: primaryColor,
      initialCountryCode: 'IN',
    );
  }
}
