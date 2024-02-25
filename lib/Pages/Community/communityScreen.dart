// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_interpolation_to_compose_strings

import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_donation_app/Pages/Community/Widgets/myAppBar.dart';
import 'package:food_donation_app/Pages/Community/Widgets/searchBar.dart';
import 'package:food_donation_app/Pages/Community/connectedUserPage.dart';
import 'package:food_donation_app/Pages/Community/incomingRequests.dart';
import 'package:food_donation_app/Pages/Community/peoplePage.dart';
import 'package:food_donation_app/Provider/communityProvider.dart';
import 'package:food_donation_app/Router/route.gr.dart';

import '../constants/constants.dart';

@RoutePage()
class CommunityHomePage extends ConsumerStatefulWidget {
  const CommunityHomePage({super.key});

  @override
  ConsumerState<CommunityHomePage> createState() => _CommunityHomePageState();
}

class _CommunityHomePageState extends ConsumerState<CommunityHomePage> {
  int selectedCategory = 0;
  List<String> categories = ["All", "Connected", "Requests"];

  // final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Your code here
      ref.read(communityProvider.notifier).getPeoples(0);
      ref.read(communityProvider.notifier).loadChatRooms();
    });

    super.initState();
  }

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
      body: Column(
        children: [
          SizedBox(height: 50.h),
          MyAppBar(
            centerWidget: Padding(
              padding: EdgeInsets.only(left: 57.w),
              child: GestureDetector(
                onTap: () {
                  context.pushRoute(ProfileSearchPageRoute());
                },
                child: MySearchBar(title: "Profile"),
              ),
            ),
            rightWidget: Padding(
              padding: EdgeInsets.only(right: 34.18.w),
              child: GestureDetector(
                onTap: () {
                  context.navigateTo(ChattingPageRoute());
                },
                child: searchHistory(context),
              ),
            ),
          ),
          SizedBox(height: 20.h),
          categoryWidget(),
          SizedBox(height: 20.h),
          Expanded(
            child: GestureDetector(
              onHorizontalDragEnd: (details) {
                log(details.primaryVelocity.toString() +
                    "  " +
                    selectedCategory.toString());
                if (details.primaryVelocity! > 0) {
                  setState(() {
                    selectedCategory--;
                    if (selectedCategory < 0) {
                      selectedCategory = 0;
                    }
                  });
                } else {
                  setState(() {
                    selectedCategory++;
                    if (selectedCategory > 2) {
                      selectedCategory = 2;
                    }
                  });
                }
              },
              child: getSelectedCategoryWidget(selectedCategory),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
        ],
      ),
    );
  }
}

Widget getSelectedCategoryWidget(int selectedCategory) {
  switch (selectedCategory) {
    case 0:
      return PeoplePage();
    case 1:
      return ConnectedUserPage();
    case 2:
      return IncomingRequest();
    default:
      return Center(
        child: Text("Error"),
      ); // Default case, return a default widget or handle accordingly
  }
}

Widget searchHistory(context) {
  return Container(
    width: 28.80,
    height: 28.80,
    clipBehavior: Clip.antiAlias,
    decoration: ShapeDecoration(
      color: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.r),
      ),
    ),
    child: Icon(
      Icons.chat,
      size: 28.8.r,
      color: Color(0xFFFEFEFE),
    ),
  );
}
