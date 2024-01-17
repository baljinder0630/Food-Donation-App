import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_donation_app/Models/Post.model.dart';
import 'package:food_donation_app/Pages/Community/Components/Widgets/Spacer.dart';
import 'package:food_donation_app/Pages/Community/Components/Widgets/myBackButton.dart';
import 'package:food_donation_app/Router/route.gr.dart';

@RoutePage()
class CommunityHomePage extends StatefulWidget {
  const CommunityHomePage({super.key});

  @override
  State<CommunityHomePage> createState() => _CommunityHomePageState();
}

class _CommunityHomePageState extends State<CommunityHomePage> {
  var selectedCategory = 0;
  List<String> categories = [
    "All",
    "Recents",
    "Tips",
    "People",
  ];

  Widget categoryWidget() {
    return Container(
      alignment: Alignment.centerLeft,
      height: 43.h,
      child: ListView.builder(
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
      floatingActionButton: Container(
        decoration: const BoxDecoration(
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
        child: FloatingActionButton(
          backgroundColor: Color(0xffFEFEFE),
          shape: OvalBorder(),
          onPressed: () {
            context.pushRoute(const PostArticleRoute());
          },
          elevation: 0.0,
          child: Icon(Icons.add_circle_rounded,
              size: 36.r, color: Color(0xFF5272FC)),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 23.98.w),
          child: Column(
            children: [
              customAppBarBg(
                  context, Searchbar(context), SearchHistory(context)),
              MySpacer(),
              categoryWidget(),
              MySpacer(),
            ],
          ),
        ),
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
            'Search For  ',
            style: TextStyle(
              color: Color(0xFF201F24),
              fontSize: 18.sp,
              fontFamily: 'Outfit',
              fontWeight: FontWeight.w400,
              height: 0,
              letterSpacing: 0.36.sp,
            ),
          ),
          SizedBox(width: 8.w),
          Container(
            width: 62.w,
            height: 23.h,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
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

Widget customAppBarBg(context, Widget centerWidget, Widget rightWidget) {
  return Padding(
    padding: EdgeInsets.only(
      top: 21.h,
    ),
    child: Container(
        width: double.infinity,
        child: Stack(
          children: [
            Container(
                width: double.infinity,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        width: double.infinity,
                        height: 92.h,
                        decoration: BoxDecoration(
                          color: Color(0xFF5272FC),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25.r),
                            bottomLeft: Radius.circular(25.r),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        // width: double.infinity,
                        height: 92.h,
                        child: Image.asset("lib/assets/Community/Appbar1.png"),
                      ),
                    ),
                  ],
                )),
            Container(
              height: 92.h,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: 42.r,
                  height: 42.r,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(25.r),
                      bottomRight: Radius.circular(25.r),
                    ),
                  ),
                  child: Center(
                    child: Padding(
                        padding: EdgeInsets.only(
                            left: 2.w, right: 3, top: 2.h, bottom: 2.h),
                        child: MyBackButton()),
                  ),
                ),
              ),
            ),
            Container(
              height: 92.h,
              child:
                  Align(alignment: Alignment.centerLeft, child: centerWidget),
            ),
            Container(
              height: 92.h,
              child: Align(
                alignment: Alignment.centerRight,
                child: rightWidget,
              ),
            )
          ],
        )),
  );
}
