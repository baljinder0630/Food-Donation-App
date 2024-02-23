import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_donation_app/Models/Community/Chatting.model.dart';
import 'package:food_donation_app/Models/User.model.dart';
import 'package:food_donation_app/Pages/Community/Functions/nameProfile.dart';
import 'package:food_donation_app/Pages/Community/Widgets/myBackButton.dart';
import 'package:food_donation_app/Provider/communityProvider.dart';
import 'package:food_donation_app/Provider/userProvider.dart';

import '../constants/constants.dart';

@RoutePage()
class ChatScreen extends ConsumerStatefulWidget {
  final UserModel TargetUser;

  const ChatScreen({required this.TargetUser, super.key});

  @override
  ConsumerState<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends ConsumerState<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    String TargetUserImage = widget.TargetUser.photoURL.toString();
    String TargetUserName = widget.TargetUser.displayName.toString();
    TextEditingController msgcontroller = TextEditingController();
    var currentChatRoomUid = ref.watch(communityProvider).currentChatRoomUid;
    log("Current Chat Room Uid: " + currentChatRoomUid.toString());
    String currentUserUid = ref.watch(authStateProvider).user!.uid;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        leadingWidth: 100.w,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        leading: Container(
          // color: Colors.green,
          child: const Center(
            child: MyBackButton(),
          ),
        ),
        title: Container(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                backgroundColor: Colors.black,
                radius: 16.r,
                child: ClipOval(
                  child: Image.network(
                    TargetUserImage,
                    errorBuilder: (BuildContext context, Object exception,
                        StackTrace? stackTrace) {
                      return Center(
                        child: Text(
                          nameProfile(TargetUserName),
                          maxLines: 1,
                          overflow: TextOverflow.clip,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.sp,
                            fontFamily: 'Outfit',
                            fontWeight: FontWeight.w400,
                            height: 0,
                            letterSpacing: 0.96.sp,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              Text(
                TargetUserName,
                style: TextStyle(
                  color: const Color(0xFF201F24),
                  fontSize: 24.sp,
                  fontFamily: 'Outfit',
                  fontWeight: FontWeight.w400,
                  height: 0,
                  letterSpacing: 0.96.sp,
                ),
              )
            ],
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/chatBg.png"),
            // Make sure the image is in your assets folder
            fit: BoxFit
                .cover, // This will fill the background of the body with the image
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          resizeToAvoidBottomInset: true,
          body: Column(
            children: [
              Expanded(
                child: (ref.watch(communityProvider).currentChatRoomUid == "")
                    ? Center()
                    : StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection("ChatRoom")
                            .doc(currentChatRoomUid)
                            .collection("Messages")
                            .orderBy("sendOn", descending: true)
                            .snapshots(),
                        builder: (context, snapshot) {
                          //
                          //
                          if (snapshot.connectionState ==
                              ConnectionState.active) {
                            QuerySnapshot querySnapshot =
                                snapshot.data as QuerySnapshot;
                            // if (!snapshot.hasData) {
                            //   log("Loading Data");
                            //   return Text("data loading");
                            // }
                            if (snapshot.hasData) {
                              // log(snapshot.data!.docs.length.toString());
                              //
                              //
                              return ListView.builder(
                                reverse: true,
                                itemCount: querySnapshot.docs.length,
                                itemBuilder: (context, index) {
                                  // log("message1");
                                  Chattingmodel chattingModel =
                                      Chattingmodel.fromMap(
                                          querySnapshot.docs[index].data()
                                              as Map<String, dynamic>);
                                  // log(chattingModel.toString());
                                  return Padding(
                                    padding: EdgeInsets.all(8.0.sp),
                                    child: Row(
                                      mainAxisAlignment:
                                          (chattingModel.sender ==
                                                  currentUserUid)
                                              ? MainAxisAlignment.end
                                              : MainAxisAlignment.start,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              (chattingModel.sender ==
                                                      currentUserUid)
                                                  ? CrossAxisAlignment.end
                                                  : CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 10.w),
                                                decoration: BoxDecoration(
                                                  color:
                                                      (chattingModel.sender ==
                                                              currentUserUid)
                                                          ? bgColor
                                                          : green,
                                                  borderRadius: (chattingModel.sender ==
                                                          currentUserUid)
                                                      ? BorderRadius.only(
                                                          topLeft:
                                                              BorderRadius.circular(20.r)
                                                                  .topLeft,
                                                          bottomLeft:
                                                              BorderRadius.circular(20.r)
                                                                  .bottomLeft,
                                                          bottomRight:
                                                              BorderRadius.circular(20.r)
                                                                  .bottomRight)
                                                      : BorderRadius.only(
                                                          topRight:
                                                              BorderRadius.circular(20.r)
                                                                  .topRight,
                                                          bottomLeft:
                                                              BorderRadius.circular(20.r)
                                                                  .bottomLeft,
                                                          bottomRight:
                                                              BorderRadius.circular(20.r)
                                                                  .bottomRight),
                                                  boxShadow: const [
                                                    BoxShadow(
                                                      color: Color(0x3F000000),
                                                      blurRadius: 10,
                                                      offset: Offset(0, 0),
                                                      spreadRadius: 0,
                                                    )
                                                  ],
                                                ),
                                                child: TextButton(
                                                  onPressed: () {},
                                                  child: Text(
                                                      chattingModel.lastmessage
                                                          .toString(),
                                                      style: TextStyle(
                                                        fontSize: 17.sp,
                                                        color: (chattingModel
                                                                    .sender ==
                                                                currentUserUid)
                                                            ? black
                                                            : white,
                                                      )),
                                                )),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  right: 6.w, top: 2.r),
                                              child: Text(
                                                DateTime.parse(chattingModel
                                                        .sendtime
                                                        .toString())
                                                    .toLocal()
                                                    .toString()
                                                    .substring(11, 16),
                                                style: TextStyle(
                                                    fontSize: 13.sp,
                                                    color:
                                                        black.withOpacity(0.7)),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            } else if (snapshot.hasError) {
                              return const Center(
                                child: Text(
                                    "An error occured! Please check your internet connection."),
                              );
                            } else {
                              return Container();
                            }
                          } else {
                            return Container();
                          }
                        } else {
                          return Container();
                        }
                      },
                    ),
            ),
            Container(
              decoration: BoxDecoration(
                color: white,
              ),
              padding: EdgeInsets.only(top: 10.r),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.r),
                  height: 80.h,
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 8.h),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: msgcontroller,
                              maxLines: null,
                              keyboardType: TextInputType.multiline,
                              decoration: InputDecoration(
                                hintText: "Type a message",
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.r),
                                  borderSide: BorderSide(color: green),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.r),
                                  borderSide: BorderSide(color: green),
                                ),
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              if (msgcontroller.text.trim().isNotEmpty) {
                                ref
                                    .watch(communityProvider.notifier)
                                    .SendMessage(
                                      msgcontroller.text.trim(),
                                      widget.TargetUser.uid,
                                      currentUserUid,
                                    );
                                msgcontroller.clear();
                              }
                            },
                            icon: Icon(
                              Icons.send,
                              color: green,
                              size: 30,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
