import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/constants.dart';

class IntroScreen2 extends StatelessWidget {
  IntroScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Stack(children: [
      Positioned.fill(
          child: Image.asset('assets/screen2.png', fit: BoxFit.cover)),
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
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      'Be a Volunteer',
                      style: TextStyle(
                        color: green,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    'Empower change, ignite hope: Be a volunteer and make a difference.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: green.withOpacity(0.6),
                      fontWeight: FontWeight.w400,
                      fontSize: 17.sp,
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
