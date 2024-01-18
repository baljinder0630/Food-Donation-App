import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_donation_app/Pages/DonationRequest/requestCard.dart';

import '../Community/Components/Widgets/Spacer.dart';
import '../Community/communityScreen.dart';

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
        body: SafeArea(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: Text(
              "Donation Request",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.ellipsis),
            ),
          ),
          customAppBarBg(context, Searchbar(context), SearchHistory(context)),
          MySpacer(),
          categoryWidget(),

          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              height: 500,
              child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return DonationCard();
                  }),
            ),
          ),
        ],
      ),
    ));
  }

  Widget categoryWidget() {
    return Container(
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
}

Widget filterCard(BuildContext context) {
  final List<String> filters = [
    "All",
    "Food Request",
    "Fund Request",
    "Food Request",
    "Fund Request"
  ];
  return ListView.builder(
    scrollDirection: Axis.horizontal,
    itemCount: filters.length,
    itemBuilder: (context, index) {
      return Container(
          // width: 30,
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.lightGreen),
          child: Center(
            child: Text("${filters[index]}"),
          ));
    },
  );
}
