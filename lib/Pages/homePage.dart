import 'dart:async';
import 'dart:math';
import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_donation_app/Pages/DonationRequest/requestCard.dart';
import 'package:food_donation_app/Provider/userProvider.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
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
  late String _address = '';
  int selectedCategory = 0;
  List<String> categories = ["All", "Food Request", "Fund Request"];
  final Completer<GoogleMapController> _controller = Completer();

  static const CameraPosition _kGooglePlex =
      CameraPosition(target: LatLng(33.6844, 73.0479), zoom: 14);

  final List<Marker> _markers = <Marker>[
    const Marker(
        markerId: MarkerId("1"),
        position: LatLng(33.4322, 73.2232),
        infoWindow: InfoWindow(
          title: "Marker Title",
        ))
  ];

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
        _address = "${place.street}, ${place.locality}, ${place.country}";
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

  Future<void> _openMap(String lat, String long) async {
    String googleURL =
        'https://www.google.com/maps/search/?api=1&query=$lat,$long';
    await canLaunchUrlString(googleURL)
        ? await launchUrl(googleURL as Uri)
        : throw 'Could Not Launch $googleURL';
  }

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
  }

  Widget categoryWidget() {
    return Container(
      margin: EdgeInsets.only(left: 24.w),
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
    final id = ref.read(authStateProvider.notifier).getUid();
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
          child: Icon(Icons.smart_toy_outlined, size: 36.r, color: green),
        ),
      ),

      // PERFECT...Floating action button to add donation requests...

      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
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
                        // rightWidget: Padding(
                        //   padding: EdgeInsets.only(left: 8.0.r),
                        //   child: Image.asset(
                        //     "lib/assets/Community/peoples.png",
                        //     width: 106.w,
                        //     height: 126.h,
                        //     fit: BoxFit.contain,
                        //   ),
                        // ),
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
            child: Column(
              children: [
                SizedBox(
                  height: 50.h,
                ),
                Container(
                  
                  padding: EdgeInsets.all(10.r),
                  child: Row(
                    children: [
                      
                      CircleAvatar(
                        radius: 43.r,
                        backgroundColor: green,
                        child: profilePic.isEmpty || profilePic == "null"
                            ? Container(
                                width: 59.85.w,
                                height: 64.60.h,
                                decoration: ShapeDecoration(
                                  color: Colors.grey,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(17),
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                      nameProfile(userName).isNotEmpty
                                          ? nameProfile(userName)
                                          : "NA",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 26.sp,
                                        fontFamily: 'Outfit',
                                        fontWeight: FontWeight.w300,
                                        height: 0,
                                        letterSpacing: 0.56.sp,
                                      )),
                                ))
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
                                      return Image.asset(
                                        "lib/assets/icons/user.png",
                                        height: 60.h,
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
                            child: Row(children: [
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
                                    _address,
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
                  width: double.infinity,
                  height: 250.h,
                  decoration: BoxDecoration(    
                      borderRadius: BorderRadius.circular(15.r),
                      image: DecorationImage(
                      image: AssetImage("lib/assets/general/sad1.png"),
                      fit: BoxFit.cover,
                      )
                      ),
                ),
                // Animation ends here.

                Container(
                  margin: EdgeInsets.only(top: 10.r, left: 10.r, right: 10.r),
                  padding: EdgeInsets.only(top: 15.r, right: 15.r, left: 15.r),
                  width: double.infinity,
                  height: 50.h,
                  child: Text(
                    "Explore",
                    style:
                        TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                  ),
                ),
                //Explore Ends here.

                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10.r),
                  padding:
                      EdgeInsets.only(bottom: 15.r, right: 15.r, left: 15.r),
                  height: 100.h,
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
                                _address,
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
                                context
                                    .pushRoute(const PickupRequestPageRoute());
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
                // Here FoodPickup request text and viewAll button ends.

                StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('requests')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      // Return shimmer loading animation while waiting for data
                      return CarouselSlider(
                        items: [
                          Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            child: Container(
                              width: 300.w,
                              height: 400.h,
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.r),
                                ),
                              ),
                            ),
                          ),
                        ],
                        options: CarouselOptions(
                          height: 370.h,
                          autoPlay: false,
                          viewportFraction: 0.7,
                          initialPage: 2,
                        ),
                      );
                    } else {
                      // Data has been loaded, build the carousel
                      List<PickUpRequest> donationRequestWidgets = [];
                      if (snapshot.hasData) {
                        final donationRequests =
                            snapshot.data?.docs.reversed.toList();
                        for (var donationRequest in donationRequests!) {
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
                      }
                      return CarouselSlider.builder(
                        itemCount: donationRequestWidgets.length,
                        itemBuilder: (BuildContext context, int itemIndex,
                                int pageViewIndex) =>
                            Container(
                          child: donationRequestWidgets[itemIndex],
                        ),
                        options: CarouselOptions(
                          height: 370.h,
                          autoPlay: false,
                          viewportFraction: 0.7,
                          initialPage: 2,
                        ),
                      );
                    }
                  },
                ),

                // Here Slider for pickup requests ends...

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
                                _address,
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

          StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('ngorequests')
                .snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return const SliverToBoxAdapter(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
              List<DocumentSnapshot> documents = snapshot.data!.docs;
              return documents.isNotEmpty
                  ? SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          final document = documents[index];
                          final reqType = document['requestType'];

                          if (selectedCategory == 1 && reqType) {
                            return DonationRequestCard(
                              spotName: document['name'],
                              spotCity: document['city'],
                              noOfServing: document['numberOfServings'],
                              requestType: document['requestType'],
                              percentDone: document['percentageRemaining'],
                              spotStreet: document['streetName'],
                              contactNumber: document['percentageRemaining'],
                              description: document['description'],
                              pincode: document['pinCode'],
                              spotState: document['state'],
                            );
                          } else if (selectedCategory == 2 && !reqType) {
                            return DonationRequestCard(
                              spotName: document['name'],
                              spotCity: document['city'],
                              noOfServing: document['numberOfServings'],
                              requestType: document['requestType'],
                              percentDone: document['percentageRemaining'],
                              spotStreet: document['streetName'],
                              contactNumber: document['percentageRemaining'],
                              description: document['description'],
                              pincode: document['pinCode'],
                              spotState: document['state'],
                            );
                          } else {
                            return DonationRequestCard(
                              spotName: document['name'],
                              spotCity: document['city'],
                              noOfServing: document['numberOfServings'],
                              requestType: document['requestType'],
                              percentDone: document['percentageRemaining'],
                              spotStreet: document['streetName'],
                              contactNumber: document['percentageRemaining'],
                              description: document['description'],
                              pincode: document['pinCode'],
                              spotState: document['state'],
                            );
                          }
                        },
                        childCount: documents.length,
                      ),
                    )
                  : SliverToBoxAdapter(
                      child: SizedBox(
                        height: 50.h,
                        child: Center(
                          child: Text(
                            "No more HungerSpots",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14.sp,
                              fontFamily: 'Outfit',
                              fontWeight: FontWeight.w500,
                              height: 0,
                              letterSpacing: 0.56.sp,
                            ),
                          ),
                        ),
                      ),
                    );

              //   Here the hungerSpot cards ends...
            },
          ),
        ],
      ),
    );
  }

  String getCookedTime(Timestamp creationTimestamp) {
    if (creationTimestamp == null) {
      return "-";
    }

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
