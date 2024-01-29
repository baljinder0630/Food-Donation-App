import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../constants/constants.dart';
import 'donationDescription.dart';

class DonationRequestCard extends StatelessWidget {
  const DonationRequestCard({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.only(top: 10.r, left: 10.r, right: 10.r, bottom: 10.r),
      width: double.infinity,
      height: 220.h,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: white,
        ),
      ], borderRadius: BorderRadius.circular(18.r)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10.r),
                      child: CircleAvatar(
                        radius: 28.r,
                        backgroundColor: green,
                        child: CircleAvatar(
                          radius: 25.r,
                          backgroundColor: bgColor,
                          child: Image.asset(
                            "lib/assets/icons/ngo.png",
                            width: 35.w,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      child: Expanded(
                        child: Text(
                          "Feeding India ",
                          style: TextStyle(
                            color: black,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 80.w,
                    )
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 82.h,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10.r),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 120.w,
                                child: Row(
                                  children: [
                                    Icon(Icons.volunteer_activism, size: 20.r),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    Expanded(
                                        child: Text(
                                      "Food Donation",
                                      style: TextStyle(
                                        color: black,
                                        fontSize: 15.sp,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    )),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              SizedBox(
                                width: 120.w,
                                child: Row(
                                  children: [
                                    Icon(Icons.groups, size: 20.r),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    Expanded(
                                        child: Text(
                                      "600 People",
                                      style: TextStyle(
                                        color: black,
                                        fontSize: 15.sp,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    )),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 120.w,
                                child: Row(
                                  children: [
                                    Icon(Icons.verified, size: 20),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    Expanded(
                                        child: Text(
                                      "Karam Foundation",
                                      style: TextStyle(
                                        color: black,
                                        fontSize: 15.sp,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    )),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              SizedBox(
                                width: 120.w,
                                child: Row(
                                  children: [
                                    Icon(Icons.calendar_today, size: 20.r),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    Expanded(
                                        child: Text(
                                      "30/01/2023",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15.sp,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    )),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.r),
                      child: Column(
                        children: [
                          getPercent(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 180.w,
                height: 60.h,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(18.r),
                  ),
                  child: Material(
                    elevation: 4.0,
                    color: bgColor, // Set the elevation as desired
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DonationDescription()),
                        );
                      },
                      child: Center(
                        child: Text(
                          "Know More",
                          style: TextStyle(
                            color: green,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: 180.w,
                height: 60.h,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(18.r),
                  ),
                  child: Material(
                    elevation: 4.0,
                    color: green, // Set the elevation as desired
                    child: InkWell(
                      onTap: () {},
                      child: Center(
                        child: Text(
                          "Donate Now",
                          style: TextStyle(
                            color: white,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
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

Widget getPercent() {
  return Center(
    child: CircularPercentIndicator(
      radius: 35.r,
      percent: 0.4,
      progressColor: green,
      lineWidth: 8,
      backgroundColor: bgColor,
      circularStrokeCap: CircularStrokeCap.round,
      center: Text(
        "40%",
        style: TextStyle(fontSize: 18.sp),
      ),
    ),
  );
}
