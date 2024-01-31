import 'package:flutter/material.dart';

class Subheading extends StatelessWidget {
  final String text;
  const Subheading({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: const TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
      ),
    );
  }
}
