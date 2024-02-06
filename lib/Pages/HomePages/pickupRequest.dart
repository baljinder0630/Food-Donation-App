import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/constants.dart';

@RoutePage()
class PickUpRequest extends StatelessWidget {
  const PickUpRequest({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(30.r),
      ),
      padding: EdgeInsets.all(10.r),
      margin: EdgeInsets.all(10.r),
      alignment: Alignment.center,
      height: 400.h,
      width: 300.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10.r),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    "Idlii Sambhar & Vada, 3kg",
                    style: TextStyle(
                        color: black,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.r),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    "Cooked 4 hrs Ago.",
                    style: TextStyle(
                        color: black,
                        fontSize: 17.sp,
                        overflow: TextOverflow.ellipsis),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: 4,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.only(left: 20.r),
                    child: Align(
                      widthFactor: 0.7,
                      child: CircleAvatar(
                        radius: 65.r,
                        backgroundColor: green,
                        child: CircleAvatar(
                            radius: 60.r,
                            backgroundColor: bgColor,
                            child: Image.asset(
                              "lib/assets/icons/food.png",
                              height: 60.h,
                            )),
                      ),
                    ),
                  );
                }),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 6.r),
                width: 330.w,
                child: Row(
                  children: [
                    Icon(
                      Icons.place,
                      color: red1,
                    ),
                    Expanded(
                      child: Text(
                        "Meerut.",
                        style: TextStyle(
                            fontStyle: FontStyle.italic,
                            color: red1,
                            fontSize: 17.sp,
                            overflow: TextOverflow.ellipsis),
                      ),
                    ),
                  ],
                  //  Location is displayed here.
                ),
              ),
              Container(
                width: 330.w,
                padding: EdgeInsets.only(
                    top: 8.r, bottom: 8.r, left: 11.r, right: 8.r),
                child: Text(
                  "2 km away(approx).",
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    color: black,
                    fontSize: 17.sp,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 135.w,
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(backgroundColor: bgColor),
                  child: SizedBox(
                    width: 230.w,
                    child: Center(
                      child: Text(
                        "Accept",
                        style: TextStyle(
                          fontFamily: textFont,
                          fontStyle: FontStyle.italic,
                          decorationColor: green,
                          decorationThickness: 2,
                          color: green,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 135.w,
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(backgroundColor: green),
                  child: SizedBox(
                    width: 230.w,
                    child: Center(
                      child: Text(
                        "Reject",
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          decorationColor: white,
                          decorationThickness: 2,
                          color: white,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
