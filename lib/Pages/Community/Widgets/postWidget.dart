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
                width: 243.w,
                height: 89.h,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    rcmdPostLoading != PostStatus.processed
                        ? Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            child: Container(
                                margin: EdgeInsets.only(right: 20.w),
                                width: 200.w,
                                height: 16.sp,
                                color: Colors.white),
                          )
                        : Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 150.w,
                                height: 16.sp,
                                child: Text(
                                  widget.post.subject.length > 15
                                      ? toCamelCase(widget.post.subject
                                              .substring(0, 15)) +
                                          "..."
                                      : toCamelCase(widget.post.subject),
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
                                    timeAgo(widget.post.createdTime.toDate()),
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
                    rcmdPostLoading != PostStatus.processed
                        ? Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            child: Container(
                                margin: EdgeInsets.only(right: 20.w),
                                width: 220.w,
                                height: 50.h,
                                color: Colors.white),
                          )
                        : Container(
                            // color: Colors.red,
                            width: 241.w,
                            height: 50.h,
                            child: Text(
                              widget.post.description.length > 100
                                  ? widget.post.description.substring(0, 96) +
                                      "..."
                                  : widget.post.description,
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
  }
}
