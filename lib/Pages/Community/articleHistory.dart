import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_donation_app/Pages/Community/Widgets/myAppBar.dart';

@RoutePage()
class ArticleHistory extends StatefulWidget {
  const ArticleHistory({super.key});

  @override
  State<ArticleHistory> createState() => _ArticleHistoryState();
}

class _ArticleHistoryState extends State<ArticleHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 50.h,
          ),
          MyAppBar(
              centerWidget: Padding(
                padding: EdgeInsets.only(left: 117.02.w),
                child: Text(
                  'Article History',
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
              rightWidget: Padding(
                padding: EdgeInsets.only(top: 6.h),
                child: Container(
                  width: 79.w,
                  height: 91.24.h,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image:
                          AssetImage("lib/assets/Community/books and cup.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              )),
          SizedBox(
            height: 10.h,
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 14.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 149.w,
                        height: 43.h,
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.w, vertical: 10.h),
                        decoration: ShapeDecoration(
                          color: Color(0xFF77C19D),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.r),
                          ),
                          shadows: [
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
                            Text(
                              'History',
                              style: TextStyle(
                                color: Color(0xFFFEFEFE),
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
                      Container(
                        width: 149.w,
                        height: 43.h,
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.w, vertical: 10.h),
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          shadows: [
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
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Bookmarked',
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
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                ListView.builder(
                    padding: EdgeInsets.zero,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return HistoryTile();
                    })
              ],
            ),
          )
        ],
      ),
    );
  }
}

class HistoryTile extends StatelessWidget {
  const HistoryTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 367.w,
      height: 338.h,
      margin: EdgeInsets.only(left: 29.w, right: 33.w, bottom: 24.h),
      decoration: ShapeDecoration(
        // color: Colors.redAccent,
        color: Color(0xFFFEFEFE),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 9.60,
            offset: Offset(0, 0),
            spreadRadius: 0,
          )
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 320.w,
            height: 180.h,
            decoration: ShapeDecoration(
              image: DecorationImage(
                image: NetworkImage("https://via.placeholder.com/330x189"),
                fit: BoxFit.fill,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.r),
              ),
            ),
          ),
          SizedBox(height: 14.h),
          Container(
            height: 101.h,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'WASTE REDUCTION',
                        style: TextStyle(
                          color: Color(0xFFBFAAAA),
                          fontSize: 16.80.sp,
                          fontFamily: 'Outfit',
                          fontWeight: FontWeight.w500,
                          height: 0,
                          letterSpacing: 0.67.sp,
                        ),
                      ),
                      SizedBox(height: 6.h),
                      SizedBox(
                        width: 289.20.w,
                        child: Text(
                          '10 Easy Ways to Reduce Food Waste in Your Home',
                          style: TextStyle(
                            color: Color(0xFF201F24),
                            fontSize: 16.80.sp,
                            fontFamily: 'Outfit',
                            fontWeight: FontWeight.w500,
                            height: 0,
                            letterSpacing: 0.67.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.h),
                Container(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 4.80.w,
                              height: 4.80.h,
                              decoration: ShapeDecoration(
                                color: Color(0xFFD9D9D9),
                                shape: OvalBorder(),
                              ),
                            ),
                            SizedBox(width: 4.80.w),
                            Text(
                              'Posted on 15/04/2023',
                              style: TextStyle(
                                color: Color(0xFF8E7474),
                                fontSize: 14.40.sp,
                                fontFamily: 'Outfit',
                                fontWeight: FontWeight.w300,
                                height: 0,
                                letterSpacing: 0.58.sp,
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
          ),
        ],
      ),
    );
  }
}
