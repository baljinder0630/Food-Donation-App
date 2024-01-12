import 'package:flutter/material.dart';
import 'package:food_donation_app/constants.dart';

class Background extends StatelessWidget {
  final title;
  final customWidget;
  const Background(
      {required this.title, required this.customWidget, super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Container(
          color: primaryColor,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            iconTheme: const IconThemeData(color: Colors.white),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultPadding),
            child: Column(
              children: [
                Text(
                  this.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          resizeToAvoidBottomInset: false,
          bottomSheet: Container(
              height: height * 0.77,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(defaultPadding * 1.5),
                  topRight: Radius.circular(defaultPadding * 1.5),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(defaultPadding),
                child: this.customWidget,
              )),
        )
      ],
    );
  }
}
