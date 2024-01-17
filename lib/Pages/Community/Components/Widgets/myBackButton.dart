import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyBackButton extends StatelessWidget {
  const MyBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 36.r,
      height: 36.r,
      child: GestureDetector(
        onTap: () {
          context.popRoute();
        },
        child: Container(
          decoration: const ShapeDecoration(
            color: Color(0xFFFEFEFE),
            shape: OvalBorder(),
            shadows: [
              BoxShadow(
                color: Color(0x3F000000),
                blurRadius: 8,
                offset: Offset(0, 0),
                spreadRadius: 0,
              )
            ],
          ),
          child: Padding(
            padding: EdgeInsets.all(7.71.r),
            child: Icon(
              Icons.arrow_back_ios_rounded,
              size: 20.5.r,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
