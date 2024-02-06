import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_donation_app/Pages/Community/Functions/nameProfile.dart';
import 'package:food_donation_app/Pages/Community/Widgets/myAppBar.dart';
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
                      context.pushRoute(const ArticleSearchPageRoute());
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
                    onPressed: () => {menuModal(context)},
                  ),
                )),
            Padding(
              padding: EdgeInsets.only(top: 12.r, bottom: 24.r),
              child: Container(
                color: Colors.white,
                child: ProfileWidget(),
              ),
            ),
            DefaultTabController(
              length: 2,
              child: Expanded(
                child: Column(
                  children: <Widget>[
                    TabBar(
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.grey[400],
                      indicatorWeight: 1,
                      indicatorColor: Colors.black,
                      tabs: [
                        Tab(
                          icon: Icon(
                            Icons.save,
                            size: 25.sp,
                            color: Colors.black,
                          ),
                        ),
                        Tab(
                          icon: Icon(
                            Icons.grid_on_sharp,
                            size: 25.sp,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    Flexible(
                      child: Container(
                        width: double.infinity, // Adjust the width as needed
                        child: TabBarView(
                          children: [
                            // Replace with the widgets you want to display when each tab is selected
                            Container(
                              child: Center(
                                child: Text(
                                  "No Donation History",
                                  style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ), // Second tab

                            ref.watch(communityProvider).myPosts!.length == 0
                                ? Center(
                                    child: Text(
                                      "No Posts",
                                      style: TextStyle(
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  )
                                : Container(
                                    child: GridView.builder(
                                        gridDelegate:
                                            const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 3,
                                          crossAxisSpacing: 5.0,
                                          mainAxisSpacing: 5.0,
                                        ),
                                        physics: const BouncingScrollPhysics(),
                                        itemCount: ref
                                            .watch(communityProvider)
                                            .myPosts!
                                            .length, // Add your itemCount here (e.g. 6 for 6 items in the grid view
                                        itemBuilder: (context, index) {
                                          return InkWell(
                                            onTap: () {
                                              context
                                                  .pushRoute(ArticleDetailRoute(
                                                article: ref
                                                    .watch(communityProvider)
                                                    .myPosts![index],
                                              ));
                                            },
                                            child: Container(
                                              // margin: EdgeInsets.only(right: 20.w),
                                              width: 300.sp,
                                              height: 300.sp,
                                              margin: EdgeInsets.all(5.0),
                                              decoration: ShapeDecoration(
                                                shape: RoundedRectangleBorder(),
                                                image: DecorationImage(
                                                  image:
                                                      CachedNetworkImageProvider(
                                                    ref
                                                        .watch(
                                                            communityProvider)
                                                        .myPosts![index]
                                                        .imgUrl,
                                                  ),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          );
                                        }),
                                  ), // First tab
                          ],
                        ),
                      ),
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

  Future<dynamic> menuModal(BuildContext context) {
    return showModalBottomSheet(
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
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () => {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Logout'),
                        content: Text('Are you sure you want to logout?'),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('Cancel')),
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                                ref.read(authStateProvider.notifier).logout();
                              },
                              child: Text('Logout')),
                        ],
                      );
                    }),
              },
            ),
            // Add more ListTiles here for other options
          ],
        );
      },
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
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 20.h), // Add some padding
          CircleAvatar(
            radius: 62.r,
            backgroundColor: Colors.white,
            child: CircleAvatar(
                backgroundColor: Colors.grey[300], // Add your color here
                radius: 60.r,
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
          ),
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
      ),
    );
  }

  Column _buildStatColumn(String number, String title) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
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
