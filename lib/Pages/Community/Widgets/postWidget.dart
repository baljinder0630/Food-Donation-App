import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_donation_app/Models/Community/Post.model.dart';
import 'package:food_donation_app/Pages/Community/Functions/timeAgo.dart';
import 'package:food_donation_app/Pages/Community/Functions/toCamelCase.dart';
import 'package:food_donation_app/Provider/communityProvider.dart';
import 'package:food_donation_app/Router/route.gr.dart';
import 'package:shimmer/shimmer.dart';

import '../../constants/constants.dart';

class PostWidget extends ConsumerStatefulWidget {
  const PostWidget({
    super.key,
    required this.post,
  });

  final PostModel post;

  @override
  ConsumerState<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends ConsumerState<PostWidget> {
  @override
  Widget build(BuildContext context) {
    final rcmdPostLoading = ref.watch(
      communityProvider.select((_) => _.rcmdPostStatus),
    );

    return InkWell(
      onTap: () async {
        await ref
            .read(communityProvider.notifier)
            .increaseCounter(widget.post.id);
        context.navigateTo(ArticleDetailRoute(article: widget.post));
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.w),
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 5.h),
              height: 120.h,
              decoration: ShapeDecoration(
                color: white,
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
              child: Container(
                width: 90.w,
                height: 90.h,
                decoration: ShapeDecoration(
                  color: Colors.grey[300]!,
                  image: DecorationImage(
                    image: NetworkImage(
                      widget.post.imgUrl,
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
                width: 300.w,
                height: 90.h,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    rcmdPostLoading != PostStatus.processed
                        ? Shimmer(
                            gradient: const LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [
                                  Colors.grey,
                                  Colors.white,
                                  Colors.grey
                                ]),
                            child: Container(
                                margin: EdgeInsets.only(right: 20.w),
                                width: 200.w,
                                height: 16.sp,
                                color: Colors.white),
                          )
                        : Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 10.h,
                              ),
                              Container(
                                width: 210.w,
                                height: 15.h,
                                child: Text(
                                  toCamelCase(
                                    widget.post.subject,
                                  ),
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    color: brown,
                                    fontSize: 17.sp,
                                    fontFamily: 'Outfit',
                                    fontWeight: FontWeight.bold,
                                    height: 0,
                                    overflow: TextOverflow.ellipsis,
                                    letterSpacing: 0.67.sp,
                                  ),
                                  // widget.post.subject.length > 15
                                  //     ? toCamelCase(widget.post.subject
                                  //             .substring(0, 15)) +
                                  //         "..."
                                  //     : toCamelCase(widget.post.subject),
                                  // style: TextStyle(
                                  //   color: Color(0xFFBFAAAA),
                                  //   fontSize: 14.sp,
                                  //   fontFamily: 'Outfit',
                                  //   fontWeight: FontWeight.w500,
                                  //   height: 0,
                                  //   letterSpacing: 0.56.sp,
                                  // ),
                                ),
                              ),
                              Row(
                                children: [
                                  SizedBox(width: 4.w),
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
                                    timeAgo(widget.post.createdTime.toDate()),
                                    style: TextStyle(
                                      color: brown,
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
                    rcmdPostLoading != PostStatus.processed
                        ? Shimmer(
                            gradient: const LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [
                                  Colors.grey,
                                  Colors.white,
                                  Colors.grey
                                ]),
                            child: Container(
                                margin: EdgeInsets.only(right: 20.w),
                                width: 200.w,
                                height: 50.h,
                                color: Colors.white),
                          )
                        : Container(
                            // color: Colors.red,
                            width: 260.w,
                            height: 60.h,
                            child: Text(
                              toCamelCase(
                                widget.post.description,
                              ),
                              textAlign: TextAlign.justify,
                              maxLines: 3,
                              style: TextStyle(
                                color: black.withOpacity(0.8),
                                fontSize: 14.sp,
                                fontFamily: 'Outfit',
                                fontWeight: FontWeight.w500,
                                height: 0,
                                overflow: TextOverflow.ellipsis,
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
  }
}
