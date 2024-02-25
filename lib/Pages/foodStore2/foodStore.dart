import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_donation_app/Router/route.gr.dart';
import 'package:food_donation_app/Pages/Community/Widgets/myAppBar.dart';
import 'package:food_donation_app/Pages/constants/constants.dart';
import 'package:food_donation_app/Pages/Community/Widgets/searchBar.dart';
import 'package:carousel_slider/carousel_slider.dart';

@RoutePage()
class foodStore extends ConsumerStatefulWidget {
  const foodStore({super.key});

  @override
  ConsumerState<foodStore> createState() => _foodStore();
}

class _foodStore extends ConsumerState<foodStore> {
  final List<String> images = [
    'https://example.com/image1.jpg',
    'https://example.com/image2.jpg',
    'https://example.com/image3.jpg',
    'https://example.com/image4.jpg',
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
      'redirect': const DonationRequestRoute(),
    },
    {
      'img': 'assets/community.png',
      'category': 'Community',
      'redirect': 'CommunityHomePageRoute()',
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
      'redirect': 'RaiseRequestRoute()',
    },
    {
      'img': 'assets/connect.png',
      'category': 'Connect',
      'redirect': 'RaiseRequestRoute()',
    },
    {
      'img': 'assets/your_contributions.png',
      'category': 'Contributions',
      'redirect': 'RaiseRequestRoute()',
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 70.h,
          ),
          MyAppBar(
            centerWidget: Padding(
              padding: EdgeInsets.only(left: 57.w),
              child: GestureDetector(
                onTap: () {
                  context.pushRoute(const ProfileSearchPageRoute());
                },
                child: MySearchBar(title: "Pickup Requests"),
              ),
            ),
            rightWidget: Padding(
              padding: EdgeInsets.only(right: 16.0.r),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: white,
                ),
                child: IconButton(
                  icon: const Icon(Icons.browse_gallery_outlined),
                  onPressed: () {
                    context.pushRoute(const DonationTrackingPageRoute());
                  },
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          CarouselSlider(
            options: CarouselOptions(
              height: 200.0,
              enlargeCenterPage: true,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
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
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.blue, // Background color
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.network(
                        image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          ),
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0.h),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Category',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 150,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: images.length + 1,
              // +1 for the "View All" arrow
              itemBuilder: (context, index) {
                if (index == images.length) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        // TODO: Implement view all action
                      },
                      child: Container(
                        width: 100,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color:
                              Colors.green, // Background color for "View All"
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  );
                }

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 100,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color:
                          Colors.green, // Background color for category images
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.network(
                        images[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
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
          ),
        ],
      ),
    )));
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
          Expanded(
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
                backgroundColor: green2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0.r),
                ),
                elevation: 2.0,
                minimumSize: const Size(0, 36),
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
          ),
        ],
      ),
    );
  }
}
