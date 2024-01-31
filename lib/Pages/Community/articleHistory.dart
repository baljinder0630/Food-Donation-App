import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_donation_app/Models/Community/Post.model.dart';
import 'package:food_donation_app/Pages/Community/Functions/timeAgo.dart';
import 'package:food_donation_app/Pages/Community/Functions/toCamelCase.dart';
import 'package:food_donation_app/Pages/Community/Widgets/myAppBar.dart';
import 'package:food_donation_app/Provider/communityProvider.dart';
import 'package:food_donation_app/Provider/userProvider.dart';
import 'package:food_donation_app/Router/route.gr.dart';
// import 'package:vibration/vibration.dart';

@RoutePage()
class ArticleHistory extends ConsumerStatefulWidget {
  const ArticleHistory({super.key});

  @override
  ConsumerState<ArticleHistory> createState() => _ArticleHistoryState();
}

class _ArticleHistoryState extends ConsumerState<ArticleHistory> {
  @override
  int selected = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(communityProvider.notifier).getMyPosts();
      ref.read(communityProvider.notifier).getBookmarkedPosts(context);
    });
  }

  Widget build(BuildContext context) {
    final myPosts = ref.watch(communityProvider).myPosts;
    final myBookmarkedPosts = ref.watch(communityProvider).bookMarkedPosts;

    Widget HistoryTile(BuildContext context, PostModel post) {
      return GestureDetector(
        onLongPressStart: (details) async {
          // Vibration.vibrate(duration: 10);
          showMenu(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.r),
              ),
              color: Colors.white,
              context: context,
              position: RelativeRect.fromLTRB(
                details.globalPosition.dx,
                details.globalPosition.dy,
                details.globalPosition.dx, // Right
                details.globalPosition.dy, // Bottom
              ),
              items: [
                if (post.userId == ref.watch(authStateProvider).user!.uid)
                  PopupMenuItem(
                    padding: EdgeInsets.zero,
                    child: Center(
                      child: TextButton(
                        onPressed: () {
                          context.popRoute();
                          context.pushRoute(
                              PostArticleRoute(post: post, isEdit: true));
                        },
                        child: Text(
                          'Edit',
                          style: TextStyle(
                            color: Color(0xFF201F24),
                            fontSize: 16.sp,
                            fontFamily: 'Outfit',
                            fontWeight: FontWeight.w500,
                            height: 0,
                            letterSpacing: 0.64.sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                PopupMenuItem(
                  padding: EdgeInsets.zero,
                  child: Center(
                      child: Text(
                    'Delete',
                  )),
                ),
              ]);
        },
        child: Container(
          width: 367.w,
          height: 338.h,
          decoration: ShapeDecoration(
            // color: Colors.redAccent,
            color: Color(0xFFFEFEFE),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.r),
            ),
            shadows: const [
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
                    image: CachedNetworkImageProvider(
                      post.imgUrl,
                    ),
                    fit: BoxFit.cover,
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
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 22.h,
                          width: 310.w,
                          child: Text(
                            toCamelCase(post.subject),
                            style: TextStyle(
                              color: Color(0xFFBFAAAA),
                              fontSize: 16.80.sp,
                              fontFamily: 'Outfit',
                              fontWeight: FontWeight.w500,
                              height: 0,
                              letterSpacing: 0.67.sp,
                            ),
                          ),
                        ),
                        SizedBox(height: 6.h),
                        SizedBox(
                          width: 289.20.w,
                          height: 40.h,
                          child: Text(
                            post.description,
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
                    SizedBox(height: 10.h),
                    Row(
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
                          timeAgo(post.createdTime.toDate()),
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
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }

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
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selected = 0;
                          });
                        },
                        child: Container(
                          width: 149.w,
                          height: 43.h,
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.w, vertical: 10.h),
                          decoration: ShapeDecoration(
                            color: selected == 0
                                ? Color(0xFF77C19D)
                                : Colors.white,
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
                          child: Center(
                            child: Text(
                              'History',
                              style: TextStyle(
                                color:
                                    selected == 0 ? Colors.white : Colors.black,
                                fontSize: 18.sp,
                                fontFamily: 'Outfit',
                                fontWeight: FontWeight.w400,
                                height: 0,
                                letterSpacing: 0.72.sp,
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selected = 1;
                          });
                        },
                        child: Container(
                          width: 149.w,
                          height: 43.h,
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.w, vertical: 10.h),
                          decoration: ShapeDecoration(
                            color: selected == 1
                                ? Color(0xFF77C19D)
                                : Colors.white,
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
                          child: Center(
                            child: Text(
                              'Bookmarked',
                              style: TextStyle(
                                color:
                                    selected == 1 ? Colors.white : Colors.black,
                                fontSize: 18.sp,
                                fontFamily: 'Outfit',
                                fontWeight: FontWeight.w400,
                                height: 0,
                                letterSpacing: 0.72.sp,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                if (myPosts!.length <= 0 && selected == 0)
                  Center(
                    child: Text(
                      'No Post Found',
                      style: TextStyle(
                        color: Color(0xFF201F24),
                        fontSize: 16.sp,
                        fontFamily: 'Outfit',
                        fontWeight: FontWeight.w500,
                        height: 0,
                        letterSpacing: 0.64.sp,
                      ),
                    ),
                  ),
                if (myBookmarkedPosts!.length <= 0 && selected == 1)
                  Center(
                    child: Text(
                      'No Post Bookmarked',
                      style: TextStyle(
                        color: Color(0xFF201F24),
                        fontSize: 16.sp,
                        fontFamily: 'Outfit',
                        fontWeight: FontWeight.w500,
                        height: 0,
                        letterSpacing: 0.64.sp,
                      ),
                    ),
                  ),
                ListView.builder(
                    padding: EdgeInsets.zero,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: selected == 0
                        ? myPosts!.length
                        : myBookmarkedPosts!.length,
                    itemBuilder: (context, index) {
                      return Container(
                          margin: EdgeInsets.only(
                              left: 29.w, right: 33.w, bottom: 24.h),
                          child: GestureDetector(
                              onTap: () {
                                context.pushRoute(ArticleDetailRoute(
                                    article: selected == 0
                                        ? myPosts[index]
                                        : myBookmarkedPosts[index]));
                              },
                              child: HistoryTile(
                                  context,
                                  selected == 0
                                      ? myPosts[index]
                                      : myBookmarkedPosts[index])));
                    })
              ],
            ),
          )
        ],
      ),
    );
  }
}
