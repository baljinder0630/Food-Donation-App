import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_donation_app/Models/Community/connections.dart';
import 'package:food_donation_app/Models/User.model.dart';
import 'package:food_donation_app/Pages/Community/Widgets/userCard.dart';
import 'package:food_donation_app/Provider/communityProvider.dart';
import 'package:shimmer/shimmer.dart';

class ConnectedUserPage extends ConsumerStatefulWidget {
  const ConnectedUserPage({super.key});

  @override
  ConsumerState<ConnectedUserPage> createState() => _ConnectedUserPageState();
}

class _ConnectedUserPageState extends ConsumerState<ConnectedUserPage> {
  @override
  Widget build(BuildContext context) {
    // final users = ref.watch(communityProvider).users;

    return Container(
      // height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: StreamBuilder(
            stream:
                ref.watch(communityProvider.notifier).getConnectedPeoples(0),
            builder: (context, snapshot) {
              QuerySnapshot? data = snapshot.data as QuerySnapshot?;
              if (snapshot.connectionState == ConnectionState.active) {
                if (snapshot.hasError) {
                  return Text("Something went wrong");
                }
                if (snapshot.hasData && data!.docs.isNotEmpty) {
                  final connections = data.docs
                      .map((e) => e.data() as Map<String, dynamic>)
                      .toList();

                  return Container(
                    height: 103.h * connections.length,
                    child: ListView.builder(
                        itemCount: connections.length,
                        itemBuilder: (context, index) {
                          return FutureBuilder(
                            future: FirebaseFirestore.instance
                                .collection('users')
                                .doc(connections[index]['userId'])
                                .get(),
                            initialData: "InitialData",
                            builder:
                                (BuildContext context, AsyncSnapshot snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return UserCardShimmerEffect();
                              }
                              if (snapshot.hasError) {
                                return Text("Something went wrong");
                              }
                              if (snapshot.hasData &&
                                  snapshot.data.data() != null) {
                                final userModel = snapshot.data.data()
                                    as Map<String, dynamic>;

                                return UserCard(
                                    user: UserModel.fromMap(userModel));
                              }

                              return SizedBox();
                            },
                          );
                        }),
                  );
                }
              }
              return Text("data");
            },
          )),
    );
  }
}

class UserCardShimmerEffect extends StatelessWidget {
  const UserCardShimmerEffect({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
              // Adding Shimmer effect to the user card
              Shimmer(
                gradient: const LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [Colors.grey, Colors.white, Colors.grey]),
                child: Container(
                  width: 59.85.w,
                  height: 64.60.h,
                  decoration: ShapeDecoration(
                    color: Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(17),
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
                    width: 100.w,
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        color: Colors.grey[300],
                      ),
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Container(
                    height: 10.h,
                    width: 100.w,
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        color: Colors.grey[300],
                      ),
                    ),
                  ),
                ],
              ),
              Flexible(
                  child: Shimmer(
                gradient: LinearGradient(
                    colors: [Colors.grey, Colors.white, Colors.grey]),
                child: Container(
                  width: 86.70.w,
                  height: 34.40.h,
                  decoration: ShapeDecoration(
                    color: Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9.50.r),
                    ),
                  ),
                ),
              ))
            ]));
  }
}
