import 'package:flutter/material.dart';
import 'package:food_donation_app/Pages/HomePages/hungerSpots.dart';
import 'package:food_donation_app/Pages/HomePages/pickupRequest.dart';
import 'package:auto_route/auto_route.dart';

import 'package:food_donation_app/Router/route.gr.dart';




class HomePage extends StatelessWidget {
  final List postId = [
    '11',
    '12',
    '13',
    '14',
  ];

  int _currentPage = 0;

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dashboard')),
      body: SafeArea(
        child: ListView.builder(
            itemCount: 1,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 50,
                        ),
                        SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Row(children: [
                              Text(
                                "Hello, Anupam! ",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    overflow: TextOverflow.ellipsis),
                              ),
                            ]),
                            Row(
                              children: [
                                Icon(Icons.place),
                                Text(
                                  "Meerut.",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17,
                                      overflow: TextOverflow.ellipsis),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    padding: EdgeInsets.all(10),
                    height: 80,
                    decoration: BoxDecoration(
                        color: Colors.lightGreen,
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Nearby hunger spots you can serve in ",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              overflow: TextOverflow.ellipsis),
                        ),
                        Row(
                          children: [
                            Icon(Icons.place),
                            Expanded(
                              child: Text(
                                "Gulbai Tekra, Navrangpura.",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    overflow: TextOverflow.ellipsis),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 320,
                    child: ListView.builder(
                        itemCount: postId.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return HungerSpot(child: postId[index]);
                        }),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    padding: EdgeInsets.all(10),
                    height: 80,
                    decoration: BoxDecoration(
                        color: Colors.lightGreen,
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Food Pickup requests you can serve from",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              overflow: TextOverflow.ellipsis),
                        ),
                        Row(
                          children: [
                            Icon(Icons.place),
                            Expanded(
                              child: Text(
                                "Gulbai Tekra, Navrangpura.",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    overflow: TextOverflow.ellipsis),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 350,
                    child: ListView.builder(
                        itemCount: postId.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return PickUpReequest();
                        }),
                  ),
                ],
              );
            }),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentPage,
        onTap: (int index) {
          // Handle button click for each index
          _handleNavigation(index,context);
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor:Colors.lightGreen
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
            backgroundColor: const Color.fromARGB(255, 74, 139, 195)
            
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
            backgroundColor: const Color.fromARGB(255, 144, 231, 44)
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
            backgroundColor: Colors.red
          ),

        ],

      ),
      


    );
  }


  void _handleNavigation(int index, BuildContext context) {
    switch (index) {
      case 0:
        // Navigate to Home screen
        // context.router.replace(const SplashScreenRoute());
        break;
      case 1:
        // Navigate to Dashboard screen
        context.router.replace(const DashBoardRoute());
        break;
      case 2:
        // Navigate to Profile screen
        // context.router.replace(const ProfilePageRoute());
        break;
      case 3:
        // Navigate to Notifications screen
        // context.router.replace(const NotificationsPageRoute());
        break;
    }
  }


}


