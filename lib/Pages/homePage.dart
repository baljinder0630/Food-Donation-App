import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_donation_app/Pages/DonationRequest/requestCard.dart';

import '../Router/route.gr.dart';
import 'HomePages/pickupRequest.dart';
import 'constants/constants.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  var selectedCategory = 0;
  List<String> categories = ["All", "Food Request", "Fund Request"];
  final List postId = [
    '11',
    '12',
    '13',
    '14',
  ];

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Color(0x3F000000),
              blurRadius: 8,
              offset: Offset(0, 0),
              spreadRadius: 0,
            )
          ],
        ),
        child: FloatingActionButton(
          backgroundColor: const Color(0xffFEFEFE),
          shape: const OvalBorder(),
          onPressed: () {
            context.pushRoute(const RaiseRequestRoute());
          },
          elevation: 0.0,
          child: Icon(Icons.add_circle_rounded, size: 36.r, color: green),
        ),
      ),
      // appBar: AppBar(title: Text('Dashboard')),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                'https://example.com/your_image.jpg', // Add your image URL here
                fit: BoxFit.cover,
              ),
              collapseMode: CollapseMode.pin,
              stretchModes: [StretchMode.fadeTitle],
              centerTitle: true,
              titlePadding: EdgeInsets.only(bottom: 16.0),
              title: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    color: Colors.blue,
                    child: Text(
                      'This is a scrolling column',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // SliverAppBar(
          //   floating: true,
          //   expandedHeight: 250,
          //   flexibleSpace: FlexibleSpaceBar(
          //     title: Column(
          //       children: [

          // MyAppBar(
          //   centerWidget: MySearchBar(),
          //   // static const IconData local_shipping = IconData(0xe3a6, fontFamily: 'MaterialIcons'),
          //   rightWidget: Padding(
          //     padding: EdgeInsets.only(
          //         right: 16.0), // Adjust the left padding as needed
          //     child: Container(
          //       padding: EdgeInsets.all(10.r),
          //       decoration: BoxDecoration(
          //         shape: BoxShape.circle,
          //         color: Colors.white,
          //       ),
          //       child: IconButton(
          //         icon: Icon(Icons.local_shipping),
          //         onPressed: () {
          //           context
          //               .pushRoute(const DonationTrackingPageRoute());
          //         },
          //       ),
          //     ),
          //   ),
          // ),
          // SizedBox(
          //   height: 20.h,
          // ),
          // Container(
          //   padding: EdgeInsets.all(10.r),
          //   child: categoryWidget(),
          // ),
          // SizedBox(
          //   height: 20.h,
          // ),
          // Here..
          //         Text("heyy"),
          //       ],
          //     ),
          //   ),
          // ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(10.r),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 43.r,
                        backgroundColor: green,
                        child: CircleAvatar(
                            radius: 40.r,
                            backgroundColor: bgColor,
                            child: Image.asset(
                              "lib/assets/icons/user.png",
                              height: 60.h,
                            )),
                      ),
                      // Profile Picture of user is shown over here, default is user.png, which acts as icon.

                      SizedBox(width: 20.r),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          SizedBox(
                            width: 250.w,
                            child: Row(children: [
                              Expanded(
                                child: Text(
                                  "Hello, Anupam Mittal! Anupam Mittal Anupam Mittal...",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.bold,
                                      overflow: TextOverflow.ellipsis),
                                ),
                              ),
                            ]),
                          ),
                          // User Name of user is displayed

                          SizedBox(
                            width: 250.w,
                            child: Row(
                              children: [
                                Icon(
                                  Icons.place,
                                  color: red1,
                                ),
                                Expanded(
                                  child: Text(
                                    "Meerut.",
                                    style: TextStyle(
                                        fontStyle: FontStyle.italic,
                                        color: red1,
                                        fontSize: 17.sp,
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                ),
                              ],
                              //  Location is displayed here.
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // Here Avatar and Name container ends.

                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10.r),
                  width: double.infinity,
                  height: 200.h,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.r)),
                  child: const Center(child: Text("Space for some animation.")),
                ),
                // Animation ends here.

                Container(
                  margin: EdgeInsets.only(top: 10.r, left: 10.r, right: 10.r),
                  padding: EdgeInsets.all(15.r),
                  width: double.infinity,
                  height: 70.h,
                  decoration: BoxDecoration(
                      // color: purple1,
                      borderRadius: BorderRadius.circular(15.r)),
                  child: Text(
                    "Explore",
                    style:
                        TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                  ),
                ),
                //Explore Ends here.

                // Container(
                //   margin: const EdgeInsets.symmetric(horizontal: 10),
                //   padding: const EdgeInsets.symmetric(vertical: 10),
                //   child: mainOptions(context),
                // ),
                // Here 4 widgets are done.

                // Container(
                //   margin: EdgeInsets.symmetric(horizontal: 10.r),
                //   padding: EdgeInsets.all(10.r),
                //   height: 100.h,
                //   child: Column(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       Text(
                //         "Nearby hunger spots you can serve in ",
                //         style: TextStyle(
                //             color: black,
                //             fontSize: 18.sp,
                //             overflow: TextOverflow.ellipsis),
                //       ),
                //       Row(
                //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //         children: [
                //           SizedBox(
                //             width: 20.w,
                //             child: Icon(Icons.place, color: red1),
                //           ),
                //           Expanded(
                //             child: Container(
                //               padding: EdgeInsets.symmetric(horizontal: 8.0.r),
                //               child: Text(
                //                 "Gulbai Tekra, Navrangpura.Navrangpura",
                //                 style: TextStyle(
                //                   color: red1,
                //                   fontStyle: FontStyle.italic,
                //                   fontSize: 17.sp,
                //                   fontWeight: FontWeight.bold,
                //                   overflow: TextOverflow.ellipsis,
                //                 ),
                //                 maxLines: 1, // Set the maximum number of lines
                //               ),
                //             ),
                //           ),
                //           //  Location is displayed, from here you can change the location. and get recommendation accordingly.
                //
                //           SizedBox(
                //             width: 120.w,
                //             height: 30.h,
                //             child: OutlinedButton(
                //               onPressed: () {
                //                 context.pushRoute(const DonationRequestRoute());
                //               },
                //               style: OutlinedButton.styleFrom(
                //                   backgroundColor: null),
                //               child: Text(
                //                 "View All",
                //                 style: TextStyle(
                //                   decoration: TextDecoration.underline,
                //                   fontStyle: FontStyle.italic,
                //                   decorationColor: red1,
                //                   decorationThickness: 2,
                //                   color: red1,
                //                   fontSize: 14.sp,
                //                   fontWeight: FontWeight.bold,
                //                 ),
                //               ),
                //             ),
                //           ),
                //         ],
                //       ),
                //     ],
                //   ),
                // ),
                // Here hungerSpot text with view All button ends..

                // SizedBox(
                //   height: 380.h,
                //   child: ListView.builder(
                //       physics: const BouncingScrollPhysics(),
                //       itemCount: postId.length,
                //       scrollDirection: Axis.horizontal,
                //       itemBuilder: (context, index) {
                //         return HungerSpot(child: postId[index]);
                //       }),
                // ),

                // Here HungerSpots cards ends.

                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10.r),
                  padding: EdgeInsets.all(10.r),
                  height: 90.h,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Food Pickup requests you can serve from",
                        style: TextStyle(
                            color: black,
                            fontSize: 18.sp,
                            overflow: TextOverflow.ellipsis),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 20.w,
                            child: Icon(Icons.place, color: red1),
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 8.r),
                              child: Text(
                                "Gulbai Tekra, Navrangpura.Navrangpura",
                                style: TextStyle(
                                  color: red1,
                                  fontStyle: FontStyle.italic,
                                  fontSize: 17.sp,
                                  fontWeight: FontWeight.bold,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                maxLines: 1, // Set the maximum number of lines
                              ),
                            ),
                          ),
                          //  Location is displayed, from here you can change the location. and get recommendation accordingly.

                          SizedBox(
                            width: 120.w,
                            height: 30.h,
                            child: OutlinedButton(
                              onPressed: () {},
                              style: OutlinedButton.styleFrom(
                                  backgroundColor: null),
                              child: Text(
                                "View All",
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontStyle: FontStyle.italic,
                                  decorationColor: red1,
                                  decorationThickness: 2,
                                  color: red1,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // Here FoodPickup request text and viewAll button ends.

                Container(
                  color: bgColor,
                  height: 450.h,
                  child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: postId.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return const PickUpRequest();
                      }),
                ),

                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10.r),
                  padding: EdgeInsets.all(10.r),
                  height: 100.h,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Nearby hunger spots you can serve in ",
                        style: TextStyle(
                            color: black,
                            fontSize: 18.sp,
                            overflow: TextOverflow.ellipsis),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 20.w,
                            child: Icon(Icons.place, color: red1),
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 8.0.r),
                              child: Text(
                                "Gulbai Tekra, Navrangpura.Navrangpura",
                                style: TextStyle(
                                  color: red1,
                                  fontStyle: FontStyle.italic,
                                  fontSize: 17.sp,
                                  fontWeight: FontWeight.bold,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                maxLines: 1, // Set the maximum number of lines
                              ),
                            ),
                          ),
                          //  Location is displayed, from here you can change the location. and get recommendation accordingly.

                          SizedBox(
                            width: 120.w,
                            height: 30.h,
                            child: OutlinedButton(
                              onPressed: () {
                                context.pushRoute(const DonationRequestRoute());
                              },
                              style: OutlinedButton.styleFrom(
                                  backgroundColor: null),
                              child: Text(
                                "View All",
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontStyle: FontStyle.italic,
                                  decorationColor: red1,
                                  decorationThickness: 2,
                                  color: red1,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // Here hungerSpot text with view All button ends..
              ],
            ),
          ),
          //  Yaha
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return DonationRequestCard();
              },
              childCount: 12,
            ),
          ),
        ],
      ),
    );
  }
}

Widget mainOptions(BuildContext context) {
  final List<Map<String, String>> gridMap = [
    {
      'title': "Donate",
      'description': "1,11+ Requests",
      'image': "lib/assets/images/exploreImages/donate.png",
      'action': '/donate',
    },
    {
      'title': "Articles",
      'description': "know the consequences and tips",
      'image': "lib/assets/images/exploreImages/articles.png",
      'action': '/articles',
    },
    {
      'title': "Community",
      'description': "connect with people and seek help",
      'image': "lib/assets/images/exploreImages/community.png",
      'action': '/community',
    },
    {
      'title': "Volunteer",
      'description': "support with donation",
      'image': "lib/assets/images/exploreImages/volunteer.png",
      'action': '/volunteer',
    }
  ];
  return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 4,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
              color: white, borderRadius: BorderRadius.circular(12.0)),
          height: 200.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Center(
                      child: Text(
                        "${gridMap.elementAt(index)['title']}",
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.ellipsis),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 8, right: 8),
                    child: Text(
                      "${gridMap.elementAt(index)['description']}",
                      style: const TextStyle(fontSize: 15),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    ),
                    child: Image.asset("${gridMap.elementAt(index)['image']}",
                        height: 70.h,
                        width: double.infinity,
                        fit: BoxFit.cover),
                  ),
                ],
              ),
            ],
          ),
        );
      });
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

Widget categoryWidget() {
  var selectedCategory = 0;
  List<String> categories = ["All", "Food Request", "Fund Request"];
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
                // setState(() {
                //   selectedCategory = index;
                // });
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
