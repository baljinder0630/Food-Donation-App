import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_donation_app/Pages/Community/Widgets/myAppBar.dart';
import 'package:food_donation_app/Pages/Community/Widgets/searchBar.dart';
import 'package:food_donation_app/Pages/DonationRequest/requestCard.dart';
import 'package:food_donation_app/Router/route.gr.dart';

import '../HomePages/pickupRequest.dart';
import '../homePage.dart';
import 'YourDonationRequest.dart';

@RoutePage()
class PickupRequestPage extends StatefulWidget {
  const PickupRequestPage({super.key});

  @override
  State<PickupRequestPage> createState() => _PickupRequestPageState();
}

class _PickupRequestPageState extends State<PickupRequestPage> {
  var selectedCategory = 0;
  List<String> categories = ["AllPIXKUPSFDJI", "Food Request", "Fund Request"];

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
          backgroundColor: Color(0xffFEFEFE),
          shape: OvalBorder(),
          onPressed: () {
            context.pushRoute(const RaiseRequestRoute());
          },
          elevation: 0.0,
          child: Icon(Icons.add_circle_rounded,
              size: 36.r, color: Color(0xFF5272FC)),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              child: const Text(
                "PickUp Request",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis),
              ),
            ),
            MyAppBar(
              centerWidget: Padding(
                padding: EdgeInsets.only(left: 57.w),
                child: MySearchBar(title: "Pickup Request"),
              ),
              // static const IconData local_shipping = IconData(0xe3a6, fontFamily: 'MaterialIcons'),
              rightWidget: Padding(
                padding: EdgeInsets.only(
                    right: 16.0), // Adjust the left padding as needed
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: IconButton(
                    icon: Icon(Icons.local_shipping),
                    onPressed: () {
                      context.pushRoute(const DonationTrackingPageRoute());
                    },
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
            // categoryWidget(),
            //   Expanded(
            //     child: Container(
            //       padding: EdgeInsets.symmetric(vertical: 10),
            //       height: 500,
            //       child: ListView.builder(
            //           itemCount: 5,
            //           itemBuilder: (context, index) {
            //           //   return DonationRequestCard(
            //           //     spotName: null,
            //           //     spotCity: null,
            //           //     noOfServing: null,
            //           //     requestType: null,
            //           //   );
            //           // }),
            //     ),
            //   ),

            StreamBuilder<QuerySnapshot>(
              stream:
                  FirebaseFirestore.instance.collection('requests').snapshots(),
              builder: (context, snapshot) {
                List<PickUpRequest> donationRequestWidgets = [];
                if (snapshot.hasData) {
                  final donationRequests =
                      snapshot.data?.docs.reversed.toList();
                  for (var donationRequest in donationRequests!) {
                    final donationRequestWidget = PickUpRequest(
                      foodName: donationRequest['name'],
                      address: donationRequest['pincodeController'],
                      foodCategory: donationRequest['foodCategory'],
                      postedTime: '3',
                    );

                    donationRequestWidgets.add(donationRequestWidget);
                  }
                }
                return Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    height: 500,
                    child: ListView.builder(
                        itemCount: 5,
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
