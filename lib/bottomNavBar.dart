import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_donation_app/Pages/Posts/PostsHomePage.dart';
import 'package:food_donation_app/Pages/Community/communityScreen.dart';
import 'package:food_donation_app/Pages/homePage.dart';
import 'package:food_donation_app/Pages/Donationland/landdonation.dart';

import 'Pages/DashBoard/dashBoard.dart';
import 'Pages/GovernmentScheme/schemePage.dart';
import 'Pages/Onboarding/onboarding_screen.dart';
import 'Pages/constants/constants.dart';

@RoutePage()
class AppBottomNavigationBar extends StatefulWidget {
  const AppBottomNavigationBar({super.key});

  @override
  State<AppBottomNavigationBar> createState() => _AppBottomNavigationBarState();
}

class _AppBottomNavigationBarState extends State<AppBottomNavigationBar> {
  late PageController pageController;
  int tabIndex = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  final _pages = [
    const HomePage(),
    const PostHomePage(),
    const landDonation(),
    const CommunityHomePage(),
    const DashBoardPage(),
    // SchemePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        onPageChanged: (index) {
          setState(() => tabIndex = index);
        },
        children: _pages,
      ),
      bottomNavigationBar: CircleNavBar(
        activeIcons: [
          Icon(Icons.home_outlined, color: green, size: 38.r),
          Icon(Icons.group_rounded, color: green, size: 35.r),
          Icon(Icons.explore_outlined, color: green, size: 40.r),
          Icon(Icons.chat_outlined, color: green, size: 35.r),
          Icon(Icons.account_circle_outlined, color: green, size: 38.r),
        ],
        inactiveIcons: [
          Text(
            "Home",
            style: TextStyle(
              fontSize: 14.sp,
            ),
          ),
          Text(
            "Community",
            style: TextStyle(
              fontSize: 14.sp,
            ),
          ),
          Text(
            "Explore",
            style: TextStyle(
              fontSize: 14.sp,
            ),
          ),
          Text(
            "Chat",
            style: TextStyle(
              fontSize: 14.sp,
            ),
          ),
          Text(
            "Profile",
            style: TextStyle(
              fontSize: 14.sp,
            ),
          ),
        ],
        color: Colors.white,
        circleColor: Colors.white,
        height: 63.h,
        circleWidth: 63.w,
        activeIndex: tabIndex,
        onTap: (index) {
          setState(() {
            tabIndex = index;
          });
          pageController.jumpToPage(index);
        },
      ),
    );
  }
}
