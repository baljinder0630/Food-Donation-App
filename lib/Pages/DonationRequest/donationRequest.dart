import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_donation_app/Pages/Community/Widgets/myAppBar.dart';
import 'package:food_donation_app/Pages/Community/Widgets/searchBar.dart';
import 'package:food_donation_app/Pages/DonationRequest/requestCard.dart';
import 'package:food_donation_app/Pages/homePage.dart';
import 'package:food_donation_app/Router/route.gr.dart';

@RoutePage()
class DonationRequest extends StatefulWidget {
  const DonationRequest({super.key});

  @override
  State<DonationRequest> createState() => _DonationRequestState();
}

class _DonationRequestState extends State<DonationRequest> {
  var selectedCategory = 0;
  List<String> categories = ["All", "Food Request", "Fund Request"];

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
            heroTag: "button01",
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
                  )),

              MyAppBar(
                  centerWidget: Padding(
                    padding: EdgeInsets.only(left: 57.w),
                    child: MySearchBar(title: "Donation Request"),
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
                  )),
              SizedBox(
                height: 20.h,
              ),
              // categoryWidget(),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  height: 500,
                  child: ListView.builder(
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return DonationRequestCard();
                      }),
                ),
              ),
            ],
          ),
        ));
  }
}
