import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_donation_app/Pages/Community/Functions/nameProfile.dart';
import 'package:food_donation_app/Pages/Community/Widgets/myAppBar.dart';
import 'package:food_donation_app/Pages/Community/Widgets/searchBar.dart';
import 'package:food_donation_app/Pages/Community/communityScreen.dart';
import 'package:food_donation_app/Provider/communityProvider.dart';
import 'package:food_donation_app/Provider/userProvider.dart';
import 'package:food_donation_app/Router/route.gr.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class DashBoardPage extends ConsumerStatefulWidget {
  const DashBoardPage({super.key});

  @override
  ConsumerState<DashBoardPage> createState() => _DashBoardPageState();
}

// class _DashBoardPageState extends State<DashBoardPage> {
//   int _currentPage = 1;
//   String? vThumbImage;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Dashboard'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: <Widget>[
//             const CircleAvatar(
//               radius: 50.0,
//               // backgroundImage: AssetImage('assets/profile_pic.jpg'),
//               child: Icon(
//                 Icons.person,
//                 size: 50.0,
//               ),
//             ),
//             SizedBox(height: 10.0),
//             ElevatedButton(
//               onPressed: () {
//                 // Handle photo upload and edit
//                 context.navigateTo(CameraScreenRoute());
//               },
//               child: Text('Upload / Edit Photo'),
//             ),
//             SizedBox(height: 20.0),
//             const Text(
//               'Hi Chhawinder',
//               style: TextStyle(
//                 fontSize: 20.0,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 30.0),
//             Column(
//               children: [
//                 DashboardButton(
//                   text: 'Settings',
//                   onPressed: () {
//                     // Handle Settings button press
//                   },
//                 ),
//                 SizedBox(height: 10.0),
//                 DashboardButton(
//                   text: 'Your Donations',
//                   onPressed: () {
//                     // Handle Your Donations button press
//                   },
//                 ),
//                 SizedBox(height: 10.0),
//                 DashboardButton(
//                   text: 'Logout',
//                   onPressed: () {
//                     context.pushRoute(const SignUpPageRoute());
//                   },
//                 ),
//                 SizedBox(height: 10.0),
//                 DashboardButton(
//                   text: 'Contact Us',
//                   onPressed: () {
//                     // Handle Contact Us button press
//                   },
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class DashboardButton extends StatelessWidget {
//   final String text;
//   final VoidCallback onPressed;

//   const DashboardButton({
//     required this.text,
//     required this.onPressed,

//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       child: ElevatedButton(
//         onPressed: onPressed,
//         child: Text(text),
//       ),
//     );
//   }
// }

// class InstagramProfile extends StatefulWidget {
//   @override
//   _InstagramProfileState createState() => _InstagramProfileState();
// }

class _DashBoardPageState extends ConsumerState<DashBoardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 50.h),
        child: Column(
          children: [
            MyAppBar(
                centerWidget: Padding(
                  padding: EdgeInsets.only(left: 57.w),
                  child: GestureDetector(
                    onTap: () {
                      context.pushRoute(ArticleSearchPageRoute());
                    },
                    child: Container(
                      width: 200.w,
                      height: 40.h,
                      padding: EdgeInsets.only(top: 5.h),
                      child: Text("Profile",
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
                  child: IconButton(
                    icon: const Icon(
                      Icons.menu_rounded,
                      color: Colors.white,
                    ),
                    onPressed: () => {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              ListTile(
                                leading: const Icon(Icons.settings),
                                title: const Text('Settings and privacy'),
                                onTap: () {},
                              ),

                              const ListTile(
                                  leading: Icon(Icons.message),
                                  title: Text('Threads'),
                                  trailing: Chip(
                                    label: Padding(
                                      padding: EdgeInsets.all(2.0),
                                      child: Text(
                                        '9+',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                    backgroundColor: Colors.blue,
                                  )),
                              // Add more ListTiles here for other options
                            ],
                          );
                        },
                      )
                    },
                  ),
                )),
            Padding(
              padding: EdgeInsets.only(top: 12.r, bottom: 24.r),
              child: Container(
                color: Colors.white,
                child: ProfileWidget(),
              ),
            ),
            Container(
              width: 0.8.sw,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                border: Border.all(color: Colors.grey[500]!),
              ),
              child: DefaultTabController(
                length: 2,
                child: Column(
                  children: <Widget>[
                    TabBar(
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.grey[400],
                      indicatorWeight: 1,
                      indicatorColor: Colors.black,
                      tabs: [
                        Container(
                          // color: Colors.red,
                          child: Tab(
                            icon: Icon(
                              Icons.grid_on_sharp,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Tab(
                          icon: Icon(
                            Icons.save,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileWidget extends ConsumerStatefulWidget {
  @override
  ConsumerState<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends ConsumerState<ProfileWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 10.h), // Add some padding
        CircleAvatar(
            backgroundColor: Colors.grey[300], // Add your color here
            radius: 40.r,
            // backgroundImage:
            // AssetImage('assets/profile.jpg'), // Add path to your image file
            child: Text(
              nameProfile(ref.watch(authStateProvider).user!.displayName),
              style: TextStyle(
                color: Colors.black,
                fontSize: 30.sp,
                fontFamily: 'Outfit',
                fontWeight: FontWeight.w500,
                height: 0,
                letterSpacing: 0.56.sp,
              ),
            )),
        SizedBox(height: 20.h), // Add some padding
        Container(
          height: 32.h, // Adjust the height as needed
          width: 300.w, // Adjust the width as needed
          alignment: Alignment.center,
          child: Text(
            ref.watch(authStateProvider).user!.displayName ?? "",
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 20.h), // Add some padding
        Container(
          alignment: Alignment.center,
          width: 350.w, // Adjust the width as needed
          decoration: BoxDecoration(
            color: Colors.green[100], // Add your color here
            borderRadius:
                BorderRadius.circular(5.r), // Adjust the radius as needed
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildStatColumn(
                    ref.watch(communityProvider).myPosts!.length.toString() ??
                        '0',
                    'posts'),
                Container(
                    width: 1.w,
                    height: 80.h,
                    color: Colors.white), // Add some padding
                _buildStatColumn('891', 'connects')
              ],
            ),
          ),
        ),
      ],
    );
  }

  Column _buildStatColumn(String number, String title) {
    return Column(
      children: [
        Text(
          number,
          style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: EdgeInsets.all(8.0.r), // Adjust the padding as needed
          child: Text(
            title,
            style: TextStyle(fontSize: 20.sp),
          ),
        ),
      ],
    );
  }
}
