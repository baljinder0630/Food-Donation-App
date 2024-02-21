import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_donation_app/Pages/DonationRequest/donationDescriptionHeader.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Community/Functions/toCamelCase.dart';
import '../constants/constants.dart';

@RoutePage()
class DonationDescription extends StatelessWidget {
  final String requestName;
  final String NGOName;
  final String ngoLatitude;
  final String ngoLongitude;
  final String totalRequest;
  final String remainingRequest;
  final Timestamp timestamp;
  final String description;
  final String phoneNumber;

  const DonationDescription({
    required this.requestName,
    required this.NGOName,
    required this.ngoLatitude,
    required this.ngoLongitude,
    required this.totalRequest,
    required this.remainingRequest,
    required this.timestamp,
    required this.description,
    required this.phoneNumber,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: <Widget>[
          DonationDescriptionHeader(
            requestName: requestName,
            ngoName: NGOName,
            ngoImage: "",
            totalRequest: totalRequest,
            remainingRequest: remainingRequest,
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(20.0.r),
                  child: Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width - 100.w - 40.r,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  toCamelCase(
                                      "${timestamp.toDate().year}/${timestamp.toDate().month}/${timestamp.toDate().day} ${timestamp.toDate().hour}:${timestamp.toDate().minute}"),
                                  style: TextStyle(
                                      fontStyle: FontStyle.italic,
                                      color: black,
                                      fontSize: 17.sp,
                                      overflow: TextOverflow.ellipsis),
                                ),
                                SizedBox(
                                  width: 10.r,
                                ),
                                Container(
                                  height: 5.0.r,
                                  width: 5.r,
                                  decoration: BoxDecoration(
                                    color: green,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                SizedBox(
                                  width: 10.r,
                                ),
                                Text(
                                  "Food Request",
                                  style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    color: black,
                                    fontSize: 17.sp,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    "$remainingRequest of $totalRequest completed",
                                    style: TextStyle(
                                      fontStyle: FontStyle.italic,
                                      color: red1,
                                      fontSize: 17.sp,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      //   Here add the call widget...

                      SizedBox(
                        width: 80.w,
                        height: 50.h,
                        child: OutlinedButton(
                          onPressed: () async {
                            final Uri url = Uri(
                              scheme: 'tel',
                              path: phoneNumber,
                            );
                            if (await canLaunchUrl(url)) {
                              await launchUrl(url);
                            } else {
                              print("Can't make a call to this number");
                            }
                            // Add your functionality here for making a call
                          },
                          style: OutlinedButton.styleFrom(
                            backgroundColor: null,
                          ),
                          child: Icon(
                            Icons.phone,
                            // You can replace Icons.phone with any other icon you prefer
                            size: 24, // Adjust the size of the icon as needed
                            color: red1, // Color of the icon
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Text(
                    "Description",
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  padding: EdgeInsets.all(10.r),
                  height: 320.h,
                  child: description == ""
                      ? Center(
                          child: Text("No description"),
                        )
                      : Text(
                          description,
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontSize: 18.sp,
                          ),
                        ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Center(
                  child: SizedBox(
                    height: 50.h,
                    width: 200.w,
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(backgroundColor: green),
                      child: SizedBox(
                        width: 230.w,
                        child: Center(
                          child: Text(
                            "Proceed",
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                              decorationColor: white,
                              decorationThickness: 2,
                              color: white,
                              fontSize: 17.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50.h,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: AppBar(title: Text('Donation Description')),
//       body: SizedBox(
//         width: double.infinity,
//         height: double.infinity,
//         child: Stack(
//           clipBehavior: Clip.none,
//           alignment: Alignment.bottomLeft,
//           children: [
//             Positioned(
//               left: 0,
//               top: 0,
//               child: Container(
//                 height: 450.h,
//                 width: 450.w,
//                 decoration: BoxDecoration(
//                   image: const DecorationImage(
//                     image: AssetImage("images/child.jpg"),
//                     fit: BoxFit.cover,
//                   ),
//                   color: Colors.blue.withOpacity(0.2),
//                 ),
//                 child: Container(
//                   decoration: BoxDecoration(
//                     gradient: LinearGradient(
//                       colors: [
//                         Colors.black.withOpacity(0.8),
//                         Colors.black.withOpacity(0.3)
//                       ],
//                       stops: [0.0, 1],
//                       begin: Alignment.bottomLeft,
//                     ),
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       SizedBox(
//                         height: 30.h,
//                       ),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Padding(
//                             padding: EdgeInsets.only(
//                                 left: 20.0, top: 30, bottom: 10, right: 40),
//                             child: Text(
//                               "Feeding India.",
//                               style: TextStyle(
//                                   fontSize: 20,
//                                   color: Colors.white,
//                                   overflow: TextOverflow.ellipsis),
//                             ),
//                           ),
//                           Padding(
//                             padding: EdgeInsets.only(
//                                 left: 15.0, bottom: 8, right: 40),
//                             child: Row(
//                               children: [
//                                 Icon(
//                                   Icons.place,
//                                   color: Colors.white,
//                                 ),
//                                 Text(
//                                   "Mumbai.",
//                                   style: TextStyle(
//                                       fontSize: 15,
//                                       color: Colors.white,
//                                       overflow: TextOverflow.ellipsis),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                       SizedBox(
//                         height: 30.h,
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             Positioned(
//               top: 410.h,
//               left: 0.w,
//               child: Container(
//                 height: 550.h,
//                 width: MediaQuery.of(context).size.width,
//                 decoration: BoxDecoration(
//                   color: Color(0xFF5272FC),
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(40.r),
//                     topRight: Radius.circular(40.r),
//                   ),
//                 ),
//                 child: Column(
//                   children: [
//                     Expanded(
//                       child: ListView.builder(
//                         shrinkWrap: true,
//                         itemCount: 1,
//                         itemBuilder: (context, index) {
//                           return Container(
//                               child: Column(
//                             children: [
//                               Container(
//                                 padding: EdgeInsets.all(8),
//                                 child: Text(
//                                   "Description,",
//                                   style: TextStyle(
//                                     fontSize: 20,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                               ),
//                               Container(
//                                 padding: EdgeInsets.only(
//                                     bottom: 65, left: 15, right: 15),
//                                 child: Text(
//                                   "If you still face overflow issues, you might need to review the surrounding widget tree to ensure that the ListView.builder is placed withil face overflow issues, you might need to review the surrounding widget tree to ensure that the ListView.builder is placed within a container or a widget that col face overflow issues, you might need to review the surrounding widget trmight need to review the surrounding widget tree to ensure that the ListView.builder is placed withil face overflow issues, you might need to review the surrounding widget tree to ensure that the ListView.builder is placed within a container or a widget that col face overflow issues, yoee to ensure that the ListView.builder is placed within a container or a widget that con a container or a widget that constrains its height. Additionally, you might want to check if the ListView.builder is intended to have more than one item (itemCount: 1). If you plan to have multiple items, set itemCount to the actual number of items in your list.",
//                                   style: TextStyle(fontSize: 16),
//                                 ),
//                               ),
//                             ],
//                           ));
//                         },
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Positioned(
//                 bottom: 10.h,
//                 left: 45.w,
//                 child: Container(
//                   width: 300.w,
//                   height: 60.h,
//                   child: ElevatedButton(
//                     onPressed: () {},
//                     style:
//                         ElevatedButton.styleFrom(backgroundColor: Colors.green),
//                     child: Text(
//                       "Donate Now",
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 )),
//             Positioned(
//               top: 300.h,
//               left: 30.w,
//               child: Container(
//                 width: 370.w,
//                 height: 100.h,
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(20.r),
//                     color: Colors.white.withOpacity(0.6)),
//                 child: Container(
//                   padding:
//                       EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
//                   child: Row(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Column(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               "Live Update",
//                               style: TextStyle(
//                                 color: Colors.black,
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.bold,
//                                 // overflow: TextOverflow.ellipsis
//                               ),
//                             ),
//                             Text(
//                               "2736 People Contributed",
//                               style: TextStyle(
//                                 color: Colors.black,
//                                 fontSize: 17,
//                                 // overflow: TextOverflow.ellipsis
//                               ),
//                             ),
//                           ]),
//                       Container(
//                         width: 80.w,
//                         height: 100.h,
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(18.r),
//                             color: Color(0xFF5272FC)),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Text(
//                               "42%",
//                               style: TextStyle(
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             Text("Recieved"),
//                           ],
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             Positioned(
//               right: 15.w,
//               top: 100.h,
//               child: CircleAvatar(
//                 backgroundColor: Colors.white,
//                 radius: 20.r,
//                 child: Icon(
//                   Icons.arrow_forward_ios,
//                   color: red1,
//                 ),
//               ),
//             ),
//             Positioned(
//               right: 15.w,
//               top: 160.h,
//               child: CircleAvatar(
//                 backgroundColor: Colors.white,
//                 radius: 20.r,
//                 child: Icon(
//                   Icons.textsms_outlined,
//                   color: red1,
//                 ),
//               ),
//             ),
//             Positioned(
//               right: 15.w,
//               top: 220.h,
//               child: CircleAvatar(
//                 backgroundColor: Colors.white,
//                 radius: 20.r,
//                 child: Icon(
//                   Icons.phone,
//                   color: red1,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
}
