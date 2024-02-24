import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_donation_app/Pages/DonationRequest/donationDescriptionHeader.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Community/Functions/toCamelCase.dart';
import '../constants/constants.dart';

@RoutePage()
class DonationDescription extends StatelessWidget {
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

  const DonationDescription({
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
    Key? key,
  }) : super(key: key);

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
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: <Widget>[
          DonationDescriptionHeader(
            requestName: requestName,
            NGOName: NGOName,
            NGOImage: NGOImage,
            ngoPosition: ngoPosition,
            totalRequest: totalRequest,
            completedRequest: completedRequest,
            ngoLocation: ngoLocation,
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(20.0.r),
                  child: Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 100.w - 40.r,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  toCamelCase(
                                      "${timestamp.toDate().day}/${timestamp.toDate().month}/${timestamp.toDate().year} ${timestamp.toDate().hour}:${timestamp.toDate().minute}"),
                                  style: TextStyle(
                                      fontStyle: FontStyle.italic,
                                      color: black,
                                      fontSize: 17.sp,
                                      overflow: TextOverflow.ellipsis),
                                ),
                                SizedBox(
                                  width: 10.r,
                                ),
                                Container(
                                  height: 5.0.r,
                                  width: 5.r,
                                  decoration: BoxDecoration(
                                    color: green,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                SizedBox(
                                  width: 10.r,
                                ),
                                Text(
                                  "$requestType Donation",
                                  style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    color: black,
                                    fontSize: 17.sp,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: requestType == "Fund Donation"
                                      ? Text(
                                          "${getServings(completedRequest)}  of ${getServings(totalRequest)} funds collected",
                                          style: TextStyle(
                                            fontStyle: FontStyle.italic,
                                            color: brown,
                                            fontSize: 17.sp,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        )
                                      : Text(
                                          "${getServings(completedRequest)}  of ${getServings(totalRequest)} requests completed",
                                          style: TextStyle(
                                            fontStyle: FontStyle.italic,
                                            color: brown,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 17.sp,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      //   Here add the call widget...

                      SizedBox(
                        width: 80.w,
                        height: 50.h,
                        child: OutlinedButton(
                          onPressed: () async {
                            final Uri url = Uri(
                              scheme: 'tel',
                              path: phoneNumber,
                            );
                            if (await canLaunchUrl(url)) {
                              await launchUrl(url);
                            } else {
                              if (kDebugMode) {
                                print("Can't make a call to this number");
                              }
                            }
                            // Add your functionality here for making a call
                          },
                          style: OutlinedButton.styleFrom(
                            backgroundColor: null,
                          ),
                          child: Icon(
                            Icons.phone,
                            size: 24,
                            color: brown,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Text(
                    "Description",
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20.r),
                  child: description == ""
                      ? Container(
                          height: 360.h,
                          child: const Center(
                            child: Text("No description"),
                          ),
                        )
                      : Text(
                          description,
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontSize: 18.sp,
                            color: black.withOpacity(0.6),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Center(
                  child: SizedBox(
                    height: 50.h,
                    width: 200.w,
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(backgroundColor: green),
                      child: SizedBox(
                        width: 230.w,
                        child: Center(
                          child: Text(
                            "Proceed",
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                              decorationColor: white,
                              decorationThickness: 2,
                              color: white,
                              fontSize: 17.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50.h,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
