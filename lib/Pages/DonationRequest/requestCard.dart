import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../Router/route.gr.dart';
import '../constants/constants.dart';

class DonationRequestCard extends StatelessWidget {
  final String spotName;
  final bool requestType;
  final String noOfServing;
  final String spotCity;
  final String contactNumber;
  final String description;
  final String percentDone;
  final String pincode;
  final String spotState;
  final String spotStreet;

  const DonationRequestCard(
      {super.key,
      required this.spotName,
      required this.spotCity,
      required this.noOfServing,
      required this.requestType,
      required this.percentDone,
      required this.contactNumber,
      required this.description,
      required this.pincode,
      required this.spotState,
      required this.spotStreet});

  String getReq() {
    if (requestType == true) {
      return "Food Donation";
    }
    return "Fund Donation";
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.only(top: 10.r, left: 10.r, right: 10.r, bottom: 10.r),
      width: double.infinity,
      height: 250.h,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: white,
        ),
      ], borderRadius: BorderRadius.circular(20.r)),
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
                            width: 35.r,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      child: Expanded(
                        child: Text(
                          spotName,
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
                                      getReq(),
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
                                      "${noOfServing} People",
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
                                      spotStreet,
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
                          getPercent(percentDone, noOfServing),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(bottom: 10.r),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: 180.w,
                  child: OutlinedButton(
                    onPressed: () {
                      context.pushRoute(const DonationDescriptionRoute());
                    },
                    style: OutlinedButton.styleFrom(backgroundColor: bgColor),
                    child: SizedBox(
                      width: 230.w,
                      child: Center(
                        child: Text(
                          "Know More",
                          style: TextStyle(
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
                  width: 180.w,
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(backgroundColor: green),
                    child: SizedBox(
                      width: 230.w,
                      child: Center(
                        child: Text(
                          "Donate Now",
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            decorationColor: white,
                            decorationThickness: 2,
                            color: white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
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

Widget getPercent(String percentRem, String noOfServings) {
  double percentDone = 0.4;
  // double.parse(percentRem) / double.parse(noOfServings) - 1.0;
  return Center(
    child: CircularPercentIndicator(
      radius: 35.r,
      percent: percentDone,
      progressColor: green,
      lineWidth: 5.r,
      backgroundColor: bgColor,
      circularStrokeCap: CircularStrokeCap.round,
      center: Text(
        "40%",
        style: TextStyle(fontSize: 18.sp),
      ),
    ),
  );
}
