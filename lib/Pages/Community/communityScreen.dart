// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_interpolation_to_compose_strings

import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_donation_app/Pages/Community/Functions/timeAgo.dart';
import 'package:food_donation_app/Pages/Community/Functions/toCamelCase.dart';
import 'package:food_donation_app/Pages/Community/Widgets/myAppBar.dart';
import 'package:food_donation_app/Pages/Community/Widgets/searchBar.dart';
// import 'package:food_donation_app/Pages/Community/posts.dart';
import 'package:food_donation_app/Provider/communityProvider.dart';
import 'package:food_donation_app/Router/route.gr.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:shimmer/shimmer.dart';

@RoutePage()
class CommunityHomePage extends ConsumerStatefulWidget {
  const CommunityHomePage({super.key});

  @override
  ConsumerState<CommunityHomePage> createState() => _CommunityHomePageState();
}

class _CommunityHomePageState extends ConsumerState<CommunityHomePage> {
  var selectedCategory = 0;
  List<String> categories = [
    "All",
    "Recents",
    "Tips",
    "People",
  ];

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Your code here
      ref.read(communityProvider.notifier).getPosts();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final posts = ref.watch(
      communityProvider.select((_) => _.posts),
    );

    final featuredPostLoading = ref.watch(
      communityProvider.select((_) => _.featuredPostStatus),
    );

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

    Widget FeaturedArticles() {
      return featuredPostLoading != PostStatus.processed
          ? CarouselSlider(
              items: [
                Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    width: 30.sp,
                    height: 200.sp,
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
                  height: 300.sp,
                  disableCenter: true,
                  enlargeCenterPage: true,
                  viewportFraction: 0.7,
                  initialPage: 2,
                  scrollPhysics: NeverScrollableScrollPhysics(),
                  enlargeFactor: 0.4),
            )
          : Container(
              // color: Colors.red,
              // margin: EdgeInsets.only(left: 24.w),
              alignment: Alignment.centerLeft,
              // height: 275.h,
              child: CarouselSlider.builder(
                options: CarouselOptions(
                    height: 300.sp,
                    disableCenter: true,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    viewportFraction: 0.7,
                    initialPage: 2,
                    enlargeFactor: 0.4),
                itemCount: posts!.length,
                itemBuilder:
                    (BuildContext context, int index, int pageViewIndex) {
                  var nameParts = posts[index].username.split(" ");
                  var initials = "";

                  if (nameParts.length > 0 && nameParts[0].isNotEmpty) {
                    initials += nameParts[0].substring(0, 1).toUpperCase();
                  }

                  if (nameParts.length > 1 && nameParts[1].isNotEmpty) {
                    initials += nameParts[1].substring(0, 1).toUpperCase();
                  }
                  return InkWell(
                    onTap: () {
                      log("Tapped");
                      context
                          .pushRoute(ArticleDetailRoute(article: posts[index]));
                    },
                    child: Stack(
                      children: [
                        Container(
                          // margin: EdgeInsets.only(right: 20.w),
                          width: 300.sp,
                          height: 300.sp,
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.r),
                            ),
                            image: DecorationImage(
                              image: CachedNetworkImageProvider(
                                posts[index].imgUrl,
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          // margin: EdgeInsets.only(right: 20.w),
                          width: 300.sp,
                          height: 300.sp,
                          decoration: ShapeDecoration(
                            gradient: LinearGradient(
                              begin: Alignment(0, 0),
                              end: Alignment(0, 1),
                              colors: [
                                Colors.transparent,
                                Colors.black.withOpacity(0.5),
                                Colors.black.withOpacity(0.6),
                                Colors.black.withOpacity(0.7),
                                Colors.black.withOpacity(0.8),
                                Colors.black
                              ],
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.r),
                            ),
                          ),
                        ),
                        Container(
                            // margin: EdgeInsets.only(right: 20.w),
                            width: 300.sp,
                            height: 300.sp,
                            child: Container(
                              padding: EdgeInsets.only(bottom: 13.h),
                              alignment: Alignment.bottomCenter,
                              height: 105.h,
                              decoration: ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.r),
                                ),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    // color: Colors.redAccent,
                                    width: 270.sp,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          posts[index].subject.length > 35
                                              ? toCamelCase(posts[index]
                                                      .subject
                                                      .substring(0, 35)) +
                                                  "..."
                                              : toCamelCase(
                                                  posts[index].subject),
                                          style: TextStyle(
                                            color: Color(0xFFB3B3B8),
                                            fontSize: 14.sp,
                                            fontFamily: 'Outfit',
                                            fontWeight: FontWeight.w500,
                                            height: 0,
                                            letterSpacing: 0.56.sp,
                                          ),
                                        ),
                                        SizedBox(height: 5.h),
                                        Container(
                                          width: 270.w,
                                          height: 50.h,
                                          // color: Colors.red,
                                          child: SingleChildScrollView(
                                            child: Text(
                                              posts[index].description.length >
                                                      100
                                                  ? posts[index]
                                                          .description
                                                          .substring(0, 100) +
                                                      "..."
                                                  : posts[index].description,
                                              style: TextStyle(
                                                color: Color(0xFFF9F8FD),
                                                fontSize: 14.sp,
                                                fontFamily: 'Outfit',
                                                fontWeight: FontWeight.w500,
                                                height: 0,
                                                letterSpacing: 0.56.sp,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 5.h),
                                  Container(
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 5.w),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: 30.w,
                                                height: 30.h,
                                                child: posts[index]
                                                            .createdByAvatar ==
                                                        null
                                                    ? Center(
                                                        child: Text(
                                                          initials,
                                                          style: TextStyle(
                                                            color: Color(
                                                                0xFFF9F8FD),
                                                            fontSize: 14.sp,
                                                            fontFamily:
                                                                'Outfit',
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            height: 0,
                                                            letterSpacing:
                                                                0.56.sp,
                                                          ),
                                                        ),
                                                      )
                                                    : Center(
                                                        child: ClipOval(
                                                          child: Image.network(
                                                            posts[index]
                                                                .createdByAvatar
                                                                .toString(),
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                decoration: ShapeDecoration(
                                                  shape: OvalBorder(
                                                    side: BorderSide(
                                                        width: 2.w,
                                                        color:
                                                            Color(0xFFDAACAC)),
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
                                              ),
                                              const SizedBox(width: 8),
                                              Text(
                                                posts[index].username,
                                                style: TextStyle(
                                                  color: Color(0xFFF9F8FD),
                                                  fontSize: 14.sp,
                                                  fontFamily: 'Outfit',
                                                  fontWeight: FontWeight.w400,
                                                  height: 0,
                                                  letterSpacing: 0.56.sp,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(width: 6.w),
                                        Container(
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: 4.w,
                                                height: 4.h,
                                                decoration: ShapeDecoration(
                                                  color: Color(0xFFD9D9D9),
                                                  shape: OvalBorder(),
                                                ),
                                              ),
                                              SizedBox(width: 4.w),
                                              Text(
                                                timeAgo(posts[index]
                                                    .createdTime
                                                    .toDate()),
                                                style: TextStyle(
                                                  color: Color(0xFF8E7474),
                                                  fontSize: 12.sp,
                                                  fontFamily: 'Outfit',
                                                  fontWeight: FontWeight.w300,
                                                  height: 0,
                                                  letterSpacing: 0.48.sp,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )),
                      ],
                    ),
                  );
                },
              ));
    }

    Widget Recommendations() {
      return featuredPostLoading != PostStatus.processed
          ? Container(
              height: 3 * 130.h,
              child: ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 24.w),
                      child: Stack(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 10.h),
                            height: 110.h,
                            decoration: ShapeDecoration(
                              color: Color(0xFFFEFEFE),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                              shadows: const [
                                BoxShadow(
                                  color: Color(0x3F000000),
                                  blurRadius: 5,
                                  offset: Offset(0, 0),
                                  spreadRadius: 0,
                                )
                              ],
                            ),
                          ),
                          Positioned(
                            left: 10.w,
                            top: 20.h,
                            child: Shimmer.fromColors(
                              baseColor: Colors.grey[300]!,
                              highlightColor: Colors.grey[100]!,
                              child: Container(
                                width: 90.w,
                                height: 89.h,
                                decoration: ShapeDecoration(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.r),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 114.w,
                            top: 21.h,
                            child: Container(
                              width: 243.w,
                              height: 89.h,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Shimmer.fromColors(
                                    baseColor: Colors.grey[300]!,
                                    highlightColor: Colors.grey[100]!,
                                    child: Container(
                                        // margin: EdgeInsets.only(right: 20.w),
                                        width: 200.w,
                                        height: 16.sp,
                                        color: Colors.white),
                                  ),
                                  SizedBox(height: 15.h),
                                  Shimmer.fromColors(
                                    baseColor: Colors.grey[300]!,
                                    highlightColor: Colors.grey[100]!,
                                    child: Container(
                                        // margin: EdgeInsets.only(right: 20.w),
                                        width: 220.w,
                                        height: 50.h,
                                        color: Colors.white),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            )
          : Container(
              height: posts!.length * 130.h,
              child: ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: posts!.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      context.navigateTo(
                          ArticleDetailRoute(article: posts[index]));
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 24.w),
                      child: Stack(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 10.h),
                            height: 110.h,
                            decoration: ShapeDecoration(
                              color: Color(0xFFFEFEFE),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                              shadows: const [
                                BoxShadow(
                                  color: Color(0x3F000000),
                                  blurRadius: 5,
                                  offset: Offset(0, 0),
                                  spreadRadius: 0,
                                )
                              ],
                            ),
                          ),
                          Positioned(
                            left: 10.w,
                            top: 20.h,
                            child: Container(
                              width: 90.w,
                              height: 89.h,
                              decoration: ShapeDecoration(
                                color: Colors.grey[300]!,
                                image: DecorationImage(
                                  image: NetworkImage(
                                    posts[index].imgUrl,
                                  ),
                                  fit: BoxFit.cover,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.r),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 114.w,
                            top: 21.h,
                            child: Container(
                              width: 243.w,
                              height: 89.h,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  featuredPostLoading != PostStatus.processed
                                      ? Shimmer.fromColors(
                                          baseColor: Colors.grey[300]!,
                                          highlightColor: Colors.grey[100]!,
                                          child: Container(
                                              margin:
                                                  EdgeInsets.only(right: 20.w),
                                              width: 200.w,
                                              height: 16.sp,
                                              color: Colors.white),
                                        )
                                      : Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              width: 150.w,
                                              height: 16.sp,
                                              child: Text(
                                                posts[index].subject.length > 15
                                                    ? toCamelCase(posts[index]
                                                            .subject
                                                            .substring(0, 15)) +
                                                        "..."
                                                    : toCamelCase(
                                                        posts[index].subject),
                                                style: TextStyle(
                                                  color: Color(0xFFBFAAAA),
                                                  fontSize: 14.sp,
                                                  fontFamily: 'Outfit',
                                                  fontWeight: FontWeight.w500,
                                                  height: 0,
                                                  letterSpacing: 0.56.sp,
                                                ),
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  width: 4.w,
                                                  height: 4.h,
                                                  decoration: ShapeDecoration(
                                                    color: Color(0xFFD9D9D9),
                                                    shape: OvalBorder(),
                                                  ),
                                                ),
                                                SizedBox(width: 4.w),
                                                Text(
                                                  timeAgo(posts[index]
                                                      .createdTime
                                                      .toDate()),
                                                  style: TextStyle(
                                                    color: Color(0xFF8E7474),
                                                    fontSize: 12.sp,
                                                    fontFamily: 'Outfit',
                                                    fontWeight: FontWeight.w300,
                                                    height: 0,
                                                    letterSpacing: 0.48.sp,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                  SizedBox(height: 15.h),
                                  featuredPostLoading != PostStatus.processed
                                      ? Shimmer.fromColors(
                                          baseColor: Colors.grey[300]!,
                                          highlightColor: Colors.grey[100]!,
                                          child: Container(
                                              margin:
                                                  EdgeInsets.only(right: 20.w),
                                              width: 220.w,
                                              height: 50.h,
                                              color: Colors.white),
                                        )
                                      : Container(
                                          // color: Colors.red,
                                          width: 241.w,
                                          height: 50.h,
                                          child: Text(
                                            posts[index].description.length >
                                                    100
                                                ? posts[index]
                                                        .description
                                                        .substring(0, 96) +
                                                    "..."
                                                : posts[index].description,
                                            style: TextStyle(
                                              color: Color(0xFF201F24),
                                              fontSize: 14.sp,
                                              fontFamily: 'Outfit',
                                              fontWeight: FontWeight.w500,
                                              height: 0,
                                              letterSpacing: 0.56.sp,
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
                },
              ),
            );
    }

    return Scaffold(
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: 50.h),
            child: Column(
              children: [
                MyAppBar(
                    centerWidget: Padding(
                      padding: EdgeInsets.only(left: 57.w),
                      child: GestureDetector(
                        onTap: () {
                          log("Tap on article search bar");
                          context.pushRoute(ArticleSearchPageRoute());
                        },
                        child: MySearchBar(),
                      ),
                    ),
                    rightWidget: Padding(
                      padding: EdgeInsets.only(right: 34.18.w),
                      child: GestureDetector(
                          onTap: () {
                            context.pushRoute(ArticleHistoryRoute());
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
                      FeaturedArticles(),
                      SizedBox(
                        height: 28.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 24.w),
                        child: Align(
                          alignment: AlignmentDirectional.centerStart,
                          child: Text(
                            'Recommendations',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.sp,
                              fontFamily: 'Outfit',
                              fontWeight: FontWeight.w500,
                              height: 0,
                              letterSpacing: 0.80.sp,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Recommendations()
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
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
          ),
          Positioned(
            top: 107.h,
            right: -32,
            child: Container(
                height: 82,
                width: 71,
                child: Image.asset("lib/assets/Community/books and cup.png",
                    fit: BoxFit.contain)),
          )
        ],
      ),
    );
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
