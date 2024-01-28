import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_donation_app/Models/Community/ChatRoom.model.dart';
import 'package:food_donation_app/Models/Community/Chatting.model.dart';
import 'package:food_donation_app/Models/User.model.dart';
import 'package:food_donation_app/Provider/communityProvider.dart';
import 'package:food_donation_app/Provider/userProvider.dart';
import 'package:pinput/pinput.dart';

@RoutePage()
class ChatScreen extends ConsumerStatefulWidget {
  final UserModel TargetUser;
  final Chatroommodel ChatRoom;
  const ChatScreen(
      {required this.TargetUser, required this.ChatRoom, super.key});

  @override
  ConsumerState<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends ConsumerState<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    String TargetUserImage = widget.TargetUser.photoURL.toString();
    String TargetUserName = widget.TargetUser.displayName.toString();
    TextEditingController msgcontroller = TextEditingController();
    String currentUser = ref.watch(authStateProvider).user!.uid;

    return Scaffold(
      appBar: AppBar(
        leadingWidth: 88,
        leading: Row(
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.navigate_before_outlined)),
            TargetUserImage == null || TargetUserImage.isEmpty
                ? CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.black,
                  )
                : CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.black,
                    child: CircleAvatar(
                        radius: 19,
                        backgroundImage: NetworkImage(TargetUserImage))),
          ],
        ),
        title: Text(
          TargetUserName,
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("ChatRoom")
                  .doc(widget.ChatRoom.chatroomuid)
                  .collection("Messages")
                  .orderBy("sendOn", descending: true)
                  .snapshots(),
              builder: (context, snapshot) {
                //
                //
                if (snapshot.connectionState == ConnectionState.active) {
                  QuerySnapshot querySnapshot = snapshot.data as QuerySnapshot;
                  // if (!snapshot.hasData) {
                  //   log("Loading Data");
                  //   return Text("data loading");
                  // }
                  if (snapshot.hasData) {
                    log(snapshot.data!.docs.length.toString());
                    //
                    //
                    return ListView.builder(
                      reverse: true,
                      itemCount: querySnapshot.docs.length,
                      itemBuilder: (context, index) {
                        log("message1");
                        Chattingmodel chattingModel = Chattingmodel.fromMap(
                            querySnapshot.docs[index].data()
                                as Map<String, dynamic>);
                        log(chattingModel.toString());
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment:
                                (chattingModel.sender == currentUser)
                                    ? MainAxisAlignment.end
                                    : MainAxisAlignment.start,
                            children: [
                              Container(
                                  decoration: BoxDecoration(
                                      color: (chattingModel.sender == currentUser)
                                          ? Colors.blue
                                          : Colors.grey.shade700,
                                      borderRadius: (chattingModel.sender ==
                                              currentUser)
                                          ? BorderRadius.only(
                                              topLeft: BorderRadius.circular(20)
                                                  .topLeft,
                                              bottomLeft: BorderRadius.circular(20)
                                                  .bottomLeft,
                                              bottomRight:
                                                  BorderRadius.circular(20)
                                                      .bottomRight)
                                          : BorderRadius.only(
                                              topRight: BorderRadius.circular(20)
                                                  .topRight,
                                              bottomLeft: BorderRadius.circular(20)
                                                  .bottomLeft,
                                              bottomRight:
                                                  BorderRadius.circular(20)
                                                      .bottomRight)),
                                  child: Row(
                                    children: [
                                      TextButton(
                                        onPressed: () {},
                                        child: Text(
                                            chattingModel.lastmessage
                                                .toString(),
                                            style: TextStyle(
                                              color: Colors.white,
                                            )),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 16.0, right: 4),
                                        child: Text(
                                          chattingModel.sendtime.toString(),
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 181, 189, 194)),
                                        ),
                                      )
                                    ],
                                  )),
                            ],
                          ),
                        );
                      },
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text(
                          "An error occured! Please check your internet connection."),
                    );
                  } else {
                    return Container();
                  }
                } else {
                  return Container();
                }
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 80,
              child: Center(
                child: ListTile(
                  title: TextField(
                    controller: msgcontroller,
                    maxLines: null,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40))),
                  ),
                  trailing: IconButton(
                      onPressed: () {
                        if (msgcontroller.text.trim().isNotEmpty)
                          ref.watch(communityProvider.notifier).SendMessage(
                                msgcontroller.text.trim(),
                                widget.ChatRoom.chatroomuid,
                              );
                      },
                      icon: Icon(
                        Icons.send,
                        color: Colors.blue,
                        size: 30,
                      )),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
