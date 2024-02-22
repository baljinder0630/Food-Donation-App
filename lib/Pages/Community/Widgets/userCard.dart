import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_donation_app/Models/Community/connections.dart';
import 'package:food_donation_app/Models/User.model.dart';
import 'package:food_donation_app/Pages/Community/Functions/nameProfile.dart';
import 'package:food_donation_app/Provider/communityProvider.dart';
import 'package:food_donation_app/Router/route.gr.dart';
import 'package:shimmer/shimmer.dart';

import '../../constants/constants.dart';

class UserCard extends ConsumerStatefulWidget {
  final UserModel user;

  const UserCard({required this.user, super.key});

  @override
  ConsumerState<UserCard> createState() => _UserCardState();
}

class _UserCardState extends ConsumerState<UserCard> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      // ref.read(communityProvider.notifier).getConnections();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ref
            .watch(communityProvider.notifier)
            .getConnectionStatus(widget.user.uid),
        builder: (context, snapshot) {
          final connection =
              snapshot.data as ConnectionStatus? ?? ConnectionStatus.initial;
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
                margin: EdgeInsets.only(
                    left: 10.w, right: 10.w, bottom: 5.h, top: 5.h),
                width: MediaQuery.of(context).size.width,
                height: 83.h,
                padding: EdgeInsets.all(14.r),
                decoration: ShapeDecoration(
                  color: white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  // shadows: const [
                  //   BoxShadow(
                  //     color: Color(0x3F000000),
                  //     blurRadius: 8,
                  //     offset: Offset(0, 0),
                  //     spreadRadius: 0,
                  //   )
                  // ],
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Adding Shimmer effect to the user card
                      Shimmer(
                        gradient: const LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [Colors.grey, Colors.white, Colors.grey]),
                        child: Container(
                          width: 60.w,
                          height: 65.h,
                          decoration: ShapeDecoration(
                            color: Colors.grey,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(17.r),
                            ),
                          ),
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 18.h,
                            width: 200.w,
                            padding: EdgeInsets.symmetric(horizontal: 5.w),
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
                                color: Colors.grey[300],
                              ),
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Container(
                            height: 10.h,
                            width: 200.w,
                            padding: EdgeInsets.symmetric(horizontal: 5.w),
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
                                color: Colors.grey[300],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Flexible(
                          child: Shimmer(
                        gradient: const LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [Colors.grey, Colors.white, Colors.grey]),
                        child: Container(
                          width: 86.70.w,
                          height: 34.40.h,
                          decoration: ShapeDecoration(
                            color: Colors.grey[300],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(9.50.r),
                            ),
                          ),
                        ),
                      ))
                    ]));
          }

          return Container(
            margin:
                EdgeInsets.only(left: 10.w, right: 10.w, bottom: 5.h, top: 5.h),
            width: MediaQuery.of(context).size.width,
            height: 83.h,
            padding: EdgeInsets.all(14.r),
            decoration: ShapeDecoration(
              color: const Color(0xFFFEFEFE),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.r),
              ),
              // shadows: const [
              //   BoxShadow(
              //     color: Color(0x3F000000),
              //     blurRadius: 8,
              //     offset: Offset(0, 0),
              //     spreadRadius: 0,
              //   )
              // ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // widget.user.photoURL != null || widget.user.photoURL.isEmpty
                Container(
                  width: 60.w,
                  height: 65.h,
                  decoration: ShapeDecoration(
                    color: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.r),
                    child: CachedNetworkImage(
                      imageUrl: widget.user.photoURL,
                      fit: BoxFit.fill,
                      errorWidget: (context, error, stackTrace) {
                        return Container(
                            width: 60.w,
                            height: 65.h,
                            decoration: ShapeDecoration(
                              color: bgColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                  nameProfile(widget.user.displayName)
                                          .isNotEmpty
                                      ? nameProfile(widget.user.displayName)
                                      : "NA",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.sp,
                                    fontFamily: 'Outfit',
                                    fontWeight: FontWeight.w500,
                                    height: 0,
                                    letterSpacing: 0.56.sp,
                                  )),
                            ));
                      },
                    ),
                  ),
                ),
                Flexible(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.all(10.r),
                        width: 130.w,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 18.h,
                              padding: EdgeInsets.symmetric(horizontal: 5.w),
                              child: Text(
                                widget.user.displayName.isEmpty
                                    ? "NO NAME"
                                    : widget.user.displayName.toUpperCase(),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Color(0xFF201F24),
                                  fontSize: 14.sp,
                                  fontFamily: 'Outfit',
                                  fontWeight: FontWeight.w600,
                                  height: 0,
                                  letterSpacing: 0.56.sp,
                                ),
                              ),
                            ),
                            SizedBox(height: 2.h),
                            Container(
                              padding: EdgeInsets.only(left: 8.r),
                              width: 130.w,
                              height: 15.h,
                              child: Text(
                                widget.user.totalConnects.toString() +
                                    " connects",
                                style: TextStyle(
                                  color: black,
                                  fontSize: 12.sp,
                                  fontFamily: 'Outfit',
                                  fontWeight: FontWeight.w300,
                                  height: 0,
                                  letterSpacing: 0.48.sp,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          connection == ConnectionStatus.accepted
                              ? SizedBox()
                              : connection == ConnectionStatus.initial ||
                                      connection == ConnectionStatus.pending ||
                                      connection == ConnectionStatus.rejected
                                  ? Container(
                                      height: 34.40.sp,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          GestureDetector(
                                            onTap: () async {
                                              if (mounted &&
                                                  connection !=
                                                      ConnectionStatus
                                                          .pending) {
                                                await connect();
                                                setState(() {});
                                              }
                                            },
                                            child: Container(
                                              width: 86.70.w,
                                              height: 34.40.h,
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 9.50.w,
                                                  vertical: 7.60.h),
                                              decoration: ShapeDecoration(
                                                color: connection ==
                                                        ConnectionStatus.pending
                                                    ? Color(Colors.grey.value)
                                                    : green,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          9.50.r),
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
                                                child: Container(
                                                  width: 94.w,
                                                  child: Text(
                                                    connection ==
                                                            ConnectionStatus
                                                                .pending
                                                        ? "Sent"
                                                        : 'Connect',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      color: Color(0xFFFEFEFE),
                                                      fontSize: 17.10.sp,
                                                      fontFamily: 'Outfit',
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      height: 0,
                                                      letterSpacing: 0.34.sp,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  : SizedBox(),
                          SizedBox(
                            width: 5.w,
                          ),
                          InkWell(
                            onTap: () async {
                              log("Click on message");
                              ref
                                  .read(communityProvider.notifier)
                                  .getChatRoom(widget.user.uid);
                              // log(widget.user.uid);
                              // if (chatroom.participants!.length == 2) {
                              context.pushRoute(
                                  ChatScreenRoute(TargetUser: widget.user));
                              // } else
                              //   log("Error occured");
                            },
                            child: Container(
                              width: 94.w,
                              height: 34.h,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 9.50.w, vertical: 6.5.h),
                              decoration: ShapeDecoration(
                                color: bgColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                                // shadows: const [
                                //   BoxShadow(
                                //     color: Color(0x3F000000),
                                //     blurRadius: 8,
                                //     offset: Offset(0, 0),
                                //     spreadRadius: 0,
                                //   )
                                // ],
                              ),
                              child: Center(
                                child: Container(
                                  width: 94.w,
                                  child: Text(
                                    'Message',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xFF201F24),
                                      fontSize: 17.10.sp,
                                      fontFamily: 'Outfit',
                                      fontWeight: FontWeight.w400,
                                      height: 0,
                                      letterSpacing: 0.34.sp,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }

  connect() async {
    await ref
        .watch(communityProvider.notifier)
        .sendConnectionReq(widget.user.uid);
  }
}
