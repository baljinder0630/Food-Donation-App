import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_donation_app/Pages/constants/constants.dart';
import 'package:food_donation_app/Router/route.gr.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../Community/Widgets/myAppBar.dart';
import '../Community/communityScreen.dart';

@RoutePage()
class landDonation extends ConsumerStatefulWidget {
  const landDonation({super.key});

  @override
  ConsumerState<landDonation> createState() => CharityHomePage();
}

class CharityHomePage extends ConsumerState<landDonation> {
  final List<String> images = [
    'assets/land_donation_poster1.png',
    'assets/land_donation_poster2.png',
    'assets/land_donation_poster3.png',
  ];

  List<Map<dynamic, dynamic>> posters = [
    {
      'img': 'lib/assets/posters/pos2.jpg',
    },
    {
      'img': 'assets/land_donation1.png',
    },
  ];
  List<Map<dynamic, dynamic>> data = [
    {
      'img': 'lib/assets/donateimg/food.png',
      'category': 'Food Donation',
      'redirect': const FoodCategoryFormRoute(),
    },
    {
      'img': 'lib/assets/donateimg/fund.png',
      'category': 'Fund donation',
      'redirect': const RazorpayPaymentGatewayRoute(),
    },
    {
      'img': 'assets/community.png',
      'category': 'Community',
      'redirect': const CommunityHomePageRoute(),
    },
    {
      'img': 'assets/raise_query.png',
      'category': 'Resolve Query',
      'redirect': const ChatBotScreenRoute(),
    },
    {
      'img': 'assets/be_volunteer.png',
      'category': 'Be a Volunteer',
      'redirect': const RaiseRequestRoute(),
    },
    {
      'img': 'assets/raise_request.png',
      'category': 'Raise Request',
      'redirect': const RaiseRequestRoute(),
    },
    {
      'img': 'assets/connect.png',
      'category': 'Connect',
      'redirect': const CommunityHomePage(),
    },
    {
      'img': 'assets/your_contributions.png',
      'category': 'Contributions',
      'redirect': const RaiseRequestRoute(),
    },
    {
      'img': 'assets/your_contributions.png',
      'category': 'Govt. Scheme',
      'redirect': SchemePageRoute(),
    },
    {
      'img': 'assets/disaster_news.png',
      'category': 'Disaster News',
      'redirect': const DisasterNewsFeedPageRoute(),
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        SizedBox(
          height: 50.h,
        ),
        MyAppBar(
          centerWidget: Padding(
            padding: EdgeInsets.only(left: 57.w),
            child: GestureDetector(
              onTap: () {},
              child: Container(
                width: 200.w,
                height: 40.h,
                padding: EdgeInsets.only(top: 5.h),
                child: Text(
                  "Our Features",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          ),
          rightWidget: Padding(
            padding: EdgeInsets.only(right: 34.w),
            child: IconButton(
              icon: const Icon(
                Icons.menu_rounded,
                color: Colors.white,
              ),
              onPressed: () => {},
            ),
          ),
        ),
        SizedBox(height: 20.h),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                    height: 200.h,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 3),
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                    pauseAutoPlayOnTouch: true,
                    aspectRatio: 2.0,
                    onPageChanged: (index, reason) {
                      // TODO: Handle page change
                    },
                  ),
                  items: images.map((image) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 5.r),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.r),
                            color: Colors.white, // Background color
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15.r),
                            child: Image.asset(
                              image,
                              fit: BoxFit.fill,
                            ),
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
                Container(
                  padding: EdgeInsets.all(10.0.r),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10.r,
                      mainAxisSpacing: 10.r,
                    ),
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return buildGridItem(context, index);
                    },
                  ),
                ),
                SizedBox(
                  height: 40.r,
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }

  Widget buildGridItem(BuildContext context, int index) {
    return Container(
      // padding: EdgeInsets.all(10.0.r),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
        borderRadius: BorderRadius.circular(20.0.r),
      ),
      child: Column(
        children: [
          Center(
            child: Image.asset(
              data[index]['img'],
              width: 120.0.r,
              height: 140.0.r,
            ),
          ),
          // SizedBox(height: 8.0.r),
          SizedBox(
            width: 170.w,
            child: ElevatedButton(
              onPressed: () async {
                try {
                  if (data[index]['category'] == 'Food Donation') {
                    await context.pushRoute(const PersonalDetailsRoute());
                  } else if (data[index]['category'] == 'Fund donation') {
                    await context
                        .pushRoute(const RazorpayPaymentGatewayRoute());
                  } else if (data[index]['category'] == 'Community') {
                    await context.pushRoute(const CommunityHomePageRoute());
                  } else if (data[index]['category'] == 'Resolve Query') {
                    await context.pushRoute(const ChatBotScreenRoute());
                  } else if (data[index]['category'] == 'Govt. Scheme') {
                    await context.pushRoute(SchemePageRoute());
                  } else if (data[index]['category'] == 'Disaster News') {
                    await context.pushRoute(const DisasterNewsFeedPageRoute());
                  } else {
                    await context.pushRoute(const RaiseRequestRoute());
                  }
                } catch (e) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Redirection Failed'),
                        content:
                            const Text('An error occurred while redirecting.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context); // Close the dialog
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.r),
                ),
                elevation: 2.0,
                minimumSize: const Size(0, 36),
              ),
              child: Text(
                data[index]['category'],
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.r,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
