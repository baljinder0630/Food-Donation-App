// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_donation_app/Pages/Community/Functions/timeAgo.dart';
import 'package:food_donation_app/Pages/Community/Widgets/myAppBar.dart';
// import 'package:food_donation_app/Pages/Community/posts.dart';
import 'package:food_donation_app/Provider/communityProvider.dart';
import 'package:food_donation_app/Router/route.gr.dart';
import 'package:carousel_slider/carousel_slider.dart';

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
      return Container(
          // color: Colors.red,
          margin: EdgeInsets.only(left: 24.w),
          alignment: Alignment.centerLeft,
          height: 275.h,
          child: posts!.length == 0
              ? SizedBox()
              : CarouselSlider.builder(
                  itemCount: posts.length,
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
                    return Hero(
                      tag: posts[index].id,
                      child: GestureDetector(
                        onTap: () {
                          context.navigateTo(
                              ArticleDetailRoute(article: posts[index]));
                        },
                        child: Stack(
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 20.w),
                              width: 275.w,
                              height: 306.h,
                              decoration: ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.r),
                                ),
                                image: DecorationImage(
                                  image: NetworkImage(posts[index].imgUrl),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 20.w),
                              width: 275.w,
                              height: 306.h,
                              decoration: ShapeDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment(-0.00, -1.00),
                                  end: Alignment(0, 1),
                                  colors: [
                                    Colors.white.withOpacity(0),
                                    Colors.black.withOpacity(0),
                                    Colors.black
                                  ],
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.r),
                                ),
                              ),
                            ),
                            Container(
                                margin: EdgeInsets.only(right: 20.w),
                                width: 275.w,
                                height: 306.h,
                                child: Container(
                                  alignment: Alignment.bottomCenter,
                                  padding: EdgeInsets.only(bottom: 13.h),
                                  width: 241.w,
                                  height: 105.h,
                                  decoration: ShapeDecoration(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.r),
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              posts[index].subject.length > 30
                                                  ? posts[index]
                                                          .subject
                                                          .substring(0, 30) +
                                                      "..."
                                                  : posts[index].subject,
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
                                            SizedBox(
                                              width: 241.w,
                                              child: SingleChildScrollView(
                                                child: Text(
                                                  posts[index]
                                                              .description
                                                              .length >
                                                          70
                                                      ? posts[index]
                                                              .description
                                                              .substring(
                                                                  0, 70) +
                                                          "..."
                                                      : posts[index]
                                                          .description,
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
                                      SizedBox(height: 16.h),
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
                                                                    FontWeight
                                                                        .w400,
                                                                height: 0,
                                                                letterSpacing:
                                                                    0.56.sp,
                                                              ),
                                                            ),
                                                          )
                                                        : Center(
                                                            child: ClipOval(
                                                              child:
                                                                  Image.network(
                                                                posts[index]
                                                                    .createdByAvatar
                                                                    .toString(),
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          ),
                                                    decoration: ShapeDecoration(
                                                      shape: OvalBorder(
                                                        side: BorderSide(
                                                            width: 2.w,
                                                            color: Color(
                                                                0xFFDAACAC)),
                                                      ),
                                                      shadows: const [
                                                        BoxShadow(
                                                          color:
                                                              Color(0x3F000000),
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
                                                      fontWeight:
                                                          FontWeight.w400,
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
                                                      fontWeight:
                                                          FontWeight.w300,
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
                      ),
                    );
                  },
                  options: CarouselOptions(
                      height: 306.h,
                      viewportFraction: 0.7,
                      padEnds: false,
                      autoPlayAnimationDuration: Duration(milliseconds: 1000),
                      enableInfiniteScroll: true,
                      autoPlay: true,
                      disableCenter: true)));
    }

    Widget Recommendations() {
      return Container(
        height: posts!.length * 130.h,
        child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          itemCount: posts.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                context.navigateTo(ArticleDetailRoute(article: posts[index]));
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
                          color: Colors.green,
                          image: DecorationImage(
                            image: NetworkImage(posts[index].imgUrl),
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
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 150.w,
                                  height: 16.sp,
                                  child: Text(
                                    posts[index].subject.length > 20
                                        ? posts[index]
                                                .subject
                                                .substring(0, 20) +
                                            "..."
                                        : posts[index].subject,
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
                                      timeAgo(
                                          posts[index].createdTime.toDate()),
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
                            Container(
                              // color: Colors.red,
                              width: 241.w,
                              height: 50.h,
                              child: Text(
                                posts[index].description.length > 100
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
          SafeArea(
            child: Container(
              margin: EdgeInsets.only(top: 48.h),
              child: Column(
                children: [
                  MyAppBar(
                      centerWidget: Searchbar(context),
                      rightWidget: SearchHistory(context)),
                  SizedBox(
                    height: 10.h,
                  ),
                  Expanded(
                    child: ListView(
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
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: GestureDetector(
              onTap: () async {
                context.pushRoute(const PostArticleRoute());
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
  return Padding(
    padding: EdgeInsets.only(right: 34.18.w),
    child: Container(
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
        )),
  );
}

Widget Searchbar(context) {
  return Padding(
    padding: EdgeInsets.only(left: 57.02.h),
    child: Container(
      width: 260.w,
      height: 45.83.h,
      decoration: ShapeDecoration(
        color: Color(0xFFFEFEFE),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.r),
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
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 24.r,
            height: 24.r,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(),
            child: Icon(Icons.search_rounded, size: 24.r, color: Colors.black),
          ),
          SizedBox(width: 8.w),
          Text(
            'Search For ',
            style: TextStyle(
              color: Color(0xFF201F24),
              fontSize: 18.sp,
              fontFamily: 'Outfit',
              fontWeight: FontWeight.w400,
              height: 0,
              letterSpacing: 0.36.sp,
            ),
          ),
          Container(
            height: 23.h,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Articles',
                  style: TextStyle(
                    color: Color(0xFF5272FC),
                    fontSize: 18.sp,
                    fontFamily: 'Outfit',
                    fontWeight: FontWeight.w400,
                    height: 0,
                    letterSpacing: 0.36.sp,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
