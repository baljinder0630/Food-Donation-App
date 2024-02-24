import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IntroScreen3 extends StatelessWidget {
  IntroScreen3({super.key});
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Stack(children: [
      Positioned.fill(
          child: Image.asset('assets/screen3.png', fit: BoxFit.cover)),
      Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Center(
            child: Container(
              height: 200.h,
              width: screenWidth * 0.9,
              padding: EdgeInsets.symmetric(
                  vertical: 10.0, horizontal: screenWidth * 0.05),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      'Show Your Contributions',
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Subtitle',
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ]);
  }
}
