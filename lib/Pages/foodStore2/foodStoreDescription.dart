import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_donation_app/Pages/DonationRequest/donationDescriptionHeader.dart';
import 'package:food_donation_app/Pages/foodStore2/foodStoreDescriptionHeader.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Community/Functions/toCamelCase.dart';
import '../constants/constants.dart';

@RoutePage()
class FoodStoreDescription extends StatelessWidget {
  // final String requestName;
  // final String NGOName;
  // final String ngoLatitude;
  // final String ngoLongitude;
  // final String totalRequest;
  // final String remainingRequest;
  // final Timestamp timestamp;
  // final String description;
  // final String phoneNumber;

  const FoodStoreDescription({
    // required this.requestName,
    // required this.NGOName,
    // required this.ngoLatitude,
    // required this.ngoLongitude,
    // required this.totalRequest,
    // required this.remainingRequest,
    // required this.timestamp,
    // required this.description,
    // required this.phoneNumber,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: <Widget>[
          FoodStoreDescriptionHeader(),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(20.0.r),
                  child: Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width - 100.w - 40.r,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Time",
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
                                  "Food Request",
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
                                  child: Text(
                                    "remainingRequest of totalRequest completed",
                                    style: TextStyle(
                                      fontStyle: FontStyle.italic,
                                      color: red1,
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
                              path: "phoneNumber",
                            );
                            if (await canLaunchUrl(url)) {
                              await launchUrl(url);
                            } else {
                              print("Can't make a call to this number");
                            }
                            // Add your functionality here for making a call
                          },
                          style: OutlinedButton.styleFrom(
                            backgroundColor: null,
                          ),
                          child: Icon(
                            Icons.phone,
                            // You can replace Icons.phone with any other icon you prefer
                            size: 24, // Adjust the size of the icon as needed
                            color: red1, // Color of the icon
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
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  padding: EdgeInsets.all(10.r),
                  height: 320.h,
                  child: "description" == ""
                      ? Center(
                          child: Text("No description"),
                        )
                      : Text(
                          "description",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontSize: 18.sp,
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
