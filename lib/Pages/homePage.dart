// flutter packages pub run build_runner watch

import 'dart:async';
import 'dart:math';
import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_donation_app/Pages/DonationRequest/requestCard.dart';
import 'package:food_donation_app/Provider/raiseRequestProvider.dart';
import 'package:food_donation_app/Provider/userProvider.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shimmer/shimmer.dart';

// import 'package:url_launcher/url_launcher.dart';
// import 'package:url_launcher/url_launcher_string.dart';

import '../Router/route.gr.dart';
import 'Community/Functions/nameProfile.dart';
import 'Community/Widgets/myAppBar.dart';
import 'Community/Widgets/searchBar.dart';
import 'HomePages/pickupRequest.dart';
import 'constants/constants.dart';

@RoutePage()
class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  late String lat;
  late String long;
  late Position _currentPosition;

  // late final Future<void> _fetchDataFuture =
  //     Future.delayed(Duration(seconds: 1));
  late String _address = '';
  int selectedCategory = 0;
  List<String> categories = ["All", "Food Request", "Fund Request"];

  // final Completer<GoogleMapController> _controller = Completer();

  // static const CameraPosition _kGooglePlex =
  //     CameraPosition(target: LatLng(33.6844, 73.0479), zoom: 14);

  // final List<Marker> _markers = <Marker>[
  //   const Marker(
  //       markerId: MarkerId("1"),
  //       position: LatLng(33.4322, 73.2232),
  //       infoWindow: InfoWindow(
  //         title: "Marker Title",
  //       ))
  // ];

  Future<List<dynamic>> getNGOs() async {
    final collectionRef = FirebaseFirestore.instance.collection("ngoRequests");

    final querySnapshot = await collectionRef.get();

    final List<dynamic> donationRequests = [];
    // print("here");
    // Fetch user data for each donation request
    for (final doc in querySnapshot.docs) {
      final data = doc.data();
      // print(data);
      final donationRequest = {
        'id': doc.id,
        'ngoName': data['ngoName'] ?? '',
        'requestType': data['requestType'] ?? '',
        'mobileNumber': data['mobileNumber'] ?? '',
        'plotNo': data['plotNo'] ?? '',
        'streetNo': data['streetNo'] ?? '',
        'district': data['district'] ?? '',
        'pincode': data['pincode'] ?? '',
        'description': data['description'] ?? '',
        'numberOfServings': data['numberOfServings'] ?? '',
        'requestsFulfilled': data['requestsFulfilled'] ?? '',
        'createdTime': data['createdTime'] ?? Timestamp.now(),
        'raiseRequestStatus': data['raiseRequestStatus'] ?? 'initial',
      };

      // Fetch user data for the current donation request
      final userData = await getUserData(data['id']);
      // print(userData);
      if (userData.exists) {
        donationRequest['uid'] = userData.get('uid');
        donationRequest['email'] = userData.get('email');
        donationRequest['displayName'] = userData.get('displayName');
        donationRequest['photoURL'] = userData.get('photoURL');
        donationRequest['totalConnects'] = userData.get('totalConnects');
      }

      donationRequests.add(donationRequest);
    }
    print(donationRequests);
    return donationRequests;
  }

  Future<DocumentSnapshot> getUserData(String userId) async {
    try {
      final userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .get();
      return userDoc;
    } catch (e) {
      print('Error fetching user data for user ID $userId: $e');
      throw Exception('Error while fetching data');
    }
  }

  Future<void> _getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error("Location Services are Disabled");
    }
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error("Location Permissions are Denied");
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          "Location permissions are permanently denied, we cannot request permission");
    }

    _currentPosition = await Geolocator.getCurrentPosition();
    _getAddressFromLatLng();
    print(
        "Fetching Location... \nLatitude: ${_currentPosition.latitude}.\n Longitude: ${_currentPosition.longitude}. \n Adress is $_address");
  }

  Future<void> _getAddressFromLatLng() async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);

      Placemark place = placemarks[0];
      setState(() {
        _address =
            "${place.street} ${place.subLocality} ${place.locality} ${place.country}, ${place.postalCode}";
      });
    } catch (e) {
      print(e);
    }
  }

  String generateUniqueIdentifier() {
    int timestamp = DateTime.now().millisecondsSinceEpoch;
    int randomNumber = Random().nextInt(1000000);
    String uniqueIdentifier = '$timestamp$randomNumber';
    return uniqueIdentifier;
  }

  // Future<void> _openMap(String lat, String long) async {
  //   String googleURL =
  //       'https://www.google.com/maps/search/?api=1&query=$lat,$long';
  //   await canLaunchUrlString(googleURL)
  //       ? await launchUrl(googleURL as Uri)
  //       : throw 'Could Not Launch $googleURL';
  // }

  // getLocation() {
  //   getUserCurrentLocation().then((value) async {
  //     print("${value.latitude} ${value.longitude}");
  //
  //     _markers.add(Marker(
  //         markerId: const MarkerId('1'),
  //         position: LatLng(value.latitude, value.longitude),
  //         infoWindow: const InfoWindow(title: "My Current Location")));
  //
  //     CameraPosition cameraPosition = CameraPosition(
  //       zoom: 14,
  //       target: LatLng(value.latitude, value.longitude),
  //     );
  //
  //     final GoogleMapController controller = await _controller.future;
  //
  //     controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  //
  //     setState(() {});
  //   });
  // }

  // Future<Position> getUserCurrentLocation() async {
  //   try {
  //     await Geolocator.requestPermission().then((value) async {
  //       // Check if the permission is granted before proceeding
  //       if (value != LocationPermission.denied) {
  //         return await Geolocator.getCurrentPosition();
  //       } else {
  //         // Handle the case where permission is not granted
  //         print("Location permission not granted");
  //         return await Geolocator.getCurrentPosition();
  //       }
  //       setState(() {});
  //     });
  //   } catch (error) {
  //     print("Error while getting location: $error");
  //     return Position(
  //       latitude: 0,
  //       longitude: 0,
  //       timestamp: DateTime.now(),
  //       accuracy: 0.0,
  //       altitude: 0.0,
  //       heading: 0.0,
  //       speed: 0.0,
  //       speedAccuracy: 0.0,
  //       altitudeAccuracy: 0,
  //       headingAccuracy: 0,
  //     );
  //   }
  //   return Position(
  //     latitude: 0,
  //     longitude: 0,
  //     timestamp: DateTime.now(),
  //     accuracy: 0.0,
  //     altitude: 0.0,
  //     heading: 0.0,
  //     speed: 0.0,
  //     speedAccuracy: 0.0,
  //     altitudeAccuracy: 0,
  //     headingAccuracy: 0,
  //   );
  // }
  //
  // void _liveLocation() {
  //   LocationSettings locationSettings = const LocationSettings(
  //     accuracy: LocationAccuracy.high,
  //     distanceFilter: 100,
  //   );
  //   Geolocator.getPositionStream(locationSettings: locationSettings)
  //       .listen((Position position) {
  //     lat = position.latitude.toString();
  //     long = position.longitude.toString();
  //   });
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getCurrentLocation();
    // _fetchDataFuture = context.read(raiseRequestProvider).getNGOs();
  }

  Widget _buildButton(int itemCount) {
    bool loading =
        (ref.watch(raiseRequestProvider).raiseRequestStatus == 'processing');
    return Container(
      child: itemCount >= 2
          ? Container(
              margin: EdgeInsets.all(20.r),
              height: 60.h,
              width: 60.w,
              child: FloatingActionButton(
                onPressed: () {
                  context.pushRoute(const PickupRequestPageRoute());
                },
                backgroundColor: brown.withOpacity(0.4),
                shape: const CircleBorder(),
                child: Icon(
                  Icons.arrow_forward,
                  color: white,
                ),
              ),
            )
          : const SizedBox(), // If less than or equal to 2 items, don't show button
    );
  }

  Widget categoryWidget() {
    return Container(
      padding: EdgeInsets.only(left: 24.w),
      alignment: Alignment.centerLeft,
      height: 43.h,
      child: ListView.builder(
        padding: EdgeInsets.all(0.r),
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Row(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedCategory = index;
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(10.r),
                  decoration: ShapeDecoration(
                    color: index == selectedCategory ? green : Colors.white,
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

  @override
  Widget build(BuildContext context) {
    // final id = ref.read(authStateProvider.notifier).getUid();
    final userName = ref.read(authStateProvider.notifier).getDisplayName();
    final profilePic = ref.read(authStateProvider.notifier).getPhotoUrl();
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
          heroTag: generateUniqueIdentifier(),
          backgroundColor: const Color(0xffFEFEFE),
          shape: const OvalBorder(),
          onPressed: () async {
            context.pushRoute(const ChatBotScreenRoute());
          },
          elevation: 0.0,
          child: Image.asset(
            'lib/assets/icons/chatbot_1.png',
            // Replace 'your_image.png' with the path to your image asset
            width: 38.w, // Adjust the width of the image
            height: 38.h, // Adjust the height of the image
            color: green, // You can also apply color to your image if needed
          ),
          // child: Icon(Icons.smart_toy_outlined, size: 36.r, color: green),
        ),
      ),

      // PERFECT...Floating action button to add donation requests...

      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            expandedHeight: 180.h,
            backgroundColor: bgColor,
            surfaceTintColor: bgColor,
            stretch: true,
            floating: true,
            flexibleSpace: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return FlexibleSpaceBar(
                  background: Column(
                    children: [
                      SizedBox(
                        height: 50.h,
                      ),
                      MyAppBar(
                        centerWidget: Padding(
                          padding: EdgeInsets.only(left: 57.w),
                          child: GestureDetector(
                            onTap: () {
                              context.pushRoute(const ProfileSearchPageRoute());
                            },
                            child: MySearchBar(title: "Hunger Spots"),
                          ),
                        ),
                        rightWidget: Padding(
                          padding: EdgeInsets.only(left: 10.w, right: 24.18.w),
                          child: IconButton(
                            icon: Icon(
                              Icons.edit_location_alt_outlined,
                              size: 30.r,
                              color: Colors.white,
                            ),
                            onPressed: () => {
                              _getCurrentLocation()
                              // _getCurrentLocation().then((value) {
                              //   lat = '${value.latitude}';
                              //   long = '${value.longitude}';
                              //   print("$lat + $long");
                              // })
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      categoryWidget(),
                    ],
                  ),
                );
              },
            ),
          ),

          // App bar is looking fine... Just add the functionality of search and filters.

          SliverToBoxAdapter(
            child: RefreshIndicator(
              onRefresh: () async {},
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(10.r),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 42.r,
                          backgroundColor: black,
                          child: profilePic.isEmpty || profilePic == "null"
                              ? CircleAvatar(
                                  radius: 40.r,
                                  backgroundColor: bgColor,
                                  child: Text(
                                      nameProfile(userName).isNotEmpty
                                          ? nameProfile(userName)
                                          : "NA",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 27.sp,
                                        fontFamily: 'Outfit',
                                        fontWeight: FontWeight.w400,
                                        height: 0,
                                        letterSpacing: 0.56.sp,
                                      )),
                                )
                              : CircleAvatar(
                                  radius: 40.r,
                                  backgroundColor: bgColor,
                                  child: ClipOval(
                                    child: Image.network(
                                      profilePic,
                                      width: 80.w,
                                      height: 80.h,
                                      fit: BoxFit.cover,
                                      errorBuilder: (BuildContext context,
                                          Object exception,
                                          StackTrace? stackTrace) {
                                        // Return a fallback image in case of an error
                                        return CircleAvatar(
                                          radius: 40.r,
                                          backgroundColor: bgColor,
                                          child: Text(
                                              nameProfile(userName).isNotEmpty
                                                  ? nameProfile(userName)
                                                  : "NA",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 27.sp,
                                                fontFamily: 'Outfit',
                                                fontWeight: FontWeight.w400,
                                                height: 0,
                                                letterSpacing: 0.56.sp,
                                              )),
                                        );
                                      },
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
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      "Hello, $userName",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.bold,
                                          overflow: TextOverflow.ellipsis),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // User Name of user is displayed

                            SizedBox(
                              width: 250.w,
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.place,
                                    color: brown,
                                    size: 20.sp,
                                  ),
                                  Expanded(
                                    child: Text(
                                      _address,
                                      style: TextStyle(
                                          fontStyle: FontStyle.italic,
                                          color: brown,
                                          fontSize: 17.sp,
                                          fontWeight: FontWeight.w700,
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

                  StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('requests')
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        // Return a loading indicator or placeholder widget
                        return const CircularProgressIndicator();
                      } else if (!snapshot.hasData ||
                          snapshot.data!.docs.isEmpty) {
                        // Return a message or widget when no data is available
                        return const Text('No pickup requests available.');
                      } else {
                        // Extract pickup requests from snapshot data
                        final List<DocumentSnapshot> requests =
                            snapshot.data!.docs;
                        List<Widget> donationRequestWidgets = [];

                        for (var donationRequest in requests) {
                          final address = donationRequest['plotNo'] +
                              ", " +
                              donationRequest['streetController'] +
                              ", " +
                              donationRequest['districtController'] +
                              ", " +
                              donationRequest['pincodeController'];
                          final createdTime = donationRequest['postedTime'];
                          final cookedBefore = getCookedTime(createdTime);
                          final donationRequestWidget = PickUpRequest(
                            snapshot: snapshot,
                            foodName1: donationRequest['name'],
                            address: address,
                            phoneNumber: donationRequest['phoneNumber'],
                            postedTime: cookedBefore,
                            foodCategory: donationRequest['foodCategory'],
                          );

                          donationRequestWidgets.add(donationRequestWidget);
                        }

                        return Container(
                          margin: EdgeInsets.only(left: 5.r),
                          height: 350.h,
                          width: MediaQuery.of(context).size.width,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: min(3, donationRequestWidgets.length),
                            itemBuilder: (context, index) {
                              // Build each card
                              return Row(
                                children: [
                                  donationRequestWidgets[index],
                                  _buildButton(index),
                                ],
                              );
                            },
                          ),
                        );
                      }
                    },
                  ),

                  // Here the pickup request cards ends

                  // Container(
                  //   padding: EdgeInsets.only(top: 10.r),
                  //   child: Text(
                  //     "Hunger Spots",
                  //     style: TextStyle(
                  //         color: Colors.black,
                  //         fontSize: 20.sp,
                  //         fontWeight: FontWeight.bold,
                  //         overflow: TextOverflow.ellipsis),
                  //   ),
                  // ),

                  FutureBuilder(
                    future: getNGOs(),
                    builder: (_, AsyncSnapshot<List<dynamic>> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return SizedBox(
                          height: 3 * 215.h,
                          child: ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: 3,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                margin: EdgeInsets.symmetric(horizontal: 10.w),
                                child: Stack(
                                  children: [
                                    Container(
                                      margin:
                                          EdgeInsets.symmetric(vertical: 5.h),
                                      height: 215.h,
                                      decoration: ShapeDecoration(
                                        color: white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20.r),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 20.w,
                                      top: 20.h,
                                      child: Shimmer(
                                        gradient: const LinearGradient(
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
                                            colors: [
                                              Colors.grey,
                                              Colors.white,
                                              Colors.grey
                                            ]),
                                        child: Row(
                                          children: [
                                            Container(
                                              width: 60.w,
                                              height: 60.h,
                                              decoration: ShapeDecoration(
                                                color: Colors.white,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30.r),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10.w,
                                            ),
                                            Container(
                                              width: 300.w,
                                              height: 30.h,
                                              decoration: ShapeDecoration(
                                                color: Colors.white,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.r),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 20.w,
                                      top: 91.h,
                                      child: SizedBox(
                                        width: 380.w,
                                        height: 30.h,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Shimmer(
                                              gradient: const LinearGradient(
                                                  begin: Alignment.centerLeft,
                                                  end: Alignment.centerRight,
                                                  colors: [
                                                    Colors.grey,
                                                    Colors.white,
                                                    Colors.grey
                                                  ]),
                                              child: Container(
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 10.w),
                                                width: 380.w,
                                                height: 30.h,
                                                decoration: ShapeDecoration(
                                                  color: Colors.white,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.r),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 20.w,
                                      top: 141.h,
                                      child: SizedBox(
                                        width: 380.w,
                                        height: 30.h,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Shimmer(
                                              gradient: const LinearGradient(
                                                  begin: Alignment.centerLeft,
                                                  end: Alignment.centerRight,
                                                  colors: [
                                                    Colors.grey,
                                                    Colors.white,
                                                    Colors.grey
                                                  ]),
                                              child: Container(
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 10.w),
                                                width: 380.w,
                                                height: 30.h,
                                                decoration: ShapeDecoration(
                                                  color: Colors.white,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.r),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        );
                      } else if (snapshot.hasError) {
                        print(snapshot.error);
                        return const Center(
                          child: Text('Error loading data'),
                        );
                      } else {
                        print(snapshot.data);
                        final dataList = snapshot.data!;
                        return ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: dataList.length,
                          itemBuilder: (_, index) {
                            final item = dataList[index];
                            return DonationRequestCard(
                              requestName: item['ngoName'],
                              NGOName: item['displayName'],
                              NGOImage: item['photoURL'],
                              ngoPosition: _currentPosition,
                              totalRequest: item['numberOfServings'],
                              completedRequest: item['requestsFulfilled'],
                              ngoLocation: item["plotNo"] +
                                  " " +
                                  item['streetNo'] +
                                  " " +
                                  item["district"] +
                                  " " +
                                  item["pincode"],
                              timestamp: item['createdTime'],
                              description: item['description'],
                              phoneNumber: item['mobileNumber'],
                              requestType: item['requestType'],
                              ngoID: item['id'],
                            );
                          },
                        );
                      }
                    },
                  ),

                  // StreamBuilder<QuerySnapshot>(
                  //   stream: FirebaseFirestore.instance
                  //       .collection('requests')
                  //       .snapshots(),
                  //   builder: (context, snapshot) {
                  //     if (snapshot.connectionState == ConnectionState.waiting) {
                  //       // Return shimmer loading animation while waiting for data
                  //       return CarouselSlider(
                  //         items: [
                  //           Shimmer.fromColors(
                  //             baseColor: Colors.grey[300]!,
                  //             highlightColor: Colors.grey[100]!,
                  //             child: Container(
                  //               width: 300.w,
                  //               height: 400.h,
                  //               decoration: ShapeDecoration(
                  //                 color: Colors.white,
                  //                 shape: RoundedRectangleBorder(
                  //                   borderRadius: BorderRadius.circular(30.r),
                  //                 ),
                  //               ),
                  //             ),
                  //           ),
                  //         ],
                  //         options: CarouselOptions(
                  //           height: 370.h,
                  //           autoPlay: false,
                  //           viewportFraction: 0.7,
                  //           initialPage: 2,
                  //         ),
                  //       );
                  //     } else {
                  //       // Data has been loaded, build the carousel
                  //       List<PickUpRequest> donationRequestWidgets = [];
                  //       if (snapshot.hasData) {
                  //         final donationRequests =
                  //             snapshot.data?.docs.reversed.toList();
                  //         for (var donationRequest in donationRequests!) {
                  //           final address = donationRequest['plotNo'] +
                  //               ", " +
                  //               donationRequest['streetController'] +
                  //               ", " +
                  //               donationRequest['districtController'] +
                  //               ", " +
                  //               donationRequest['pincodeController'];
                  //           final createdTime = donationRequest['postedTime'];
                  //           final cookedBefore = getCookedTime(createdTime);
                  //           final donationRequestWidget = PickUpRequest(
                  //             snapshot: snapshot,
                  //             foodName1: donationRequest['name'],
                  //             address: address,
                  //             phoneNumber: donationRequest['phoneNumber'],
                  //             postedTime: cookedBefore,
                  //             foodCategory: donationRequest['foodCategory'],
                  //           );
                  //
                  //           donationRequestWidgets.add(donationRequestWidget);
                  //         }
                  //       }
                  //       return Row(
                  //         children: [
                  //           Container(
                  //             height: 370.h,
                  //             width: 366.w,
                  //             child: CarouselSlider.builder(
                  //               itemCount: donationRequestWidgets.length,
                  //               itemBuilder: (BuildContext context, int itemIndex,
                  //                       int pageViewIndex) =>
                  //                   Container(
                  //                 child: donationRequestWidgets[itemIndex],
                  //               ),
                  //               options: CarouselOptions(
                  //                 height: 370.h,
                  //                 autoPlay: false,
                  //                 viewportFraction: 0.85,
                  //                 initialPage: 2,
                  //               ),
                  //             ),
                  //           ),
                  //           Container(
                  //             child: FloatingActionButton(
                  //                 onPressed: () {
                  //                   context.pushRoute(
                  //                       const PickupRequestPageRoute());
                  //                 },
                  //                 backgroundColor: Colors.green,
                  //                 // Set the background color of the button
                  //                 child: Icon(Icons.arrow_forward),
                  //                 shape:
                  //                     CircleBorder() // Icon for the right arrow
                  //                 ),
                  //           )
                  //         ],
                  //       );
                  //     }
                  //   },
                  // ),
                  //
                  // // Here Slider for pickup requests ends...
                  //

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
                              width: 18.w,
                              child: Icon(Icons.place, color: brown),
                            ),
                            Expanded(
                              child: Container(
                                padding:
                                    EdgeInsets.symmetric(horizontal: 8.0.r),
                                child: Text(
                                  _address,
                                  style: TextStyle(
                                    color: brown,
                                    fontStyle: FontStyle.italic,
                                    fontSize: 17.sp,
                                    fontWeight: FontWeight.w700,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  maxLines:
                                      1, // Set the maximum number of lines
                                ),
                              ),
                            ),
                            //  Location is displayed, from here you can change the location. and get recommendation accordingly.

                            SizedBox(
                              width: 120.w,
                              height: 30.h,
                              child: OutlinedButton(
                                onPressed: () {
                                  context
                                      .pushRoute(const DonationRequestRoute());
                                },
                                style: OutlinedButton.styleFrom(
                                    backgroundColor: null),
                                child: Text(
                                  "View All",
                                  style: TextStyle(
                                    decorationThickness: 2,
                                    color: brown,
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
                  //   Here the Hunger spots cards ends...
                  Container(
                      margin: EdgeInsets.all(20.h),
                      child: Center(child: Text("No more Hunger Spots"))),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  String getCookedTime(Timestamp creationTimestamp) {
    DateTime creationTime = creationTimestamp.toDate();

    DateTime currentTime = DateTime.now();

    Duration difference = currentTime.difference(creationTime);

    if (difference.inDays > 0) {
      return '${difference.inDays} days';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} hours';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} minutes';
    } else {
      return '${difference.inSeconds} seconds';
    }
  }
}
// Here ends the Home Page...
