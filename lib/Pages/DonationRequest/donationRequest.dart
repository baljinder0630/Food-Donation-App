import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_donation_app/Pages/Community/Widgets/myAppBar.dart';
import 'package:food_donation_app/Pages/Community/Widgets/searchBar.dart';
import 'package:food_donation_app/Pages/DonationRequest/requestCard.dart';
import 'package:food_donation_app/Router/route.gr.dart';
import 'package:geolocator/geolocator.dart';
import '../constants/constants.dart';
// import '../homePage.dart';
// import 'YourDonationRequest.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class DonationRequest extends ConsumerStatefulWidget {
  const DonationRequest({super.key});

  @override
  ConsumerState<DonationRequest> createState() => _DonationRequestState();
}

class _DonationRequestState extends ConsumerState<DonationRequest> {
  var selectedCategory = 0;
  late Position _currentPosition;
  List<String> categories = ["All", "Food Request", "Fund Request"];

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
  }

  Future<List<dynamic>> getNGOs() async {
    final collectionRef = FirebaseFirestore.instance.collection("ngoRequests");

    final querySnapshot = await collectionRef.get();

    final List<dynamic> donationRequests = [];
    for (final doc in querySnapshot.docs) {
      final data = doc.data();
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

      final userData = await getUserData(data['id']);
      if (userData.exists) {
        donationRequest['uid'] = userData.get('uid');
        donationRequest['email'] = userData.get('email');
        donationRequest['displayName'] = userData.get('displayName');
        donationRequest['photoURL'] = userData.get('photoURL');
        donationRequest['totalConnects'] = userData.get('totalConnects');
      }
      donationRequests.add(donationRequest);
    }
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getCurrentLocation();
    // _fetchDataFuture = context.read(raiseRequestProvider).getNGOs();
  }

  Widget categoryWidget() {
    return Container(
      margin: EdgeInsets.only(left: 24.w),
      alignment: Alignment.centerLeft,
      height: 43.h,
      child: ListView.builder(
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
          backgroundColor: Color(0xffFEFEFE),
          shape: const OvalBorder(),
          onPressed: () {
            context.pushRoute(const RaiseRequestRoute());
          },
          elevation: 0.0,
          child: Icon(Icons.add_circle_rounded, size: 36.r, color: green),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 20.h),
            MyAppBar(
              centerWidget: Padding(
                padding: EdgeInsets.only(left: 57.w),
                child: MySearchBar(title: "Donation Request"),
              ),
              rightWidget: Padding(
                padding: EdgeInsets.only(right: 16.0.r),
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.local_shipping),
                    onPressed: () {
                      context.pushRoute(const DonationTrackingPageRoute());
                    },
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            categoryWidget(),
            SizedBox(height: 20.h),
            // SingleChildScrollView(
            FutureBuilder(
              future: getNGOs(),
              builder: (_, AsyncSnapshot<List<dynamic>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  print(snapshot.error);
                  return const Center(
                    child: Text('Error loading data'),
                  );
                } else {
                  print(snapshot.data);
                  final dataList = snapshot.data!;
                  return Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 4.r),
                      height: 400.h,
                      child: ListView.builder(
                        // physics: const NeverScrollableScrollPhysics(),
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
                      ),
                    ),
                  );
                }
              },
              // ),
            ),
            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }
}

// import 'package:auto_route/auto_route.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:food_donation_app/Pages/Community/Widgets/myAppBar.dart';
// import 'package:food_donation_app/Pages/Community/Widgets/searchBar.dart';
// import 'package:food_donation_app/Pages/DonationRequest/requestCard.dart';
// import 'package:food_donation_app/Router/route.gr.dart';
//
// import '../constants/constants.dart';
// import '../homePage.dart';
// import 'YourDonationRequest.dart';
//
// @RoutePage()
// class DonationRequest extends StatefulWidget {
//   const DonationRequest({super.key});
//
//   @override
//   State<DonationRequest> createState() => _DonationRequestState();
// }
//
// class _DonationRequestState extends State<DonationRequest> {
//   var selectedCategory = 0;
//   List<String> categories = ["All", "Food Request", "Fund Request"];
//
//   Widget categoryWidget() {
//     return Container(
//       margin: EdgeInsets.only(left: 24.w),
//       alignment: Alignment.centerLeft,
//       height: 43.h,
//       child: ListView.builder(
//         physics: BouncingScrollPhysics(),
//         scrollDirection: Axis.horizontal,
//         itemCount: categories.length,
//         itemBuilder: (context, index) {
//           return Row(
//             children: [
//               GestureDetector(
//                 onTap: () {
//                   setState(() {
//                     selectedCategory = index;
//                   });
//                 },
//                 child: Container(
//                   padding: EdgeInsets.all(10.r),
//                   decoration: ShapeDecoration(
//                     color: index == selectedCategory ? green : Colors.white,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(15.r),
//                     ),
//                     shadows: const [
//                       BoxShadow(
//                         color: Color(0x3F000000),
//                         blurRadius: 8,
//                         offset: Offset(0, 0),
//                         spreadRadius: 0,
//                       )
//                     ],
//                   ),
//                   child: Text(
//                     categories[index],
//                     style: TextStyle(
//                       color: index == selectedCategory
//                           ? const Color(0xFFF9F8FD)
//                           : const Color(0xFF201F24),
//                       fontSize: 18.sp,
//                       fontFamily: 'Outfit',
//                       fontWeight: FontWeight.w500,
//                       height: 0,
//                       letterSpacing: 0.72.sp,
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(width: 16.sp),
//             ],
//           );
//         },
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: Container(
//         decoration: const BoxDecoration(
//           shape: BoxShape.circle,
//           boxShadow: [
//             BoxShadow(
//               color: Color(0x3F000000),
//               blurRadius: 8,
//               offset: Offset(0, 0),
//               spreadRadius: 0,
//             )
//           ],
//         ),
//         child: FloatingActionButton(
//           backgroundColor: Color(0xffFEFEFE),
//           shape: OvalBorder(),
//           onPressed: () {
//             context.pushRoute(const RaiseRequestRoute());
//           },
//           elevation: 0.0,
//           child: Icon(Icons.add_circle_rounded, size: 36.r, color: green),
//         ),
//       ),
//       body: SafeArea(
//         child: Column(
//           children: [
//             SizedBox(
//               height: 20.h,
//             ),
//             MyAppBar(
//               centerWidget: Padding(
//                 padding: EdgeInsets.only(left: 57.w),
//                 child: MySearchBar(title: "Donation Request"),
//               ),
//               // static const IconData local_shipping = IconData(0xe3a6, fontFamily: 'MaterialIcons'),
//               rightWidget: Padding(
//                 padding: EdgeInsets.only(
//                     right: 16.0.r), // Adjust the left padding as needed
//                 child: Container(
//                   decoration: const BoxDecoration(
//                     shape: BoxShape.circle,
//                     color: Colors.white,
//                   ),
//                   child: IconButton(
//                     icon: const Icon(Icons.local_shipping),
//                     onPressed: () {
//                       context.pushRoute(const DonationTrackingPageRoute());
//                     },
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 20.h,
//             ),
//             categoryWidget(),
//             SizedBox(
//               height: 20.h,
//             ),
//             SingleChildScrollView(
//               child: Container(
//                 height: MediaQuery.of(context).size.height - 300.h,
//                 child: StreamBuilder<QuerySnapshot>(
//                   stream: FirebaseFirestore.instance
//                       .collection('ngoRequests')
//                       .snapshots(),
//                   builder: (BuildContext context,
//                       AsyncSnapshot<QuerySnapshot> snapshot) {
//                     if (!snapshot.hasData) {
//                       return Container(
//                         child: Center(
//                           child: CircularProgressIndicator(),
//                         ),
//                       );
//                     }
//                     List<DocumentSnapshot> documents = snapshot.data!.docs;
//                     return documents.isNotEmpty
//                         ? ListView.builder(
//                         itemCount: documents.length,
//                         itemBuilder: (BuildContext context, int index) {
//                           final document = documents[index];
//                           final reqType = document['requestType'];
//                           if (selectedCategory == 1 && reqType == "Food") {
//                             return DonationRequestCard(
//                               requestName: item['ngoName'],
//                               NGOName: item['displayName'],
//                               NGOImage: item['photoURL'],
//                               ngoPosition: _currentPosition,
//                               totalRequest: item['numberOfServings'],
//                               completedRequest: item['requestsFulfilled'],
//                               ngoLocation: item["plotNo"] +
//                                   " " +
//                                   item['streetNo'] +
//                                   " " +
//                                   item["district"] +
//                                   " " +
//                                   item["pincode"],
//                               timestamp: item['createdTime'],
//                               description: item['description'],
//                               phoneNumber: item['mobileNumber'],
//                               requestType: item['requestType'],
//                               ngoID: item['id'],
//                             );
//                           } else if (selectedCategory == 2 &&
//                               reqType == "Fund") {
//                             return DonationRequestCard(
//                               requestName: item['ngoName'],
//                               NGOName: item['displayName'],
//                               NGOImage: item['photoURL'],
//                               ngoPosition: _currentPosition,
//                               totalRequest: item['numberOfServings'],
//                               completedRequest: item['requestsFulfilled'],
//                               ngoLocation: item["plotNo"] +
//                                   " " +
//                                   item['streetNo'] +
//                                   " " +
//                                   item["district"] +
//                                   " " +
//                                   item["pincode"],
//                               timestamp: item['createdTime'],
//                               description: item['description'],
//                               phoneNumber: item['mobileNumber'],
//                               requestType: item['requestType'],
//                               ngoID: item['id'],
//                             );
//                           } else if (selectedCategory == 0) {
//                             return DonationRequestCard(
//                               requestName: item['ngoName'],
//                               NGOName: item['displayName'],
//                               NGOImage: item['photoURL'],
//                               ngoPosition: _currentPosition,
//                               totalRequest: item['numberOfServings'],
//                               completedRequest: item['requestsFulfilled'],
//                               ngoLocation: item["plotNo"] +
//                                   " " +
//                                   item['streetNo'] +
//                                   " " +
//                                   item["district"] +
//                                   " " +
//                                   item["pincode"],
//                               timestamp: item['createdTime'],
//                               description: item['description'],
//                               phoneNumber: item['mobileNumber'],
//                               requestType: item['requestType'],
//                               ngoID: item['id'],
//                             );
//                           } else {
//                             return SizedBox();
//                           }
//                         })
//                         : Container(
//                       child: SizedBox(
//                         height: 50.h,
//                         child: Center(
//                           child: Text(
//                             "No more HungerSpots",
//                             style: TextStyle(
//                               color: Colors.black,
//                               fontSize: 14.sp,
//                               fontFamily: 'Outfit',
//                               fontWeight: FontWeight.w500,
//                               height: 0,
//                               letterSpacing: 0.56.sp,
//                             ),
//                           ),
//                         ),
//                       ),
//                     );
//                     //   Here the hungerSpot cards ends...
//                   },
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
