import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_donation_app/Pages/Community/Widgets/myAppBar.dart';
import 'package:food_donation_app/Pages/Community/Widgets/searchBar.dart';
import 'package:food_donation_app/Pages/DonationRequest/requestCard.dart';
import 'package:food_donation_app/Router/route.gr.dart';

import '../homePage.dart';
import 'YourDonationRequest.dart';

@RoutePage()
class DonationRequest extends StatefulWidget {
  const DonationRequest({super.key});

  @override
  State<DonationRequest> createState() => _DonationRequestState();
}

class _DonationRequestState extends State<DonationRequest> {
  var selectedCategory = 0;
  List<String> categories = ["All", "Food Request", "Fund Request"];

  Widget categoryWidget() {
    return Container(
      margin: EdgeInsets.only(left: 24.w),
      alignment: Alignment.centerLeft,
      height: 43.h,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
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
                    color: index == selectedCategory
                        ? Color(0xFF5272FC)
                        : Colors.white,
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
                "Donation Request",
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
                child: MySearchBar(title: "Donation Request"),
              ),
              // static const IconData local_shipping = IconData(0xe3a6, fontFamily: 'MaterialIcons'),
              rightWidget: Padding(
                padding: EdgeInsets.only(
                    right: 16.0.r), // Adjust the left padding as needed
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.local_shipping),
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

            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('ngorequests')
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return SliverToBoxAdapter(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
                List<DocumentSnapshot> documents = snapshot.data!.docs;
                return Expanded(
                    child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  height: 500,
                  child: ListView.builder(
                    itemCount: documents.length,
                    itemBuilder: (context, index) {
                      final document = documents[index];
                      return DonationRequestCard(
                        spotName: document['name'],
                        spotCity: document['city'],
                        noOfServing: document['numberOfServings'],
                        requestType: document['requestType'],
                        percentDone: document['percentageRemaining'],
                        spotStreet: document['streetName'],
                        contactNumber: document['percentageRemaining'],
                        description: document['description'],
                        pincode: document['pinCode'],
                        spotState: document['state'],
                      );
                    },
                  ),
                ));
              },
            ),

            // categoryWidget(),
            //   Expanded(
            //     child: Container(
            //       padding: EdgeInsets.symmetric(vertical: 10),
            //       height: 500,
            //       child: ListView.builder(
            //           itemCount: 5,
            //           itemBuilder: (context, index) {
            //           //   return DonationRequestCard();
            //           // }),
            //     ),
            //   ),
          ],
        ),
      ),
    );
  }
}
