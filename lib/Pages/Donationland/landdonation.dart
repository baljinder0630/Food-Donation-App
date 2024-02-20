import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_donation_app/Pages/constants/constants.dart';
import 'package:food_donation_app/Router/route.gr.dart';
import 'package:food_donation_app/Pages/Community/Widgets/myAppBar.dart';
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
      'img': 'lib/assets/posters/pos1.png',
    },
    {
      'img': 'lib/assets/posters/pos2.jpg',
    },
  ];
  List<Map<dynamic, dynamic>> data = [
    {
      // lib\assets\donateimg\chatbot.png
      'img': 'lib/assets/donateimg/food.png',
      'category': 'Food Donation',
      'redirect': FoodCategoryFormRoute(),
    },
    {
      'img': 'lib/assets/donateimg/fund.png',
      'category': 'Fund donation',
      'redirect': DonationRequestRoute(),
    },
    {
      'img': 'lib/assets/donateimg/community.png',
      'category': 'Community',
      'redirect': 'CommunityHomePageRoute()',
    },
    {
      'img': 'lib/assets/donateimg/chatbot.png',
      'category': 'Chat-Bot',
      'redirect': 'RaiseRequestRoute()',
    },
    {
      'img': 'images/groceries.png',
      'category': 'Food items & supplies',
      'redirect': 'RaiseRequestRoute()',
    },
    {
      'img': 'images/vegetables.png',
      'category': 'Packed items',
      'redirect': 'RaiseRequestRoute()',
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(top: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyAppBar(
                    centerWidget: Padding(
                      padding: EdgeInsets.only(left: 57.w),
                      child: GestureDetector(
                        onTap: () {
                          context.pushRoute(const ArticleSearchPageRoute());
                        },
                        child: Container(
                          width: 200.w,
                          height: 40.h,
                          padding: EdgeInsets.only(top: 5.h),
                          child: Text("Donate Now",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 24.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                        ),
                      ),
                    ),
                    rightWidget: Padding(
                      padding: EdgeInsets.only(right: 34.18.w),
                    ),
                  ),
                  SizedBox(
                    height: 40.w,
                  ),
                  DonationCarousel(posters),
                  SizedBox(
                    height: 40.w,
                  ),
                ],
              ),
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              itemCount: 2,
              itemBuilder: (context, index) {
                return buildGridItem(context, index);
              },
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
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              itemCount: data.length - 2,
              itemBuilder: (context, index) {
                return buildGridItem(context, index + 2);
              },
            ),
          ],
        ),
      ),
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
          onTap: () {
            // log("Tapped on ${item['category']}");
            // Navigate to the specified route or perform any action
            // You can use item['redirect'] to get the route name
            // context.pushRoute(item['redirect']);
          },
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
      padding: EdgeInsets.all(10.0.r),
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
          SizedBox(height: 8.0.r),
          ElevatedButton(
            onPressed: () async {
              try {
                if (data[index]['category'] == 'Food Donation') {
                  await context.pushRoute(const PersonalDetailsRoute());
                } else if (data[index]['category'] == 'Fund donation') {
                  await context.pushRoute(const RazorpayPaymentGatewayRoute());
                } else if (data[index]['category'] == 'Community') {
                  await context.pushRoute(const CommunityHomePageRoute());
                } else if (data[index]['category'] == 'Chat-Bot') {
                  await context.pushRoute(const RaiseRequestRoute());
                } else {
                  // Default redirection for other categories
                  await context.pushRoute(const RaiseRequestRoute());
                }
              } catch (e) {
                print('Error during redirection: $e');
                // Show a pop-up or some other UI indicating the failure
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
              minimumSize: Size(0, 36), // Set the minimum size to make it mini
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0.r),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    data[index]['category'],
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.0.r,
                    ),
                  ),
                ],
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
