import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_donation_app/Pages/DonationRequest/requestCard.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../Router/route.gr.dart';
import 'HomePages/pickupRequest.dart';
import 'constants/constants.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var selectedCategory = 0;
  List<String> categories = ["All", "Food Request", "Fund Request"];
  final List postId = [
    '11',
    '12',
    '13',
    '14',
  ];

  final user = FirebaseAuth.instance.currentUser!;

  final Completer<GoogleMapController> _controller = Completer();

  static const CameraPosition _kGooglePlex =
      CameraPosition(target: LatLng(33.6844, 73.0479), zoom: 14);

  final List<Marker> _markers = <Marker>[
    Marker(
        markerId: MarkerId("1"),
        position: LatLng(33.4322, 73.2232),
        infoWindow: InfoWindow(
          title: "Marker Title",
        ))
  ];

  getLocation() {
    getUserCurrentLocation().then((value) async {
      print("${value.latitude} ${value.longitude}");

      _markers.add(Marker(
          markerId: MarkerId('1'),
          position: LatLng(value.latitude, value.longitude),
          infoWindow: InfoWindow(title: "My Current Location")));

      CameraPosition cameraPosition = CameraPosition(
        zoom: 14,
        target: LatLng(value.latitude, value.longitude),
      );

      final GoogleMapController controller = await _controller.future;

      controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));

      setState(() {});
    });
  }

  Future<Position> getUserCurrentLocation() async {
    try {
      await Geolocator.requestPermission().then((value) async {
        // Check if the permission is granted before proceeding
        if (value != LocationPermission.denied) {
          return await Geolocator.getCurrentPosition();
        } else {
          // Handle the case where permission is not granted
          print("Location permission not granted");
          return await Geolocator.getCurrentPosition();
        }
      });
    } catch (error) {
      print("Error while getting location: $error");
      return Position(
        latitude: 0,
        longitude: 0,
        timestamp: DateTime.now(),
        accuracy: 0.0,
        altitude: 0.0,
        heading: 0.0,
        speed: 0.0,
        speedAccuracy: 0.0,
        altitudeAccuracy: 0,
        headingAccuracy: 0,
      );
    }
    return Position(
      latitude: 0,
      longitude: 0,
      timestamp: DateTime.now(),
      accuracy: 0.0,
      altitude: 0.0,
      heading: 0.0,
      speed: 0.0,
      speedAccuracy: 0.0,
      altitudeAccuracy: 0,
      headingAccuracy: 0,
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocation();
  }

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
          onPressed: () async {
            context.pushRoute(const RaiseRequestRoute());
          },
          elevation: 0.0,
          child: Icon(Icons.add_circle_rounded, size: 36.r, color: green),
        ),
      ),
      // appBar: AppBar(title: Text('Dashboard')),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
              floating: true,
              expandedHeight: 100.h,
              title: Center(child: Text("H O M E P A G E"))),
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
                        child: user.photoURL == null
                            ? CircleAvatar(
                                radius: 40.r,
                                backgroundColor: bgColor,
                                child: Image.asset(
                                  "lib/assets/icons/user.png",
                                  height: 60.h,
                                ))
                            : CircleAvatar(
                                radius: 40.r,
                                backgroundColor: bgColor,
                                child: ClipOval(
                                  child: Image.network(
                                    user.photoURL!,
                                    // "https://i.pinimg.com/originals/16/5a/a3/165aa3c87d2cae578f91d28b3691b402.jpg",
                                    width: 80.w,
                                    height: 80.h,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
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
                                  "Hello, " + user.displayName!,
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

                // Container(
                //   height : 400.h,
                //   width: 300.w,
                //   color: Colors.amber,
                //   child:
                //   GoogleMap(
                //     initialCameraPosition: _kGooglePlex,
                //     markers: Set<Marker>.of(_markers),
                //     onMapCreated: (GoogleMapController controller){
                //       _controller.complete(controller);
                //     },
                //   ),
                // ),

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

                StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('requests')
                      .snapshots(),
                  builder: (context, snapshot) {
                    List<PickUpRequest> donationRequestWidgets = [];
                    if (snapshot.hasData) {
                      final donationRequests =
                          snapshot.data?.docs.reversed.toList();
                      for (var donationRequest in donationRequests!) {
                        final donationRequestWidget = PickUpRequest(
                          foodName: donationRequest['name'],
                          address: donationRequest['pincodeController'],
                          foodCategory: donationRequest['foodCategory'],
                          postedTime: '3',
                        );

                        donationRequestWidgets.add(donationRequestWidget);
                      }
                    }
                    return CarouselSlider.builder(
                      itemCount: donationRequestWidgets.length,
                      itemBuilder: (BuildContext context, int itemIndex,
                              int pageViewIndex) =>
                          Container(
                        child: donationRequestWidgets[itemIndex],
                      ),
                      options: CarouselOptions(
                        height: 400.h,
                        aspectRatio: 16 / 9,
                        viewportFraction: 0.8,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 3),
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        enlargeFactor: 0.3,
                        scrollDirection: Axis.horizontal,
                      ),
                    );
                  },
                ),

                // CarouselSlider.builder(
                //   itemCount: 15,
                //   itemBuilder: (BuildContext context, int itemIndex,
                //           int pageViewIndex) =>
                //       Container(
                //     child: PickUpRequest(),
                //   ),
                //   options: CarouselOptions(
                //     height: 400.h,
                //     aspectRatio: 16 / 9,
                //     viewportFraction: 0.8,
                //     initialPage: 0,
                //     enableInfiniteScroll: true,
                //     reverse: false,
                //     autoPlay: true,
                //     autoPlayInterval: Duration(seconds: 3),
                //     autoPlayAnimationDuration: Duration(milliseconds: 800),
                //     autoPlayCurve: Curves.fastOutSlowIn,
                //     enlargeCenterPage: true,
                //     enlargeFactor: 0.3,
                //     scrollDirection: Axis.horizontal,
                //   ),
                // ),

                // Container(
                //   color: bgColor,
                //   height: 450.h,
                //   child: ListView.builder(
                //       physics: const BouncingScrollPhysics(),
                //       itemCount: postId.length,
                //       scrollDirection: Axis.horizontal,
                //       itemBuilder: (context, index) {
                //         return const PickUpRequest();
                //       }),
                // ),

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
