import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_donation_app/Models/Community/connections.dart';
import 'package:food_donation_app/Provider/userProvider.dart';
import 'package:pinput/pinput.dart';

@RoutePage()
class IncomingRequest extends ConsumerStatefulWidget {
  const IncomingRequest({super.key});

  @override
  ConsumerState<IncomingRequest> createState() => _IncomingRequestState();
}

class _IncomingRequestState extends ConsumerState<IncomingRequest> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("users")
            .doc(ref.watch(authStateProvider).user!.uid)
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
                        return ListTile(
                          leading: SizedBox(
                            height: 50.r,
                            width: 50.r,
                            child: ClipOval(
                              child: Image.network(
                                data['photoURL'],
                                errorBuilder: (context, error, stackTrace) =>
                                    Icon(
                                  Icons.account_circle_rounded,
                                  size: 50.r,
                                ),
                              ),
                            ),
                          ),
                          title: Text(data['displayName']),
                          subtitle: const Text('Connection Request'),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              TextButton(
                                child: const Text('Accept'),
                                onPressed: () async {
                                  try {
                                    await FirebaseFirestore.instance
                                        .collection("users")
                                        .doc(ref
                                            .watch(authStateProvider)
                                            .user!
                                            .uid)
                                        .collection("connections")
                                        .doc(userId)
                                        .set(Connections(
                                                userId: userId,
                                                status:
                                                    ConnectionStatus.accepted)
                                            .toMap());
                                    await FirebaseFirestore.instance
                                        .collection("users")
                                        .doc(userId)
                                        .collection("connections")
                                        .doc(ref
                                            .watch(authStateProvider)
                                            .user!
                                            .uid)
                                        .set(Connections(
                                                userId: ref
                                                    .watch(authStateProvider)
                                                    .user!
                                                    .uid,
                                                status:
                                                    ConnectionStatus.accepted)
                                            .toMap());

                                    await FirebaseFirestore.instance
                                        .collection("users")
                                        .doc(ref
                                            .watch(authStateProvider)
                                            .user!
                                            .uid)
                                        .collection("incomingRequests")
                                        .doc(userId)
                                        .delete();

                                    await FirebaseFirestore.instance
                                        .collection("users")
                                        .doc(userId)
                                        .collection("outgoingRequests")
                                        .doc(ref
                                            .watch(authStateProvider)
                                            .user!
                                            .uid)
                                        .delete();
                                    log("Connect accepted successfully");
                                  } catch (e) {
                                    log(e.toString());
                                  }
                                },
                              ),
                              TextButton(
                                child: const Text('Ignore'),
                                onPressed: () {},
                              ),
                            ],
                          ),
                        );
                      }

                      return const Text("Loading");
                    },
                  );
                },
              );
            } else {
              return const Text(
                'No incoming requests',
                style: TextStyle(fontFamily: "Poppins"),
              );
            }
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }

  getUserData(userId) {
    return FirebaseFirestore.instance.collection("users").doc(userId).get();
  }
}
