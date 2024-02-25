import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_donation_app/Pages/Community/communityScreen.dart';
import 'package:food_donation_app/Pages/DashBoard/dashBoard.dart';
import 'package:food_donation_app/Pages/Posts/PostsHomePage.dart';
import 'package:food_donation_app/Pages/homePage.dart';
import 'package:food_donation_app/Pages/Donationland/landdonation.dart';

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
    HomePage(),
    PostHomePage(),
    landDonation(),
    CommunityHomePage(),
    DashBoardPage(),
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
        activeIcons: const [
          Icon(Icons.home, color: Colors.green),
          Icon(Icons.article, color: Colors.green),
          Icon(Icons.add, color: Colors.green),
          Icon(Icons.group, color: Colors.green),
          Icon(Icons.account_circle, color: Colors.green),
        ],
        inactiveIcons: [
          Text(
            "Home",
            style: TextStyle(fontSize: 16.sp),
          ),
          Text(
            "Articles",
            style: TextStyle(fontSize: 16.sp),
          ),
          Text(
            "Donate",
            style: TextStyle(fontSize: 16.sp),
          ),
          Text(
            "Community",
            style: TextStyle(fontSize: 16.sp),
          ),
          Text(
            "Profile",
            style: TextStyle(fontSize: 16.sp),
          ),
        ],
        color: Colors.white,
        circleColor: Colors.white,
        height: 60,
        circleWidth: 60,
        activeIndex: tabIndex,
        onTap: (index) {
          // Assuming onTap is the correct method to use
          setState(() {
            tabIndex = index;
          });
          pageController.jumpToPage(index);
        },
        // Other properties as before
      ),
    );
  }
}
