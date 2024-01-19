import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_donation_app/Pages/Community/Widgets/myBackButton.dart';

class MyAppBar extends StatelessWidget {
  final Widget centerWidget;
  final Widget rightWidget;

  MyAppBar({required this.centerWidget, required this.rightWidget, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 0.h, left: 24.w),
      child: Container(
          width: double.infinity,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                  width: double.infinity,
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          width: double.infinity,
                          height: 92.h,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color(0xFF5272FC),
                                Color.fromARGB(200, 82, 113, 252),
                                Color(0xFF5272FC)
                              ], // Replace with your desired colors
                            ),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(25.r),
                              bottomLeft: Radius.circular(25.r),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          // width: double.infinity,
                          height: 92.h,
                          child:
                              Image.asset("lib/assets/Community/Appbar1.png"),
                        ),
                      ),
                    ],
                  )),
              Container(
                height: 92.h,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    width: 42.r,
                    height: 42.r,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(25.r),
                        bottomRight: Radius.circular(25.r),
                      ),
                    ),
                    child: Center(
                      child: Padding(
                          padding: EdgeInsets.only(
                              left: 2.w, right: 3, top: 2.h, bottom: 2.h),
                          child: const MyBackButton()),
                    ),
                  ),
                ),
              ),
              Container(
                height: 92.h,
                child:
                    Align(alignment: Alignment.centerLeft, child: centerWidget),
              ),
              Container(
                height: 92.h,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: rightWidget,
                ),
              )
            ],
          )),
    );
  }
}
