// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_interpolation_to_compose_strings

import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_donation_app/Pages/Community/Widgets/myAppBar.dart';
import 'package:food_donation_app/Pages/Community/Widgets/searchBar.dart';
import 'package:food_donation_app/Pages/Community/allChats.dart';
import 'package:food_donation_app/Pages/Community/connectedUserPage.dart';
import 'package:food_donation_app/Pages/Community/incomingRequests.dart';
import 'package:food_donation_app/Pages/Community/peoplePage.dart';
import 'package:food_donation_app/Provider/communityProvider.dart';
import 'package:food_donation_app/Router/route.gr.dart';

@RoutePage()
class CommunityHomePage extends ConsumerStatefulWidget {
  const CommunityHomePage({super.key});

  @override
  ConsumerState<CommunityHomePage> createState() => _CommunityHomePageState();
}

class _CommunityHomePageState extends ConsumerState<CommunityHomePage> {
  int selectedCategory = 0;
  List<String> categories = ["All", "Connected", "Requests"];
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Your code here
      ref.read(communityProvider.notifier).getPeoples(0);
      ref.read(communityProvider.notifier).loadChatRooms();
    });

    super.initState();
  }

  Widget categoryWidget() {
    return Container(
      margin: EdgeInsets.only(left: 24.w),
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
                  setState(() {
                    selectedCategory = index;
                  });
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: 50.h),
            child: Column(
              children: [
                // Text(
                //   'Community',
                //   style: TextStyle(
                //     color: Color(0xFF201F24),
                //     fontSize: 20.sp,
                //     fontFamily: 'Outfit',
                //     fontWeight: FontWeight.w600,
                //     height: 0,
                //     letterSpacing: 0.40.sp,
                //   ),
                // ),
                // SizedBox(height: 10.h),
                MyAppBar(
                    centerWidget: Padding(
                      padding: EdgeInsets.only(left: 57.w),
                      child: GestureDetector(
                        onTap: () {
                          context.pushRoute(ProfileSearchPageRoute());
                        },
                        child: MySearchBar(title: "Profile"),
                      ),
                    ),
                    rightWidget: Padding(
                      padding: EdgeInsets.only(right: 34.18.w),
                      child: GestureDetector(
                          onTap: () {
                            context.navigateTo(ChattingPageRoute());
                          },
                          child: SearchHistory(context)),
                    )),
                SizedBox(
                  height: 10.h,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.zero,
                    physics: BouncingScrollPhysics(),
                    controller: _scrollController,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10.h,
                        ),
                        categoryWidget(),
                        SizedBox(
                          height: 20.h,
                        ),
                        GestureDetector(
                            onHorizontalDragEnd: (details) {
                              log(details.primaryVelocity.toString() +
                                  "  " +
                                  selectedCategory.toString());
                              if (details.primaryVelocity! > 0) {
                                setState(() {
                                  selectedCategory--;
                                  if (selectedCategory < 0) {
                                    selectedCategory = 0;
                                  }
                                });
                              } else {
                                setState(() {
                                  selectedCategory++;
                                  if (selectedCategory > 2) {
                                    selectedCategory = 2;
                                  }
                                });
                              }
                            },
                            child: getSelectedCategoryWidget(selectedCategory))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget getSelectedCategoryWidget(int selectedCategory) {
  switch (selectedCategory) {
    case 0:
      return Container(child: PeoplePage());
    case 1:
      return Container(child: ConnectedUserPage());
    case 2:
      return Container(child: IncomingRequest());
    default:
      return Container(
        child: Center(
          child: Text("Error"),
        ),
      ); // Default case, return a default widget or handle accordingly
  }
}

Widget SearchHistory(context) {
  return Container(
      width: 28.80,
      height: 28.80,
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: Colors.transparent,
        // color: Color(0xFFFEFEFE),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Icon(
        Icons.chat,
        size: 28.8.r,
        color: Color(0xFFFEFEFE),
      ));
}
