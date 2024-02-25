import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_donation_app/Pages/DonationRequest/requestCard.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import '../Community/Functions/toCamelCase.dart';
import '../constants/constants.dart';

class DonationDescriptionHeader extends StatelessWidget {
  final String requestName;
  final String NGOImage;
  final String NGOName;
  final Position ngoPosition;
  final String ngoLocation;
  final String totalRequest;
  final String completedRequest;

  DonationDescriptionHeader({
    required this.requestName,
    required this.NGOName,
    required this.NGOImage,
    required this.ngoLocation,
    required this.ngoPosition,
    required this.totalRequest,
    required this.completedRequest,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 300.h,
      backgroundColor: bgColor,
      elevation: 0.0,
      pinned: false,
      stretch: true,
      flexibleSpace: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return FlexibleSpaceBar(
            background: Stack(
              children: [
                Image.network(
                  NGOImage,
                  fit: BoxFit.cover,
                  height: double.infinity,
                  width: double.infinity,
                  alignment: Alignment.center,
                  errorBuilder: (BuildContext context, Object exception,
                      StackTrace? stackTrace) {
                    return Image.asset(
                      "lib/assets/images/exploreImages/child.jpg",
                      fit: BoxFit.cover,
                      height: double.infinity,
                      width: double.infinity,
                      alignment: Alignment.center,
                    );
                  },
                ),
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.black.withOpacity(0.8),
                          Colors.transparent
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 130.h,
                    width: MediaQuery.of(context).size.width - 40.r,
                    padding: EdgeInsets.symmetric(horizontal: 20.r),
                    child: Row(
                      children: [
                        SizedBox(
                          width:
                              MediaQuery.of(context).size.width - 40.r - 90.w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Text(
                                  toCamelCase(requestName),
                                  style: TextStyle(
                                      color: white,
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.bold,
                                      overflow: TextOverflow.ellipsis),
                                ),
                              ),
                              SizedBox(height: 2.h),
                              Expanded(
                                child: Text(
                                  toCamelCase(NGOName),
                                  style: TextStyle(
                                      color: white,
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w800,
                                      overflow: TextOverflow.ellipsis),
                                ),
                              ),
                              SizedBox(height: 2.h),
                              Row(
                                children: [
                                  GestureDetector(
                                    // onTap: _getCurrentLocation(),
                                    child: Icon(
                                      Icons.place,
                                      color: white,
                                      size: 20.sp,
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      toCamelCase(
                                        ngoLocation,
                                      ),
                                      style: TextStyle(
                                          fontStyle: FontStyle.italic,
                                          color: white.withOpacity(0.8),
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.bold,
                                          overflow: TextOverflow.ellipsis),
                                    ),
                                  ),
                                ],
                                //  Location is displayed here.
                              ),
                              SizedBox(
                                height: 50.h,
                              ),
                            ],
                          ),
                        ),
                        //   hare I have to add the percentage widget.
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10.r),
                          child: Column(
                            children: [
                              getPercent(
                                  completedRequest, totalRequest, Colors.white),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            stretchModes: const [
              StretchMode.blurBackground,
              StretchMode.zoomBackground,
            ],
          );
        },
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(0.0),
        child: Container(
          height: 32.h,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: bgColor, // Set background color to transparent
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(32.r),
              topLeft: Radius.circular(32.r),
            ),
          ),
          child: Container(
            width: 50.w,
            height: 5.h,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(100.0),
            ),
          ),
        ),
      ),
      leadingWidth: 80.w,
      leading: GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Container(
          margin: EdgeInsets.only(top: 10.r, left: 22.r),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(56.r),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
              child: Container(
                height: 56.h,
                width: 56.w,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(0.2),
                ),
                child: Padding(
                  padding: EdgeInsets.only(right: 5.0.r),
                  child: Image.asset(
                    "lib/assets/icons/back.png",
                    width: 25.w,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
