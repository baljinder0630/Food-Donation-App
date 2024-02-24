import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_donation_app/Pages/constants/constants.dart';
import 'package:food_donation_app/Router/route.gr.dart';
import 'package:carousel_slider/carousel_slider.dart';

@RoutePage()
class landDonation extends ConsumerStatefulWidget {
  const landDonation({super.key});

  @override
  ConsumerState<landDonation> createState() => CharityHomePage();
}

class CharityHomePage extends ConsumerState<landDonation> {
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
      'redirect': 'RaiseRequestRoute()',
    },
    {
      'img': 'assets/raise_request.png',
      'category': 'Raise Request',
      'redirect': const RaiseRequestRoute(),
    },
    {
      'img': 'assets/connect.png',
      'category': 'Connect',
      'redirect': const ChatBotScreenRoute(),
    },
    {
      'img': 'assets/your_contributions.png',
      'category': 'Contributions',
      'redirect': const AppBottomNavigationBarRoute(),
    },
    {
      'img': 'assets/disaster_news.png',
      'category': 'Disaster News',
      'redirect': const DisasterNewsFeedPageRoute(),
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          'assets/sign_up_screen.png',
          fit: BoxFit.cover,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 50.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // MyAppBar(
                      //   centerWidget: Padding(
                      //     padding: EdgeInsets.only(left: 57.w),
                      //     child: GestureDetector(
                      //       onTap: () {
                      //         context.pushRoute(const ArticleSearchPageRoute());
                      //       },
                      //       child: Container(
                      //         width: 200.w,
                      //         height: 40.h,
                      //         padding: EdgeInsets.only(top: 5.h),
                      //         child: Text("Donate Now",
                      //             textAlign: TextAlign.center,
                      //             style: TextStyle(
                      //                 fontSize: 24.sp,
                      //                 fontWeight: FontWeight.bold,
                      //                 color: Colors.white)),
                      //       ),
                      //     ),
                      //   ),
                      //   rightWidget: Padding(
                      //     padding: EdgeInsets.only(right: 34.18.w),
                      //   ),
                      // ),
                      SizedBox(
                        height: 350.w,
                      ),
                      // DonationCarousel(posters),
                      SizedBox(
                        height: 40.w,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10.0),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0,
                    ),
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return buildGridItem(context, index);
                    },
                  ),
                ),
                SizedBox(
                  height: 60.r,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 24.w),
                  child: Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Text(
                      'Explore Our Features',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.sp,
                        fontFamily: 'Outfit',
                        fontWeight: FontWeight.w500,
                        height: 0,
                        letterSpacing: 0.80.sp,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40.r,
                ),
                Container(
                  padding: const EdgeInsets.all(10.0),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0,
                    ),
                    itemCount: data.length - 2,
                    itemBuilder: (context, index) {
                      return buildGridItem(context, index + 2);
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
      ],
    );
  }

  Widget DonationCarousel(List<Map<dynamic, dynamic>> data) {
    double screenWidth = MediaQuery.of(context).size.width;
    return CarouselSlider.builder(
      options: CarouselOptions(
        height: 200.0,
        aspectRatio: screenWidth / 200.0,
        enlargeCenterPage: true,
        autoPlay: true,
      ),
      itemCount: data.length,
      itemBuilder: (BuildContext context, int index, int pageViewIndex) {
        Map<dynamic, dynamic> item = data[index];

        return InkWell(
          onTap: () {},
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                image: AssetImage(item['img']),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ],
            ),
          ),
        );
      },
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
              height: 120.0.r,
            ),
          ),
          // SizedBox(height: 8.0.r),
          Container(
            // width: 200.w,
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
                        title: Text('Redirection Failed'),
                        content: Text('An error occurred while redirecting.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context); // Close the dialog
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: green2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                elevation: 2.0,
                minimumSize: Size(0, 36),
              ),
              child: Text(
                data[index]['category'],
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.0.r,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIconTile(IconData icon, String label) {
    return Column(
      children: [
        Icon(
          icon,
          size: 48.0,
          color: Colors.blue,
        ),
        SizedBox(height: 8.0),
        Text(
          label,
          style: TextStyle(fontSize: 16.0),
        ),
      ],
    );
  }
}
