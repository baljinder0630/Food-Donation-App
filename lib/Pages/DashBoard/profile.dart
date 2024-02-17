import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_donation_app/Pages/Community/Functions/nameProfile.dart';
import 'package:food_donation_app/Provider/userProvider.dart';

class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({super.key});

  @override
  ConsumerState<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  final _random = Random();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      ProfilePic(ref: ref, random: _random),
      Transform.translate(
        offset: Offset(0, -50.h),
        child: Container(
          width: 428.w,
          height: 397.h,
          decoration: BoxDecoration(
              color: Colors.purple[50],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.r),
                topRight: Radius.circular(30.r),
              )),
          child: Column(
            children: [
              Transform.translate(
                offset: Offset(0, -70.h),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: 186.h,
                      width: 428.w,
                      child: Column(
                        children: [
                          Container(
                            height: 66.h,
                            width: 428.w,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              // borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey
                                      .withOpacity(0.3), // darker shadow
                                  spreadRadius: 5,
                                  blurRadius: 17,
                                  offset: Offset(0, -3), // upper side shadow
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 46.h,
                            width: 428.w,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              // borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey
                                      .withOpacity(0.2), // lighter shadow
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(0, 3), // lower side shadow
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 136.h,
                      width: 366.w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 190.w,
                                child: Text(
                                  ref
                                      .watch(authStateProvider)
                                      .user!
                                      .displayName,
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontFamily: 'Outfit',
                                    letterSpacing: 2.0,
                                  ),
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                              Container(
                                width: 190.w,
                                child: Text(
                                  "2024 Connections",
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontFamily: 'Outfit',
                                    letterSpacing: 2.0,
                                  ),
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                              Container(
                                // width: 190.w,
                                child: Text(
                                  ref.watch(authStateProvider).user!.email,
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontFamily: 'Outfit',
                                    // letterSpacing: 2.0,
                                  ),
                                  textAlign: TextAlign.justify,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                ref.watch(authStateProvider).user!.displayName,
                style: TextStyle(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontFamily: 'Roboto',
                  letterSpacing: 2.0,
                ),
              ),
              Text(
                ref.watch(authStateProvider).user!.email,
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontFamily: 'Roboto',
                  letterSpacing: 2.0,
                ),
              ),
            ],
          ),
        ),
      )
    ]));
  }
}

class ProfilePic extends StatelessWidget {
  const ProfilePic({
    super.key,
    required this.ref,
    required Random random,
  }) : _random = random;

  final WidgetRef ref;
  final Random _random;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 428.w,
        height: 397.h,
        // color: Colors.red,
        child: Image.network(
          ref.watch(authStateProvider).user!.photoURL,
          fit: BoxFit.cover,
          errorBuilder:
              (BuildContext context, Object exception, StackTrace? stackTrace) {
            return Center(
              child: ShaderMask(
                shaderCallback: (Rect bounds) {
                  return RadialGradient(
                    center: Alignment.topLeft,
                    radius: 1.0,
                    colors: <Color>[
                      Color.fromARGB(
                        255,
                        _random.nextInt(256), // Red
                        _random.nextInt(256), // Green
                        _random.nextInt(256), // Blue
                      ),
                      Color.fromARGB(
                        255,
                        _random.nextInt(256), // Red
                        _random.nextInt(256), // Green
                        _random.nextInt(256), // Blue
                      ),
                      Color.fromARGB(
                        255,
                        _random.nextInt(256), // Red
                        _random.nextInt(256), // Green
                        _random.nextInt(256), // Blue
                      ),
                    ],
                    tileMode: TileMode.mirror,
                  ).createShader(bounds);
                },
                child: Text(
                  nameProfile(ref.watch(authStateProvider).user!.displayName),
                  style: TextStyle(
                    fontSize: 100.sp,
                    fontWeight: FontWeight.bold,
                    shadows: const [
                      Shadow(
                        blurRadius: 5.0,
                        color: Colors.black,
                        offset: Offset(5.0, 5.0),
                      ),
                    ],
                    color: Colors.white,
                    fontFamily: 'Roboto',
                    letterSpacing: 2.0,
                  ),
                ),
              ),
            );
          },
        ));
  }
}
