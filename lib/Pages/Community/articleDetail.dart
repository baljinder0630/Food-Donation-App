import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_donation_app/Models/Community/Post.model.dart';
import 'package:food_donation_app/Pages/Community/Functions/nameProfile.dart';
import 'package:food_donation_app/Pages/Community/Functions/timeAgo.dart';
import 'package:food_donation_app/Pages/Community/Functions/toCamelCase.dart';
import 'package:food_donation_app/Pages/Community/Widgets/myAppBar.dart';
import 'package:food_donation_app/Provider/communityProvider.dart';
import 'package:food_donation_app/Provider/userProvider.dart';

import '../constants/constants.dart';

@RoutePage()
class ArticleDetail extends ConsumerStatefulWidget {
  final PostModel article;

  const ArticleDetail({required this.article, super.key});

  @override
  ConsumerState<ArticleDetail> createState() => _ArticleDetailState();
}

class _ArticleDetailState extends ConsumerState<ArticleDetail> {
  @override
  Widget build(BuildContext context) {
    // void share() {}

    void toogleBookMark() {
      ref.watch(communityProvider.notifier).addToBookMark(
          ref.watch(authStateProvider).user!.uid, widget.article.id, context);
    }

    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 48.h),
          MyAppBar(
              centerWidget: Padding(
                padding: EdgeInsets.only(left: 118.h),
                child: Text(
                  'Article Details',
                  style: TextStyle(
                    color: const Color(0xFFFEFEFE),
                    fontSize: 20.sp,
                    fontFamily: 'Outfit',
                    fontWeight: FontWeight.w600,
                    height: 0,
                    letterSpacing: 0.40.sp,
                  ),
                ),
              ),
              rightWidget: Container(
                padding: EdgeInsets.only(top: 6.h),
                width: 79.w,
                height: 91.24.h,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("lib/assets/Community/books and cup.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              )),
          SizedBox(height: 34.h),
          Expanded(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 29.w),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.only(bottom: 20.h),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: SelectableText(
                      toCamelCase(widget.article.subject),
                      style: TextStyle(
                        color: const Color(0xFF201F24),
                        fontSize: 20.sp,
                        fontFamily: 'Outfit',
                        fontWeight: FontWeight.w500,
                        height: 0,
                        letterSpacing: 0.80.sp,
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Container(
                    alignment: Alignment.centerLeft,
                    height: 30.h,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 5.w),
                          decoration:
                              const BoxDecoration(color: Colors.transparent),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 30.w,
                                height: 30.h,
                                decoration: ShapeDecoration(
                                  shape: OvalBorder(
                                    side: BorderSide(width: 2.w, color: brown),
                                  ),
                                  color: Colors.black,
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
                                      widget.article.createdByAvatar.toString(),
                                      fit: BoxFit.cover,
                                      errorBuilder: (BuildContext context,
                                          Object exception,
                                          StackTrace? stackTrace) {
                                        return Center(
                                          child: Text(
                                            nameProfile(
                                                widget.article.username),
                                            style: TextStyle(
                                              color: const Color(0xFFF9F8FD),
                                              fontSize: 14.sp,
                                              fontFamily: 'Outfit',
                                              fontWeight: FontWeight.w400,
                                              height: 0,
                                              letterSpacing: 0.56.sp,
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 8.w),
                              Text(
                                widget.article.username,
                                style: TextStyle(
                                  color: const Color(0xFF201F24),
                                  fontSize: 18.sp,
                                  fontFamily: 'Outfit',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                  letterSpacing: 0.72.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 6.w),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 4.w,
                              height: 4.h,
                              decoration: ShapeDecoration(
                                color: brown,
                                shape: const OvalBorder(),
                              ),
                            ),
                            SizedBox(width: 6.w),
                            Text(
                              timeAgo(widget.article.createdTime.toDate()),
                              style: TextStyle(
                                color: black,
                                fontSize: 14.sp,
                                fontFamily: 'Outfit',
                                fontWeight: FontWeight.w300,
                                height: 0,
                                letterSpacing: 0.56.sp,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),

                  // Image
                  Stack(
                    children: [
                      SizedBox(
                        width: 369.w,
                        height: 285.h,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30.r),
                          child: Image(
                            image: CachedNetworkImageProvider(
                              widget.article.imgUrl,
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        width: 369.w,
                        height: 285.h,
                        decoration: ShapeDecoration(
                          gradient: LinearGradient(
                            begin: const Alignment(3, 0.00),
                            end: const Alignment(0, 0),
                            colors: [Colors.black, Colors.black.withOpacity(0)],
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.r),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 285.h,
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            width: 36.w,
                            // height: 84.h,
                            margin: EdgeInsets.only(bottom: 20.h, right: 17.w),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    width: 36.w,
                                    height: 36.h,
                                    decoration: const ShapeDecoration(
                                      color: Colors.black,
                                      shape: OvalBorder(),
                                      shadows: [
                                        BoxShadow(
                                          color: Color(0x3F000000),
                                          blurRadius: 8,
                                          offset: Offset(0, 0),
                                          spreadRadius: 0,
                                        )
                                      ],
                                    ),
                                    alignment: Alignment.center,
                                    child: GestureDetector(
                                        onTap: () {
                                          toogleBookMark();
                                        },
                                        child: const Icon(
                                          Icons.bookmark_add_outlined,
                                          color: Colors.white,
                                        ))),
                                // SizedBox(height: 12.h),
                                // Container(
                                //     width: 36.w,
                                //     height: 36.h,
                                //     decoration: const ShapeDecoration(
                                //       color: Color(0xFFFEFEFE),
                                //       shape: OvalBorder(),
                                //       shadows: [
                                //         BoxShadow(
                                //           color: Color(0x3F000000),
                                //           blurRadius: 8,
                                //           offset: Offset(0, 0),
                                //           spreadRadius: 0,
                                //         )
                                //       ],
                                //     ),
                                //     alignment: Alignment.center,
                                //     child: GestureDetector(
                                //         onTap: () {
                                //           share();
                                //         },
                                //         child: Icon(Icons.share_outlined))),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 20.h),

                  Align(
                    alignment: Alignment.centerLeft,
                    child: SelectableText(
                      widget.article.description,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        color: const Color(0xFF201F24),
                        fontSize: 16.sp,
                        fontFamily: 'Outfit',
                        fontWeight: FontWeight.w300,
                        letterSpacing: 0.64.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}
