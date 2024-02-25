import 'package:flutter/material.dart';

class Subheading extends StatelessWidget {
  final String text;
  double? fontSize;
  bool? isBold;
  Subheading({super.key, required this.text, this.fontSize, this.isBold});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: fontSize ?? 25.0,
            fontWeight: isBold != null ? FontWeight.normal : FontWeight.bold),
      ),
    );
  }
}
