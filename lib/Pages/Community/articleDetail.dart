import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_donation_app/Models/Post.model.dart';
import 'package:food_donation_app/Pages/Community/Functions/timeAgo.dart';
import 'package:food_donation_app/Pages/Community/Widgets/myAppBar.dart';

@RoutePage()
class ArticleDetail extends StatefulWidget {
  final PostModel article;
  const ArticleDetail({required this.article, super.key});

  @override
  State<ArticleDetail> createState() => _ArticleDetailState();
}

class _ArticleDetailState extends State<ArticleDetail> {
  @override
  Widget build(BuildContext context) {
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
                    color: Color(0xFFFEFEFE),
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
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.only(bottom: 20.h),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: SelectableText(
                      widget.article.subject,
                      style: TextStyle(
                        color: Color(0xFF201F24),
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
                          decoration: BoxDecoration(color: Color(0xFFFEFEFE)),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 30.w,
                                height: 30.h,
                                decoration: ShapeDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        widget.article.createdByAvatar),
                                    fit: BoxFit.cover,
                                  ),
                                  shape: OvalBorder(
                                    side: BorderSide(
                                        width: 2.w, color: Color(0xFFDAACAC)),
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
                              SizedBox(width: 8.w),
                              Text(
                                widget.article.username,
                                style: TextStyle(
                                  color: Color(0xFF201F24),
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
                        Container(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
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
                                timeAgo(widget.article.createdTime),
                                style: TextStyle(
                                  color: Color(0xFF8E7474),
                                  fontSize: 14.sp,
                                  fontFamily: 'Outfit',
                                  fontWeight: FontWeight.w300,
                                  height: 0,
                                  letterSpacing: 0.56.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),

                  // Image
                  Stack(
                    children: [
                      Container(
                        width: 369.w,
                        height: 285.h,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30.r),
                          child: Image.network(
                            widget.article.imgUrl,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        width: 369.w,
                        height: 285.h,
                        decoration: ShapeDecoration(
                          gradient: LinearGradient(
                            begin: Alignment(3, 0.00),
                            end: Alignment(0, 0),
                            colors: [Colors.black, Colors.black.withOpacity(0)],
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.r),
                          ),
                        ),
                      ),
                      Container(
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
                                      color: Color(0xFFFEFEFE),
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
                                          addToBookMark();
                                        },
                                        child:
                                            Icon(Icons.bookmark_add_outlined))),
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
                  //  Description
                  Align(
                    alignment: Alignment.centerLeft,
                    child: SelectableText(
                      widget.article.description,
                      style: TextStyle(
                        color: Color(0xFF201F24),
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

void share() {}

void addToBookMark() {}
