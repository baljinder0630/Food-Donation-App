import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_donation_app/Models/User.model.dart';
import 'package:food_donation_app/Pages/Community/Functions/nameProfile.dart';
import 'package:food_donation_app/Provider/communityProvider.dart';
import 'package:food_donation_app/Router/route.gr.dart';

class AllChatsPage extends ConsumerStatefulWidget {
  const AllChatsPage({super.key});

  @override
  ConsumerState<AllChatsPage> createState() => _AllChatsPageState();
}

class _AllChatsPageState extends ConsumerState<AllChatsPage> {
  @override
  Widget build(BuildContext context) {
    final users = ref.watch(communityProvider).users;

    connect() {}

    Widget PeopleCard(UserModel user) {
      return Container(
        margin:
            EdgeInsets.only(left: 24.w, right: 24.w, bottom: 10.h, top: 10.h),
        width: 376.w,
        height: 83.h,
        padding: EdgeInsets.all(14.r),
        decoration: ShapeDecoration(
          color: const Color(0xFFFEFEFE),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            user.photoURL != null || user.photoURL.isEmpty
                ? Container(
                    width: 59.85.w,
                    height: 64.60.h,
                    decoration: ShapeDecoration(
                      color: Colors.grey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(17),
                      ),
                    ),
                    child: Center(
                      child: Text(
                          nameProfile(user.displayName).isNotEmpty
                              ? nameProfile(user.displayName)
                              : "NA",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.sp,
                            fontFamily: 'Outfit',
                            fontWeight: FontWeight.w500,
                            height: 0,
                            letterSpacing: 0.56.sp,
                          )),
                    ))
                : Container(
                    width: 59.85.w,
                    height: 64.60.h,
                    decoration: ShapeDecoration(
                      color: Colors.black,
                      image: DecorationImage(
                        image:
                            NetworkImage("https://via.placeholder.com/60x65"),
                        fit: BoxFit.fill,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(17),
                      ),
                    ),
                  ),
            Container(
              width: 100.w,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      height: 18.h,
                      child: Text(
                        user.displayName.isEmpty
                            ? "NO NAME"
                            : user.displayName.length > 10
                                ? user.displayName
                                    .substring(0, 10)
                                    .toUpperCase()
                                : user.displayName.toUpperCase(),
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
                  ),
                  SizedBox(height: 2.h),
                  Center(
                    child: Container(
                      height: 15.h,
                      child: Text(
                        user.totalConnects.toString() + " connects",
                        style: TextStyle(
                          color: Color(0xFF201F24),
                          fontSize: 12.sp,
                          fontFamily: 'Outfit',
                          fontWeight: FontWeight.w300,
                          height: 0,
                          letterSpacing: 0.48.sp,
                        ),
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
                Container(
                  height: 34.40.sp,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          log("Connect");
                          connect();
                        },
                        child: Container(
                          width: 86.70.w,
                          height: 34.40.h,
                          padding: EdgeInsets.symmetric(
                              horizontal: 9.50.w, vertical: 7.60.h),
                          decoration: ShapeDecoration(
                            color: Color(0xFF5272FC),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(9.50.r),
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
                                'Connect',
                                style: TextStyle(
                                  color: Color(0xFFFEFEFE),
                                  fontSize: 17.10.sp,
                                  fontFamily: 'Outfit',
                                  fontWeight: FontWeight.w600,
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
                ),
                SizedBox(
                  width: 5.w,
                ),
                InkWell(
                  onTap: () async {
                    log("Click on message");
                    final chatroom = await ref
                        .read(communityProvider.notifier)
                        .createChatRoom(user.uid);
                    if (chatroom.participants!.length == 2) {
                      context.pushRoute(ChatScreenRoute(
                          TargetUser: user, ChatRoom: chatroom));
                    } else
                      log("Error occured");
                  },
                  child: Container(
                    width: 94.w,
                    height: 34.h,
                    padding: EdgeInsets.symmetric(
                        horizontal: 9.50.w, vertical: 7.60.h),
                    decoration: ShapeDecoration(
                      color: Color(0xFFFEFEFE),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
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
                          'Message',
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
      );
    }

    return Container(
      // height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        child: Container(
          height: 103.h * users!.length,
          child: ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                return PeopleCard(users[index]);
              }),
        ),
      ),
    );
  }
}
