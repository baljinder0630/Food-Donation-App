import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_donation_app/Models/Community/connections.dart';
import 'package:food_donation_app/Pages/Community/Functions/toCamelCase.dart';
import 'package:food_donation_app/Provider/userProvider.dart';
import 'package:pinput/pinput.dart';
import 'package:shimmer/shimmer.dart';

import '../constants/constants.dart';

@RoutePage()
class IncomingRequest extends ConsumerStatefulWidget {
  const IncomingRequest({super.key});

  @override
  ConsumerState<IncomingRequest> createState() => _IncomingRequestState();
}

class _IncomingRequestState extends ConsumerState<IncomingRequest> {
  final firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: StreamBuilder(
        stream: firestore
            .collection("users")
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .collection("incomingRequests")
            .where("status", isEqualTo: "pending")
            // .where({"status": "pending"})
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasError) {
              return const Text("Something went wrong");
            }
            if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
              return ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (BuildContext context, int index) {
                  final userId =
                      snapshot.data!.docs[index]["userId"].toString();
                  return FutureBuilder<DocumentSnapshot>(
                    future: getUserData(userId),
                    builder: (BuildContext context,
                        AsyncSnapshot<DocumentSnapshot> snapshot) {
                      if (snapshot.hasError) {
                        return const Text("Something went wrong");
                      }

                      if (snapshot.hasData && !snapshot.data!.exists) {
                        return const Text("Document does not exist");
                      }

                      if (snapshot.connectionState == ConnectionState.done) {
                        Map<String, dynamic> data =
                            snapshot.data!.data() as Map<String, dynamic>;
                        return Container(
                          height: 80.h,
                          margin: EdgeInsets.all(10.r),
                          decoration: BoxDecoration(
                            color: white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.r)),
                          ),
                          child: Center(
                            child: ListTile(
                              leading: Container(
                                height: 50.r,
                                width: 50.r,
                                child: ClipOval(
                                  child: Image.network(
                                    data['photoURL'],
                                    errorBuilder:
                                        (context, error, stackTrace) => Icon(
                                      Icons.account_circle_rounded,
                                      size: 50.r,
                                    ),
                                  ),
                                ),
                              ),
                              title: Text(data['displayName'],
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.bold)),
                              subtitle: Text('Connection Request',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      fontFamily: "Poppins",
                                      color: Colors.grey)),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  TextButton(
                                    child: const Text('Accept'),
                                    onPressed: () async {
                                      try {
                                        await firestore
                                            .collection("users")
                                            .doc(ref
                                                .watch(authStateProvider)
                                                .user!
                                                .uid)
                                            .collection("connections")
                                            .doc(userId)
                                            .set(Connections(
                                                    userId: userId,
                                                    status: ConnectionStatus
                                                        .accepted)
                                                .toMap());
                                        await firestore
                                            .collection("users")
                                            .doc(userId)
                                            .collection("connections")
                                            .doc(ref
                                                .watch(authStateProvider)
                                                .user!
                                                .uid)
                                            .set(Connections(
                                                    userId: ref
                                                        .watch(
                                                            authStateProvider)
                                                        .user!
                                                        .uid,
                                                    status: ConnectionStatus
                                                        .accepted)
                                                .toMap());

                                        await firestore
                                            .collection("users")
                                            .doc(ref
                                                .watch(authStateProvider)
                                                .user!
                                                .uid)
                                            .collection("incomingRequests")
                                            .doc(userId)
                                            .delete();

                                        await firestore
                                            .collection("users")
                                            .doc(userId)
                                            .collection("outgoingRequests")
                                            .doc(ref
                                                .watch(authStateProvider)
                                                .user!
                                                .uid)
                                            .delete();
                                        await firestore
                                            .collection("users")
                                            .doc(ref
                                                .watch(authStateProvider)
                                                .user!
                                                .uid)
                                            .update({
                                          "totalConnects":
                                              FieldValue.increment(1)
                                        });
                                        await firestore
                                            .collection("users")
                                            .doc(userId)
                                            .update({
                                          "totalConnects":
                                              FieldValue.increment(1)
                                        });
                                        log("Connect accepted successfully");
                                      } catch (e) {
                                        log(e.toString());
                                      }
                                    },
                                  ),
                                  TextButton(
                                    child: const Text('Ignore'),
                                    onPressed: () {
                                      firestore
                                          .collection("users")
                                          .doc(ref
                                              .watch(authStateProvider)
                                              .user!
                                              .uid)
                                          .collection("incomingRequests")
                                          .doc(userId)
                                          .delete();
                                      firestore
                                          .collection("users")
                                          .doc(userId)
                                          .collection("outgoingRequests")
                                          .doc(ref
                                              .watch(authStateProvider)
                                              .user!
                                              .uid)
                                          .delete();
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }

                      // return const Text("Loading");
                      return Container(
                        height: 80.h,
                        margin: EdgeInsets.all(10.r),
                        decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.all(Radius.circular(20.r)),
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
                                  colors: [
                                    Colors.grey,
                                    Colors.white,
                                    Colors.grey
                                  ]),
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
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 5.w),
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
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 5.w),
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
                                    colors: [
                                      Colors.grey,
                                      Colors.white,
                                      Colors.grey
                                    ]),
                                child: Container(
                                  width: 86.70.w,
                                  height: 34.40.h,
                                  decoration: ShapeDecoration(
                                    color: Colors.grey[300],
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(9.50.r),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              );
            } else {
              return Container(
                height: 500.h,
                width: 400.w,
                child: const Center(
                  child: Text(
                    'No incoming requests',
                    style: TextStyle(fontFamily: "Poppins"),
                  ),
                ),
              );
            }
          } else {
            return CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF009900)),
            );
          }
        },
      ),
    );
  }

  getUserData(userId) {
    return firestore.collection("users").doc(userId).get();
  }
}
