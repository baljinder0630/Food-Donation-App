import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:food_donation_app/Pages/Community/communityScreen.dart';
import 'package:food_donation_app/Pages/DashBoard/dashBoard.dart';
import 'package:food_donation_app/Pages/Donate/personal_details_form.dart';
import 'package:food_donation_app/Pages/Posts/PostsHomePage.dart';
import 'package:food_donation_app/Pages/homePage.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:food_donation_app/Pages/Donationland/landdonation.dart';

import 'Pages/constants/constants.dart';

@RoutePage()
class AppBottomNavigationBar extends StatefulWidget {
  @override
  _AppBottomNavigationBarState createState() => _AppBottomNavigationBarState();
}

class _AppBottomNavigationBarState extends State<AppBottomNavigationBar> {
  int _currentIndex = 0;

  final _pages = [
    HomePage(),
    PostHomePage(),
    // const DonationRequest(),
    // const landDonation(),
    PersonalDetails(),
    const CommunityHomePage(),
    const DashBoardPage(),
    // const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: PersistentTabView(
        context,
        controller: PersistentTabController(initialIndex: _currentIndex),
        screens: _pages,
        items: [
          PersistentBottomNavBarItem(
            icon: const Icon(Icons.home),
            title: 'Home',
            activeColorPrimary: green,
            inactiveColorPrimary: Colors.grey,
          ),
          PersistentBottomNavBarItem(
            icon: const Icon(Icons.comment),
            title: 'Donate Now',
            activeColorPrimary: green,
            inactiveColorPrimary: Colors.grey,
          ),
          PersistentBottomNavBarItem(
            icon: const Icon(Icons.add_alarm),
            title: 'Donate Now',
            activeColorPrimary: green,
            inactiveColorPrimary: Colors.grey,
          ),
          PersistentBottomNavBarItem(
            icon: const Icon(Icons.group),
            title: 'Community',
            activeColorPrimary: green,
            inactiveColorPrimary: Colors.grey,
          ),
          PersistentBottomNavBarItem(
            icon: const Icon(Icons.dashboard),
            title: 'Dashboard',
            activeColorPrimary: green,
            inactiveColorPrimary: Colors.grey,
          ),
        ],
        // ... rest of the configuration remains the same
      ),
    );
  }
}
