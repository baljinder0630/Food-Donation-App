import 'dart:math';
import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_donation_app/Pages/Community/Functions/toCamelCase.dart';
import 'package:geolocator/geolocator.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../../Router/route.gr.dart';
import '../constants/constants.dart';

class DonationRequestCard extends StatelessWidget {
  final String requestName;
  final String NGOName;
  final String NGOImage;
  final Position ngoPosition;
  final String totalRequest;
  final String completedRequest;
  final String ngoLocation;
  final Timestamp timestamp;
  final String description;
  final String phoneNumber;
  final String requestType;
  final String ngoID;

  const DonationRequestCard(
      {super.key,
      required this.requestName,
      required this.NGOName,
      required this.NGOImage,
      required this.ngoPosition,
      required this.totalRequest,
      required this.completedRequest,
      required this.ngoLocation,
      required this.timestamp,
      required this.description,
      required this.phoneNumber,
      required this.requestType,
      required this.ngoID});

  String getServings(String str) {
    int num = int.parse(str);
    if (num > 1e9) {
      return "${(num / 1e9).toStringAsFixed(1)}B";
    }
    if (num > 1e6) {
      return "${(num / 1e6).toStringAsFixed(1)}M";
    }
    if (num > 1e3) {
      return "${(num / 1e3).toStringAsFixed(1)}K";
    }
    return "$num";
  }

  @override
  Widget build(BuildContext context) {
    DateTime dateTime = timestamp.toDate(); // Convert Timestamp to DateTime
    String date = "${dateTime.day}/${dateTime.month}/${dateTime.year}";

    return Container(
      margin: EdgeInsets.only(left: 10.r, right: 10.r, bottom: 10.r),
      width: double.infinity,
      height: 205.h,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: white,
        ),
      ], borderRadius: BorderRadius.circular(20.r)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(10.r),
                    child: CircleAvatar(
                      radius: 27.r,
                      backgroundColor: black,
                      child: CircleAvatar(
                        radius: 25.r,
                        backgroundColor: bgColor,
                        child: ClipOval(
                          child: Image.network(
                            NGOImage,
                            fit: BoxFit.cover,
                            height: double.infinity,
                            width: double.infinity,
                            alignment: Alignment.center,
                            errorBuilder: (BuildContext context,
                                Object exception, StackTrace? stackTrace) {
                              return Image.asset(
                                "lib/assets/icons/ngo.png",
                                fit: BoxFit.cover,
                                height: double.infinity,
                                width: double.infinity,
                                alignment: Alignment.center,
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: Text(
                      toCamelCase(
                        requestName,
                      ),
                      style: TextStyle(
                        color: black,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: double.infinity,
                height: 72.h,
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
                                width: 150.w,
                                child: Row(
                                  children: [
                                    Icon(Icons.volunteer_activism, size: 20.r),
                                    SizedBox(
                                      width: 8.w,
                                    ),
                                    Expanded(
                                        child: Text(
                                      "$requestType Donation",
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
                                width: 10.w,
                              ),
                              SizedBox(
                                width: 135.w,
                                child: Row(
                                  children: [
                                    Icon(Icons.groups, size: 20.r),
                                    SizedBox(
                                      width: 8.w,
                                    ),
                                    Expanded(
                                        child: Text(
                                      "${getServings(totalRequest)} People",
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
                                width: 150.w,
                                child: Row(
                                  children: [
                                    Icon(Icons.verified, size: 20.r),
                                    SizedBox(
                                      width: 8.w,
                                    ),
                                    Expanded(
                                        child: Text(
                                      toCamelCase(
                                        NGOName,
                                      ),
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
                                width: 10.w,
                              ),
                              SizedBox(
                                width: 135.w,
                                child: Row(
                                  children: [
                                    Icon(Icons.calendar_today, size: 20.r),
                                    SizedBox(
                                      width: 8.w,
                                    ),
                                    Expanded(
                                        child: Text(
                                      date,
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
                          getPercent(
                              completedRequest, totalRequest, Colors.black),
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
                  width: 190.w,
                  child: OutlinedButton(
                    onPressed: () {
                      context.pushRoute(
                        DonationDescriptionRoute(
                          requestName: requestName,
                          NGOName: NGOName,
                          NGOImage: NGOImage,
                          ngoPosition: ngoPosition,
                          totalRequest: totalRequest,
                          completedRequest: completedRequest,
                          ngoLocation: ngoLocation,
                          timestamp: timestamp,
                          description: description,
                          phoneNumber: phoneNumber,
                          requestType: requestType,
                        ),
                      );
                    },
                    style: OutlinedButton.styleFrom(backgroundColor: bgColor),
                    child: SizedBox(
                      width: 250.w,
                      child: Center(
                        child: Text(
                          "Know More",
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            decorationColor: green,
                            decorationThickness: 2,
                            color: green,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 190.w,
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(backgroundColor: green),
                    child: SizedBox(
                      width: 250.w,
                      child: Center(
                        child: Text(
                          "Donate Now",
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
            ),
          ),
        ],
      ),
    );
  }
}

Widget getPercent(String reqFulfilled, String totalReq, Color perColor) {
  double tr = double.parse(totalReq);
  double rf = double.parse(reqFulfilled);
  double percentDone = min(1.0, (rf / tr));
  return Center(
    child: CircularPercentIndicator(
      radius: 35.r,
      percent: percentDone,
      progressColor: green,
      lineWidth: 5.r,
      backgroundColor: bgColor,
      circularStrokeCap: CircularStrokeCap.round,
      center: Text(
        "${(percentDone * 100.0).toStringAsFixed(1)}%",
        style: TextStyle(fontSize: 17.sp, color: perColor),
      ),
    ),
  );
}
