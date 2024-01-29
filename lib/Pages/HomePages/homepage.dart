// import 'package:flutter/material.dart';
// import 'package:food_donation_app/Pages/HomePages/hungerSpots.dart';
// import 'package:food_donation_app/Pages/HomePages/pickupRequest.dart';
//
// import '../constants/constants.dart';
//
// class HomePage extends StatelessWidget {
//   final List postId = [
//     '11',
//     '12',
//     '13',
//     '14',
//   ];
//
//   HomePage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: ListView.builder(
//             itemCount: 1,
//             itemBuilder: (context, index) {
//               return Column(
//                 children: [
//                   Container(
//                     padding: const EdgeInsets.all(10),
//                     child: Row(
//                       children: [
//                         CircleAvatar(
//                             radius: 45,
//                             backgroundColor: purple1,
//                             child: Image.asset(
//                               "lib/assets/icons/user.png",
//                               height: 60,
//                             )),
//                         // Profile Picture of user is shown over here, default is user.png, which acts as icon.
//
//                         const SizedBox(width: 20),
//                         const Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           mainAxisAlignment: MainAxisAlignment.spaceAround,
//                           children: <Widget>[
//                             SizedBox(
//                               width: 200,
//                               child: Row(children: [
//                                 Expanded(
//                                   child: Text(
//                                     "Hello, Anupam Mittal! ",
//                                     style: TextStyle(
//                                         color: Colors.black,
//                                         fontSize: 20,
//                                         fontWeight: FontWeight.bold,
//                                         overflow: TextOverflow.ellipsis),
//                                   ),
//                                 ),
//                               ]),
//                             ),
//                             // User Name of user is displayed
//
//                             SizedBox(
//                               width: 200,
//                               child: Row(
//                                 children: [
//                                   Icon(Icons.place),
//                                   Expanded(
//                                     child: Text(
//                                       "Meerut.",
//                                       style: TextStyle(
//                                           fontStyle: FontStyle.italic,
//                                           color: Colors.black,
//                                           fontSize: 17,
//                                           overflow: TextOverflow.ellipsis),
//                                     ),
//                                   ),
//                                 ],
//                                 //  Location is displayed here.
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                   // Here Avatar and Name container ends.
//
//                   Container(
//                     margin: const EdgeInsets.symmetric(horizontal: 10),
//                     width: double.infinity,
//                     height: 200,
//                     decoration: BoxDecoration(
//                         color: purple1,
//                         borderRadius: BorderRadius.circular(15)),
//                     child:
//                         const Center(child: Text("Space for some animation.")),
//                   ),
//                   // Animation to be added later on.
//
//                   Container(
//                     margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
//                     padding: const EdgeInsets.all(15),
//                     width: double.infinity,
//                     height: 60,
//                     decoration: BoxDecoration(
//                         // color: purple1,
//                         borderRadius: BorderRadius.circular(15)),
//                     child: const Text(
//                       "Explore",
//                       style:
//                           TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                   // Here the explore text is placed.
//
//                   Container(
//                     margin: const EdgeInsets.symmetric(horizontal: 10),
//                     padding: const EdgeInsets.symmetric(vertical: 10),
//                     child: mainOptions(context),
//                   ),
//                   // Here 4 widgets are done. named Donate, Articles, Community, Volunteer.
//
//                   Container(
//                     margin: const EdgeInsets.symmetric(horizontal: 10),
//                     padding: const EdgeInsets.all(10),
//                     height: 90,
//                     // decoration: BoxDecoration(
//                     //     color: purple2,
//                     //     borderRadius: BorderRadius.circular(15)),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           "Nearby hunger spots you can serve in ",
//                           style: TextStyle(
//                               color: purple4,
//                               fontSize: 18,
//                               overflow: TextOverflow.ellipsis),
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             const SizedBox(
//                               width: 20,
//                               child: Icon(Icons.place),
//                             ),
//                             Expanded(
//                               child: Container(
//                                 padding:
//                                     const EdgeInsets.symmetric(horizontal: 8.0),
//                                 child: Text(
//                                   "Gulbai Tekra, Navrangpura.Navrangpura",
//                                   style: TextStyle(
//                                     color: purple4,
//                                     fontStyle: FontStyle.italic,
//                                     fontSize: 17,
//                                     fontWeight: FontWeight.bold,
//                                     overflow: TextOverflow.ellipsis,
//                                   ),
//                                   maxLines:
//                                       1, // Set the maximum number of lines
//                                 ),
//                               ),
//                             ),
//                             //  Location is displayed, from here you can change the location. and get recommendation accordingly.
//
//                             SizedBox(
//                               width: 100,
//                               height: 30,
//                               child: OutlinedButton(
//                                 onPressed: () {
//                                   // context
//                                   // .pushRoute(const DonationRequestRoute());
//                                 },
//                                 style: OutlinedButton.styleFrom(
//                                     backgroundColor: null),
//                                 child: Text(
//                                   "View All",
//                                   style: TextStyle(
//                                     decoration: TextDecoration.underline,
//                                     fontStyle: FontStyle.italic,
//                                     decorationColor: purple4,
//                                     decorationThickness: 2,
//                                     color: purple4,
//                                     fontSize: 14,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                   // Here hungerSpot text with view All button ends..
//
//                   SizedBox(
//                     height: 320,
//                     child: ListView.builder(
//                         physics: const BouncingScrollPhysics(),
//                         itemCount: postId.length,
//                         scrollDirection: Axis.horizontal,
//                         itemBuilder: (context, index) {
//                           return HungerSpot(child: postId[index]);
//                         }),
//                   ),
//                   // Here HungerSpots cards ends.
//
//                   Container(
//                     margin: const EdgeInsets.symmetric(horizontal: 10),
//                     padding: const EdgeInsets.all(10),
//                     height: 90,
//                     // decoration: BoxDecoration(
//                     //     color: purple2,
//                     //     borderRadius: BorderRadius.circular(15)),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           "Food Pickup requests you can serve from",
//                           style: TextStyle(
//                               color: purple4,
//                               fontSize: 18,
//                               overflow: TextOverflow.ellipsis),
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             const SizedBox(
//                               width: 20,
//                               child: Icon(Icons.place),
//                             ),
//                             Expanded(
//                               child: Container(
//                                 padding:
//                                     const EdgeInsets.symmetric(horizontal: 8.0),
//                                 child: Text(
//                                   "Gulbai Tekra, Navrangpura.Navrangpura",
//                                   style: TextStyle(
//                                     color: purple4,
//                                     fontStyle: FontStyle.italic,
//                                     fontSize: 17,
//                                     fontWeight: FontWeight.bold,
//                                     overflow: TextOverflow.ellipsis,
//                                   ),
//                                   maxLines:
//                                       1, // Set the maximum number of lines
//                                 ),
//                               ),
//                             ),
//                             //  Location is displayed, from here you can change the location. and get recommendation accordingly.
//
//                             SizedBox(
//                               width: 100,
//                               height: 30,
//                               child: OutlinedButton(
//                                 onPressed: () {},
//                                 style: OutlinedButton.styleFrom(
//                                     backgroundColor: null),
//                                 child: Text(
//                                   "View All",
//                                   style: TextStyle(
//                                     decoration: TextDecoration.underline,
//                                     fontStyle: FontStyle.italic,
//                                     decorationColor: purple4,
//                                     decorationThickness: 2,
//                                     color: Colors.black,
//                                     fontSize: 14,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                   // Here FoodPickup request text and viewAll button ends.
//                   SizedBox(
//                     height: 380,
//                     child: ListView.builder(
//                         physics: BouncingScrollPhysics(),
//                         itemCount: postId.length,
//                         scrollDirection: Axis.horizontal,
//                         itemBuilder: (context, index) {
//                           return const PickUpRequest();
//                         }),
//                   ),
//                   //  Here the Food pickup request ends.
//                 ],
//               );
//             }),
//       ),
//     );
//   }
// }
//
// Widget mainOptions(BuildContext context) {
//   final List<Map<String, String>> gridMap = [
//     {
//       'title': "Donate",
//       'description': "1,11+ Requests",
//       'image': "lib/assets/images/exploreImages/donate.png",
//       'action': '/donate',
//     },
//     {
//       'title': "Articles",
//       'description': "know the consequences and tips",
//       'image': "lib/assets/images/exploreImages/articles.png",
//       'action': '/articles',
//     },
//     {
//       'title': "Community",
//       'description': "connect with people and seek help",
//       'image': "lib/assets/images/exploreImages/community.png",
//       'action': '/community',
//     },
//     {
//       'title': "Volunteer",
//       'description': "support with donation",
//       'image': "lib/assets/images/exploreImages/volunteer.png",
//       'action': '/volunteer',
//     }
//   ];
//   return GridView.builder(
//       physics: const NeverScrollableScrollPhysics(),
//       shrinkWrap: true,
//       itemCount: 4,
//       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
//       itemBuilder: (context, index) {
//         return Container(
//           decoration: BoxDecoration(
//               color: purple1, borderRadius: BorderRadius.circular(12.0)),
//           height: 200,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(top: 10.0),
//                     child: Center(
//                       child: Text(
//                         "${gridMap.elementAt(index)['title']}",
//                         style: const TextStyle(
//                             color: Colors.black,
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold,
//                             overflow: TextOverflow.ellipsis),
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(left: 8.0, top: 8, right: 8),
//                     child: Text(
//                       "${gridMap.elementAt(index)['description']}",
//                       style: const TextStyle(fontSize: 15),
//                     ),
//                   ),
//                 ],
//               ),
//               Column(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(bottom: 1.0),
//                     child: ClipRRect(
//                       borderRadius: const BorderRadius.only(
//                         bottomLeft: Radius.circular(12),
//                         bottomRight: Radius.circular(12),
//                       ),
//                       child: Image.asset("${gridMap.elementAt(index)['image']}",
//                           height: 80,
//                           width: double.infinity,
//                           fit: BoxFit.cover),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         );
//       });
// }
