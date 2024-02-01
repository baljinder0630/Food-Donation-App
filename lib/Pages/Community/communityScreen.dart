// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_interpolation_to_compose_strings

import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_donation_app/Pages/Community/Widgets/myAppBar.dart';
import 'package:food_donation_app/Pages/Community/Widgets/searchBar.dart';
import 'package:food_donation_app/Pages/Community/allChats.dart';
import 'package:food_donation_app/Pages/Community/allPosts.dart';
import 'package:food_donation_app/Pages/Community/peoplePage.dart';
import 'package:food_donation_app/Pages/Community/recentPosts.dart';
import 'package:food_donation_app/Provider/communityProvider.dart';
import 'package:food_donation_app/Router/route.gr.dart';
import 'package:shimmer/shimmer.dart';
import '../constants/constants.dart';

@RoutePage()
class CommunityHomePage extends ConsumerStatefulWidget {
  const CommunityHomePage({super.key});

  @override
  ConsumerState<CommunityHomePage> createState() => _CommunityHomePageState();
}

class _CommunityHomePageState extends ConsumerState<CommunityHomePage> {
  int selectedCategory = 0;
  List<String> categories = [
    "All",
    "Recents",
    "Chat",
    "People",
  ];

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Your code here
      ref.read(communityProvider.notifier).getPosts(0);
      ref.read(communityProvider.notifier).getRecentPosts(0);
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
                Text(
                  'Community',
                  style: TextStyle(
                    color: Color(0xFF201F24),
                    fontSize: 20.sp,
                    fontFamily: 'Outfit',
                    fontWeight: FontWeight.w600,
                    height: 0,
                    letterSpacing: 0.40.sp,
                  ),
                ),
                SizedBox(height: 10.h),
                MyAppBar(
                    centerWidget: selectedCategory == 3
                        ? Padding(
                            padding: EdgeInsets.only(left: 57.w),
                            child: GestureDetector(
                              onTap: () {},
                              child: MySearchBar(title: "Profile"),
                            ),
                          )
                        : Padding(
                            padding: EdgeInsets.only(left: 57.w),
                            child: GestureDetector(
                              onTap: () {
                                context.pushRoute(ArticleSearchPageRoute());
                              },
                              child: MySearchBar(title: "Articles"),
                            ),
                          ),
                    rightWidget: selectedCategory == 3
                        ? SizedBox()
                        : Padding(
                            padding: EdgeInsets.only(right: 34.18.w),
                            child: GestureDetector(
                                onTap: () {
                                  context.navigateTo(ArticleHistoryRoute());
                                },
                                child: SearchHistory(context)),
                          )),
                SizedBox(
                  height: 10.h,
                ),
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    physics: BouncingScrollPhysics(),
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
              ],
            ),
          ),
          selectedCategory == 0
              ? Align(
                  alignment: Alignment.bottomRight,
                  child: InkWell(
                    onTap: () async {
                      context.pushRoute(PostArticleRoute());
                    },
                    child: Container(
                        margin: EdgeInsets.only(bottom: 30.h, right: 30.w),
                        width: 60.r,
                        height: 60.r,
                        decoration: const BoxDecoration(
                          color: Color(0xFFFEFEFE),
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
                        child: Icon(Icons.add_circle_rounded,
                            size: 36.r, color: Color(0xFF5272FC))),
                  ),
                )
              : SizedBox(),
          selectedCategory != 3
              ? Positioned(
                  top: 147.h,
                  right: -32.w,
                  child: Image.asset("lib/assets/Community/books and cup.png",
                      height: 82.h, width: 71.w, fit: BoxFit.contain),
                )
              : Positioned(
                  top: 57.h,
                  right: -37.w,
                  child: Image.asset(
                    "lib/assets/Community/peoples.png",
                    width: 106.w,
                    height: 126.h,
                    fit: BoxFit.contain,
                  ),
                )
        ],
      ),
    );
  }
}

Widget getSelectedCategoryWidget(int selectedCategory) {
  switch (selectedCategory) {
    case 0:
      return AllPosts();
    // Add more cases as needed
    case 1:
      return RecentPosts();
    case 2:
      return Container(child: AllChatsPage());
    case 3:
      return Container(child: PeoplePage());
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
        color: Color(0xFFFEFEFE),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Icon(
        Icons.history_rounded,
        size: 28.8.r,
        color: Colors.black,
      ));
}
