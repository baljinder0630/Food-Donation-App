import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_donation_app/Pages/Community/Functions/timeAgo.dart';
import 'package:food_donation_app/Pages/Community/Functions/toCamelCase.dart';
import 'package:food_donation_app/Provider/communityProvider.dart';
import 'package:food_donation_app/Router/route.gr.dart';
import 'package:shimmer/shimmer.dart';

class RecentPosts extends ConsumerStatefulWidget {
  const RecentPosts({
    super.key,
  });

  @override
  ConsumerState<RecentPosts> createState() => _AppPostsState();
}

class _AppPostsState extends ConsumerState<RecentPosts> {
  @override
  Widget build(BuildContext context) {
    final posts = ref.watch(
      communityProvider.select((_) => _.recentPosts),
    );

    final recentPostLoading = ref.watch(
      communityProvider.select((_) => _.recentPostStatus),
    );

    final nextRecentPostLoading = ref.watch(
      communityProvider.select((_) => _.nextRecentPostLoading),
    );

    Widget RecentPosts() {
      return recentPostLoading != PostStatus.processed
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
                                  recentPostLoading != PostStatus.processed
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
                                  recentPostLoading != PostStatus.processed
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

    return Column(
      children: [
        RecentPosts(),
        nextRecentPostLoading == PostStatus.initial
            ? Container(
                height: 50.h,
              )
            : nextRecentPostLoading == PostStatus.processing
                ? SizedBox(
                    height: 50.h,
                    child: Center(
                      child: Container(
                        height: 20.r,
                        width: 20.r,
                        child: const CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Color(0xFFFE4E74)),
                          strokeWidth: 5.0,
                        ),
                      ),
                    ),
                  )
                : nextRecentPostLoading == PostStatus.exhausted
                    ? Container(
                        height: 50.h,
                        child: Center(
                          child: Text(
                            "No more Articles",
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
                      )
                    : Container()
      ],
    );
  }
}
