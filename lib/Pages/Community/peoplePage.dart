import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PeoplePage extends ConsumerStatefulWidget {
  const PeoplePage({super.key});

  @override
  ConsumerState<PeoplePage> createState() => _PeoplePageState();
}

class _PeoplePageState extends ConsumerState<PeoplePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24.w),
      width: 376.w,
      height: 83.h,
      padding: EdgeInsets.all(14.r),
      decoration: ShapeDecoration(
        color: const Color(0xFFFEFEFE),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 59.85.w,
            height: 64.60.h,
            decoration: ShapeDecoration(
              color: Colors.redAccent,
              // image: DecorationImage(
              //   // TODO: Change the image
              //   image: NetworkImage("https://via.placeholder.com/60x65"),
              //   fit: BoxFit.fill,
              // ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(17),
              ),
            ),
          ),
          Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  // TODO: Change the name
                  'Anuj',
                  style: TextStyle(
                    color: Color(0xFF201F24),
                    fontSize: 14.sp,
                    fontFamily: 'Outfit',
                    fontWeight: FontWeight.w600,
                    height: 0,
                    letterSpacing: 0.56.sp,
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  // TODO: Change the name
                  '2639 Following',
                  style: TextStyle(
                    color: Color(0xFF201F24),
                    fontSize: 12.sp,
                    fontFamily: 'Outfit',
                    fontWeight: FontWeight.w300,
                    height: 0,
                    letterSpacing: 0.48.sp,
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 34.40.sp,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 86.70.w,
                      height: 34.40.h,
                      padding: EdgeInsets.symmetric(
                          horizontal: 9.50.w, vertical: 7.60.h),
                      decoration: ShapeDecoration(
                        color: Color(0xFF5272FC),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(9.50.r),
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
                      child: Center(
                        child: Text(
                          // TODO: Change the name
                          'Connect',
                          style: TextStyle(
                            color: Color(0xFFFEFEFE),
                            fontSize: 17.10.sp,
                            fontFamily: 'Outfit',
                            fontWeight: FontWeight.w600,
                            height: 0,
                            letterSpacing: 0.34.sp,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 5.w,
              ),
              Container(
                width: 94.w,
                height: 34.h,
                padding:
                    EdgeInsets.symmetric(horizontal: 9.50.w, vertical: 7.60.h),
                decoration: ShapeDecoration(
                  color: Color(0xFFFEFEFE),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
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
                child: Center(
                  child: Text(
                    'Message',
                    style: TextStyle(
                      color: Color(0xFF201F24),
                      fontSize: 17.10.sp,
                      fontFamily: 'Outfit',
                      fontWeight: FontWeight.w400,
                      height: 0,
                      letterSpacing: 0.34.sp,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
