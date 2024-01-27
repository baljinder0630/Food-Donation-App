import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MySearchBar extends StatefulWidget {
  const MySearchBar({super.key});

  @override
  State<MySearchBar> createState() => _MySearchBarState();
}

class _MySearchBarState extends State<MySearchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260.w,
      height: 45.83.h,
      decoration: ShapeDecoration(
        color: Color(0xFFFEFEFE),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.r),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 8,
            offset: Offset(0, 0),
            spreadRadius: 0,
          )
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 24.r,
            height: 24.r,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(),
            child: Icon(Icons.search_rounded, size: 24.r, color: Colors.black),
          ),
          SizedBox(width: 8.w),
          Text(
            'Search For ',
            style: TextStyle(
              color: Color(0xFF201F24),
              fontSize: 18.sp,
              fontFamily: 'Outfit',
              fontWeight: FontWeight.w400,
              height: 0,
              letterSpacing: 0.36.sp,
            ),
          ),
          Container(
            height: 23.h,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Articles',
                  style: TextStyle(
                    color: Color(0xFF5272FC),
                    fontSize: 18.sp,
                    fontFamily: 'Outfit',
                    fontWeight: FontWeight.w400,
                    height: 0,
                    letterSpacing: 0.36.sp,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
