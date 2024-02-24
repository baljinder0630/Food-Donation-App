// ignore_for_file: use_build_context_synchronously

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

import '../constants/constants.dart';
// import 'package:vibration/vibration.dart';

@RoutePage()
class ArticleHistory extends ConsumerStatefulWidget {
  const ArticleHistory({super.key});

  @override
  ConsumerState<ArticleHistory> createState() => _ArticleHistoryState();
}

class _ArticleHistoryState extends ConsumerState<ArticleHistory> {
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

  @override
  Widget build(BuildContext context) {
    final myPosts = ref.watch(communityProvider).myPosts;
    final myBookmarkedPosts = ref.watch(communityProvider).bookMarkedPosts;

    showMenuItems(post, details) {
      return showMenu(
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
                        color: const Color(0xFF201F24),
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
            if (selected == 0)
              PopupMenuItem(
                  padding: EdgeInsets.zero,
                  child: Center(
                      child: Text(
                    'Delete',
                    style: TextStyle(
                      color: const Color(0xFF201F24),
                      fontSize: 16.sp,
                      fontFamily: 'Outfit',
                      fontWeight: FontWeight.w500,
                      height: 0,
                      letterSpacing: 0.64.sp,
                    ),
                  )),
                  onTap: () async {
                    showAdaptiveDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                              title: const Text('Delete Post'),
                              content: const Text(
                                  'Are you sure you want to delete this post?'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    context.popRoute();
                                  },
                                  child: const Text('Cancel'),
                                ),
                                TextButton(
                                  onPressed: () async {
                                    if (await ref
                                        .read(communityProvider.notifier)
                                        .deletePost(post.id)) {
                                      context.popRoute();
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        content: const Text('Post Deleted',
                                            style: TextStyle(
                                              color: Colors.white,
                                            )),
                                        backgroundColor: green,
                                      ));
                                    } else {
                                      context.popRoute();
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        content:
                                            const Text('Failed to delete post',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                )),
                                        backgroundColor: red1,
                                      ));
                                    }
                                  },
                                  child: const Text('Delete'),
                                ),
                              ]);
                        });
                  })
            else
              PopupMenuItem(
                padding: EdgeInsets.zero,
                child: Center(
                    child: Text(
                  'Remove',
                  style: TextStyle(
                    color: const Color(0xFF201F24),
                    fontSize: 16.sp,
                    fontFamily: 'Outfit',
                    fontWeight: FontWeight.w500,
                    height: 0,
                    letterSpacing: 0.64.sp,
                  ),
                )),
                onTap: () async {
                  if (await ref
                      .read(communityProvider.notifier)
                      .removeBookMark(post.id)) {
                    // context.popRoute();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text(
                          'Post Unbookmarked',
                          style: TextStyle(color: Colors.white),
                        ),
                        backgroundColor: green,
                      ),
                    );
                  } else {
                    // context.popRoute();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text('Failed to unbookmark post',
                            style: TextStyle(color: Colors.white)),
                        backgroundColor: red1,
                      ),
                    );
                  }
                },
              )
          ]);
    }

    Widget historyTile(BuildContext context, PostModel post) {
      return GestureDetector(
        onLongPressStart: (details) async {
          showMenuItems(post, details);
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 360.h,
          decoration: ShapeDecoration(
            // color: Colors.redAccent,
            color: const Color(0xFFFEFEFE),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.r),
            ),
            // shadows: const [
            //   BoxShadow(
            //     color: Color(0x3F000000),
            //     blurRadius: 9.60,
            //     offset: Offset(0, 0),
            //     spreadRadius: 0,
            //   )
            // ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 10.h),
              Container(
                width: 370.w,
                height: 210.h,
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
              SizedBox(height: 10.h),
              SizedBox(
                height: 110.h,
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
                        SizedBox(
                          height: 3.h,
                        ),
                        SizedBox(
                          height: 22.h,
                          width: 365.w,
                          child: Text(
                            toCamelCase(post.subject),
                            style: TextStyle(
                              color: brown,
                              fontSize: 17.sp,
                              fontFamily: 'Outfit',
                              fontWeight: FontWeight.bold,
                              height: 0,
                              overflow: TextOverflow.ellipsis,
                              letterSpacing: 0.67.sp,
                            ),
                          ),
                        ),
                        SizedBox(height: 5.h),
                        SizedBox(
                          width: 365.w,
                          height: 40.h,
                          child: Text(
                            post.description,
                            maxLines: 3,
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              color: black,
                              fontSize: 14.sp,
                              fontFamily: 'Outfit',
                              fontWeight: FontWeight.w400,
                              height: 0,
                              overflow: TextOverflow.ellipsis,
                              letterSpacing: 0.56.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 6.h),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 4.80.w,
                          height: 4.80.h,
                          decoration: ShapeDecoration(
                            color: brown,
                            shape: const OvalBorder(),
                          ),
                        ),
                        SizedBox(width: 4.80.w),
                        Text(
                          timeAgo(post.createdTime.toDate()),
                          style: TextStyle(
                            color: brown,
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
                    color: white,
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
            child: GestureDetector(
              onHorizontalDragEnd: (details) async {
                if (mounted && selected == 0) {
                  setState(() {
                    selected = 1;
                  });
                } else if (mounted && selected == 1) {
                  setState(() {
                    selected = 0;
                  });
                }
              },
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 8.h),
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
                            width: 170.w,
                            height: 43.h,
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.w, vertical: 10.h),
                            decoration: ShapeDecoration(
                              color: selected == 0 ? green : Colors.white,
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
                            child: Center(
                              child: Text(
                                'History',
                                style: TextStyle(
                                  color: selected == 0
                                      ? Colors.white
                                      : Colors.black,
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
                            width: 170.w,
                            height: 43.h,
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.w, vertical: 10.h),
                            decoration: ShapeDecoration(
                              color: selected == 1 ? green : Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
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
                              child: Text(
                                'Bookmarked',
                                style: TextStyle(
                                  color: selected == 1
                                      ? Colors.white
                                      : Colors.black,
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
                    height: 15.h,
                  ),
                  if (myPosts!.isEmpty && selected == 0)
                    SizedBox(
                      height: 400.h,
                      width: 400.w,
                      child: Center(
                        child: Text(
                          'No Post Found',
                          style: TextStyle(
                            color: const Color(0xFF201F24),
                            fontSize: 16.sp,
                            fontFamily: 'Outfit',
                            fontWeight: FontWeight.w500,
                            height: 0,
                            letterSpacing: 0.64.sp,
                          ),
                        ),
                      ),
                    ),
                  if (myBookmarkedPosts!.isEmpty && selected == 1)
                    SizedBox(
                      height: 400.h,
                      width: 400.w,
                      child: Center(
                        child: Text(
                          'No Post Bookmarked',
                          style: TextStyle(
                            color: const Color(0xFF201F24),
                            fontSize: 16.sp,
                            fontFamily: 'Outfit',
                            fontWeight: FontWeight.w500,
                            height: 0,
                            letterSpacing: 0.64.sp,
                          ),
                        ),
                      ),
                    ),
                  ListView.builder(
                      padding: EdgeInsets.only(bottom: 40.r),
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: selected == 0
                          ? myPosts.length
                          : myBookmarkedPosts.length,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 340.h,
                          margin: EdgeInsets.symmetric(vertical: 5.r),
                          child: Container(
                              margin: EdgeInsets.only(
                                left: 10.w,
                                right: 10.w,
                              ),
                              child: GestureDetector(
                                  onTap: () {
                                    context.pushRoute(ArticleDetailRoute(
                                        article: selected == 0
                                            ? myPosts[index]
                                            : myBookmarkedPosts[index]));
                                  },
                                  child: historyTile(
                                      context,
                                      selected == 0
                                          ? myPosts[index]
                                          : myBookmarkedPosts[index]))),
                        );
                      })
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
