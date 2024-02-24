import 'dart:developer';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_donation_app/Pages/Community/Functions/nameProfile.dart';
import 'package:food_donation_app/Pages/Community/Functions/timeAgo.dart';
import 'package:food_donation_app/Pages/Community/Functions/toCamelCase.dart';
import 'package:food_donation_app/Pages/Community/Widgets/postWidget.dart';
import 'package:food_donation_app/Provider/communityProvider.dart';
import 'package:food_donation_app/Router/route.gr.dart';
import 'package:shimmer/shimmer.dart';

import '../constants/constants.dart';

class AllPosts extends ConsumerStatefulWidget {
  const AllPosts({
    super.key,
  });

  @override
  ConsumerState<AllPosts> createState() => _AppPostsState();
}

class _AppPostsState extends ConsumerState<AllPosts> {
  @override
  Widget build(BuildContext context) {
    final posts = ref.watch(
      communityProvider.select((_) => _.posts),
    );
    final featuredPosts = ref.watch(
      communityProvider.select((_) => _.featuredPosts),
    );

    final featuredPostLoading = ref.watch(
      communityProvider.select((_) => _.featuredPostStatus),
    );

    final rcmdPostLoading = ref.watch(
      communityProvider.select((_) => _.rcmdPostStatus),
    );

    final nextRcmdPostLoading =
        ref.watch(communityProvider).nextRcmdPostLoading;

    Widget featuredArticles() {
      return featuredPostLoading != PostStatus.processed
          ? CarouselSlider(
              items: [
                Shimmer(
                  gradient: const LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [Colors.grey, Colors.white, Colors.grey]),
                  child: Container(
                    padding: EdgeInsets.only(top: 10.r),
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
                  scrollPhysics: const NeverScrollableScrollPhysics(),
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
                itemCount: featuredPosts!.length,
                itemBuilder:
                    (BuildContext context, int index, int pageViewIndex) {
                  return InkWell(
                    onTap: () {
                      log("Tapped");
                      context.pushRoute(
                          ArticleDetailRoute(article: featuredPosts[index]));
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
                                featuredPosts[index].imgUrl,
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
                              begin: const Alignment(0, 0),
                              end: const Alignment(0, 1),
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
                        SizedBox(
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
                                  SizedBox(
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
                                          toCamelCase(
                                              featuredPosts[index].subject),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            color: white,
                                            fontSize: 17.sp,
                                            fontFamily: 'Outfit',
                                            fontWeight: FontWeight.bold,
                                            height: 0,
                                            letterSpacing: 0.56.sp,
                                          ),
                                        ),
                                        SizedBox(height: 5.h),
                                        SizedBox(
                                          width: 270.w,
                                          height: 50.h,
                                          // color: Colors.red,
                                          child: SingleChildScrollView(
                                            child: Text(
                                              featuredPosts[index].description,
                                              maxLines: 3,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                color: const Color(0xFFF9F8FD),
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
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
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
                                              decoration: ShapeDecoration(
                                                shape: OvalBorder(
                                                  side: BorderSide(
                                                      width: 2.w, color: brown),
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
                                              child: Center(
                                                  child: ClipOval(
                                                      child: Image.network(
                                                          featuredPosts[index]
                                                              .createdByAvatar
                                                              .toString(),
                                                          fit: BoxFit.cover,
                                                          errorBuilder: (context,
                                                                  error,
                                                                  stackTrace) =>
                                                              Center(
                                                                child: Text(
                                                                  nameProfile(featuredPosts[
                                                                          index]
                                                                      .username),
                                                                  style:
                                                                      TextStyle(
                                                                    color: const Color(
                                                                        0xFFF9F8FD),
                                                                    fontSize:
                                                                        14.sp,
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
                                                              )))),
                                            ),
                                            const SizedBox(width: 8),
                                            Text(
                                              featuredPosts[index].username,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                color: const Color(0xFFF9F8FD),
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
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: 4.w,
                                            height: 4.h,
                                            decoration: const ShapeDecoration(
                                              color: Color(0xFFD9D9D9),
                                              shape: OvalBorder(),
                                            ),
                                          ),
                                          SizedBox(width: 4.w),
                                          Text(
                                            timeAgo(featuredPosts[index]
                                                .createdTime
                                                .toDate()),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              color: white.withOpacity(0.7),
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
                                ],
                              ),
                            )),
                      ],
                    ),
                  );
                },
              ));
    }

    Widget recommendations() {
      return rcmdPostLoading != PostStatus.processed
          ? SizedBox(
              height: 3 * 130.h,
              child: ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Stack(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 5.h),
                            height: 110.h,
                            decoration: ShapeDecoration(
                              color: const Color(0xFFFEFEFE),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                              // shadows: const [
                              //   BoxShadow(
                              //     color: Color(0x3F000000),
                              //     blurRadius: 5,
                              //     offset: Offset(0, 0),
                              //     spreadRadius: 0,
                              //   )
                              // ],
                            ),
                          ),
                          Positioned(
                            left: 10.w,
                            top: 20.h,
                            child: Shimmer(
                              gradient: const LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                    Colors.grey,
                                    Colors.white,
                                    Colors.grey
                                  ]),
                              child: Container(
                                width: 90.w,
                                height: 90.h,
                                decoration: ShapeDecoration(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 114.w,
                            top: 21.h,
                            child: SizedBox(
                              width: 300.w,
                              height: 90.h,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Shimmer(
                                    gradient: const LinearGradient(
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                        colors: [
                                          Colors.grey,
                                          Colors.white,
                                          Colors.grey
                                        ]),
                                    child: Container(
                                      // margin: EdgeInsets.only(right: 20.w),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8.r)),
                                        color: white,
                                      ),
                                      width: 240.w,
                                      height: 16.sp,
                                    ),
                                  ),
                                  SizedBox(height: 15.h),
                                  Shimmer(
                                    gradient: const LinearGradient(
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                        colors: [
                                          Colors.grey,
                                          Colors.white,
                                          Colors.grey
                                        ]),
                                    child: Container(
                                      // margin: EdgeInsets.only(right: 20.w),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(8.r),
                                        ),
                                        color: white,
                                      ),
                                      width: 240.w,
                                      height: 50.h,
                                    ),
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
          : SizedBox(
              height: posts!.length * 130.h,
              child: ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: posts.length,
                itemBuilder: (BuildContext context, int index) {
                  return PostWidget(post: posts[index]);
                },
              ),
            );
    }

    return Column(
      children: [
        featuredArticles(),
        SizedBox(
          height: 28.h,
        ),
        Padding(
          padding: EdgeInsets.only(left: 24.w),
          child: Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              'Explore Articles',
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
        recommendations(),
        nextRcmdPostLoading == PostStatus.initial
            ? Container(
                height: 50.h,
              )
            : nextRcmdPostLoading == PostStatus.processing
                ? SizedBox(
                    height: 50.h,
                    child: Center(
                      child: SizedBox(
                        height: 20.r,
                        width: 20.r,
                        child: const CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Color(0xFF009900)),
                          strokeWidth: 5.0,
                        ),
                      ),
                    ),
                  )
                : nextRcmdPostLoading == PostStatus.exhausted
                    ? SizedBox(
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
