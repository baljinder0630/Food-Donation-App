import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_donation_app/Pages/Community/Widgets/myAppBar.dart';
import 'package:food_donation_app/Pages/Community/Widgets/searchBar.dart';
import 'package:food_donation_app/Router/route.gr.dart';

import '../HomePages/pickupRequest.dart';
import '../constants/constants.dart';

@RoutePage()
class PickupRequestPage extends StatefulWidget {
  const PickupRequestPage({super.key});

  @override
  State<PickupRequestPage> createState() => _PickupRequestPageState();
}

class _PickupRequestPageState extends State<PickupRequestPage> {
  var selectedCategory = 0;
  List<String> categories = [
    "All",
    "Fruits & Veggies",
    "Bread & Bakery",
    "Dairy Products",
    "Drinks & Beverages",
    "Packed Items"
  ];

  Widget categoryWidget() {
    return Container(
      margin: EdgeInsets.only(left: 24.w),
      alignment: Alignment.centerLeft,
      height: 43.h,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Row(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedCategory = index;
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(10.r),
                  decoration: ShapeDecoration(
                    color: index == selectedCategory ? green : Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.r),
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
                  child: Text(
                    categories[index],
                    style: TextStyle(
                      color: index == selectedCategory
                          ? const Color(0xFFF9F8FD)
                          : const Color(0xFF201F24),
                      fontSize: 18.sp,
                      fontFamily: 'Outfit',
                      fontWeight: FontWeight.w500,
                      height: 0,
                      letterSpacing: 0.72.sp,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 16.sp),
            ],
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Color(0x3F000000),
              blurRadius: 8,
              offset: Offset(0, 0),
              spreadRadius: 0,
            )
          ],
        ),
        child: FloatingActionButton(
          backgroundColor: const Color(0xffFEFEFE),
          shape: const OvalBorder(),
          onPressed: () {
            context.pushRoute(const PersonalDetailsRoute());
          },
          elevation: 0.0,
          child: Icon(Icons.add_circle_rounded, size: 36.r, color: green),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 5.h),
            MyAppBar(
              centerWidget: Padding(
                padding: EdgeInsets.only(left: 57.w),
                child: GestureDetector(
                  onTap: () {
                    context.pushRoute(const ProfileSearchPageRoute());
                  },
                  child: MySearchBar(title: "Pickup Requests"),
                ),
              ),
              rightWidget: Padding(
                padding: EdgeInsets.only(right: 20.0.r),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: white,
                  ),
                  child: InkWell(
                    onTap: () {
                      context.pushRoute(const DonationTrackingPageRoute());
                    },
                    child: Padding(
                      padding: EdgeInsets.all(5.r),
                      child: Icon(Icons.browse_gallery_outlined),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            categoryWidget(),
            SizedBox(
              height: 20.h,
            ),

            // Here ends the AppBar and filters...

            StreamBuilder<QuerySnapshot>(
              stream:
                  FirebaseFirestore.instance.collection('requests').snapshots(),
              builder: (context, snapshot) {
                List<PickUpRequest> donationRequestWidgets = [];
                if (snapshot.hasData) {
                  final donationRequests =
                      snapshot.data?.docs.reversed.toList();
                  for (var donationRequest in donationRequests!) {
                    final address = donationRequest['plotNo'] +
                        ", " +
                        donationRequest['streetController'] +
                        ", " +
                        donationRequest['districtController'] +
                        ", " +
                        donationRequest['pincodeController'];
                    final createdTime = donationRequest['postedTime'];
                    final cookedBefore = getCookedTime(createdTime);
                    final donationRequestWidget = PickUpRequest(
                      phoneNumber: donationRequest['phoneNumber'],
                      snapshot: snapshot,
                      foodName1: donationRequest['name'],
                      address: address,
                      postedTime: cookedBefore,
                      foodCategory: donationRequest['foodCategory'],
                    );

                    donationRequestWidgets.add(donationRequestWidget);
                  }
                }
                return Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10.r),
                    height: 400.h,
                    child: ListView.builder(
                        itemCount: donationRequestWidgets.length,
                        itemBuilder: (context, index) {
                          return donationRequestWidgets[index];
                        }),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

String getCookedTime(Timestamp creationTimestamp) {
  if (creationTimestamp == null) {
    return "-";
  }

  DateTime creationTime = creationTimestamp.toDate();

  DateTime currentTime = DateTime.now();

  Duration difference = currentTime.difference(creationTime);

  if (difference.inDays > 0) {
    return '${difference.inDays} days';
  } else if (difference.inHours > 0) {
    return '${difference.inHours} hours';
  } else if (difference.inMinutes > 0) {
    return '${difference.inMinutes} minutes';
  } else {
    return '${difference.inSeconds} seconds';
  }
}
