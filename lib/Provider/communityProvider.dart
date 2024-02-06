import 'dart:developer';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_donation_app/Models/Community/ChatRoom.model.dart';
import 'package:food_donation_app/Models/Community/Chatting.model.dart';
import 'package:food_donation_app/Models/Community/Post.model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_donation_app/Models/User.model.dart';
import 'package:food_donation_app/Provider/userProvider.dart';
import 'package:uuid/uuid.dart';

final communityProvider = StateNotifierProvider<Community, CommunityState>(
  (ref) => Community(ref: ref),
);

class Community extends StateNotifier<CommunityState> {
  final StateNotifierProviderRef ref;
  final FirebaseFirestore firestore;

  Community({required this.ref})
      : firestore = FirebaseFirestore.instance,
        super(CommunityState(
            posts: [],
            recentPosts: [],
            myPosts: [],
            bookMarkedPosts: [],
            featuredPosts: [],
            users: [],
            chattingUsers: [],
            userChatRoom: [],
            currentChatRoomUid: "",
            userSearchSuggestion: [],
            rcmdPostStatus: PostStatus.initial,
            featuredPostStatus: PostStatus.initial,
            recentPostStatus: PostStatus.initial,
            articleSearchSuggestions: [],
            uploadArticleStatus: UploadArticleStatus.initial,
            nextRcmdPostLoading: PostStatus.initial,
            nextRecentPostLoading: PostStatus.initial,
            suggestionLoading: PostStatus.initial,
            lastRcmdDocument: null,
            lastRecentDocument: null)) {
    loadUserChatRoom();
  }

  loadUserChatRoom() async {
    try {
      final querySnapshot = await firestore
          .collection("chatRoomModel")
          .where("participants.${ref.watch(authStateProvider).user!.uid}",
              isEqualTo: true)
          .get();

      final chatRoomModel = querySnapshot.docs.map((doc) {
        return Chatroommodel.fromMap(doc.data() as Map<String, dynamic>);
      }).toList();

      state = state.copyWith(userChatRoom: chatRoomModel);
    } catch (e) {
      print(e);
    }
  }

  Future<bool> uploadPost(PostModel post, File? file) async {
    try {
      state =
          state.copyWith(uploadArticleStatus: UploadArticleStatus.processing);

      if (file != null) {
        final url = await uploadImage(file);
        if (url.isEmpty) {
          state =
              state.copyWith(uploadArticleStatus: UploadArticleStatus.error);
          return false;
        }
        post.imgUrl = url;
      } else {
        state = state.copyWith(uploadArticleStatus: UploadArticleStatus.error);
        return false;
      }

      final id = Uuid().v4();
      final doc = firestore.collection("articles").doc(id);
      await doc.set(post.toMap());
      state = state.copyWith(
        uploadArticleStatus: UploadArticleStatus.processed,
        recentPosts: [post, ...state.recentPosts!],
        myPosts: [post, ...state.myPosts!],
      );
      return true;
    } catch (e) {
      state = state.copyWith(uploadArticleStatus: UploadArticleStatus.error);
      log(e.toString());
      return false;
    }
  }

  Future<String> uploadImage(File? file) async {
    try {
      final ref =
          FirebaseStorage.instance.ref().child("articles/${Uuid().v4()}");
      final uploadTask = ref.putFile(File(file!.path));
      final snapshot = await uploadTask.whenComplete(() => null);
      final url = await snapshot.ref.getDownloadURL();
      return url;
    } catch (e) {
      log(e.toString());
      return "";
    }
  }

  Future<bool> deletePost(postId) async {
    try {
      await firestore
          .collection("articles")
          .where("id", isEqualTo: postId)
          .get()
          .then((value) {
        value.docs.forEach((element) {
          element.reference.delete();
        });
      });
      await firestore
          .collection("bookmarks")
          .doc(ref.watch(authStateProvider).user!.uid)
          .get()
          .then((value) {
        if (value.data() != null) {
          value.data()!['bookmarked'].remove(postId);
          value.reference.update({"bookmarked": value.data()!['bookmarked']});
        }
      });
      state = state.copyWith(
        posts: state.posts!.where((element) => element.id != postId).toList(),
        bookMarkedPosts: state.bookMarkedPosts!
            .where((element) => element.id != postId)
            .toList(),
        myPosts:
            state.myPosts!.where((element) => element.id != postId).toList(),
      );
      return true;
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  Future<bool> removeBookMark(postId) async {
    try {
      await firestore
          .collection('bookmarks')
          .doc(ref.watch(authStateProvider).user!.uid)
          .update({
        'bookmarked': FieldValue.arrayRemove([postId])
      });
      state = state.copyWith(
        bookMarkedPosts: state.bookMarkedPosts!
            .where((element) => element.id != postId)
            .toList(),
      );
      return true;
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  Future<void> getRcmdPosts() async {
    try {
      log("Getting Recommended articles");
      state = state.copyWith(
          rcmdPostStatus: PostStatus.processing,
          lastRcmdDocument: null,
          nextRcmdPostLoading: PostStatus.initial,
          posts: []);

      final snapshot = await firestore.collection("articles").limit(5).get();
      final posts = snapshot.docs.map((e) {
        // convert timestamp to DateTime

        e.data()["createdTime"] =
            (e.data()["createdTime"] as Timestamp).toDate().toIso8601String();
        // log(e.data().toString());
        return PostModel.fromMap(e.data());
      }).toList();

      if (posts.isEmpty) {
        state = state.copyWith(
            rcmdPostStatus: PostStatus.exhausted,
            nextRcmdPostLoading: PostStatus.exhausted);
        return;
      }

      state = state.copyWith(
        lastRcmdDocument: snapshot.docs.last,
        posts: posts, // recommended posts
        rcmdPostStatus: PostStatus.processed,
      );
    } catch (e) {
      state = state.copyWith(rcmdPostStatus: PostStatus.error);
      log(e.toString());
    }
  }

  Future<void> getFeaturedPosts() async {
    try {
      log("Getting articles");
      state = state.copyWith(
          featuredPostStatus: PostStatus.processing, featuredPosts: []);

      final snapshot = await firestore
          .collection("articles")
          .orderBy("counter", descending: true)
          .limit(5)
          .get();
      final posts = snapshot.docs.map((e) {
        // convert timestamp to DateTime

        e.data()["createdTime"] =
            (e.data()["createdTime"] as Timestamp).toDate().toIso8601String();
        // log(e.data().toString());
        return PostModel.fromMap(e.data());
      }).toList();

      if (posts.isEmpty) {
        state = state.copyWith(featuredPostStatus: PostStatus.exhausted);
        return;
      }
      state = state.copyWith(
          featuredPosts: posts, featuredPostStatus: PostStatus.processed);
    } catch (e) {
      state = state.copyWith(featuredPostStatus: PostStatus.error);
      log(e.toString());
    }
  }

  increaseCounter(postId) {
    try {
      firestore
          .collection("articles")
          .where("id", isEqualTo: postId)
          .get()
          .then((value) {
        value.docs.forEach((element) {
          element.reference.update({"counter": FieldValue.increment(1)});
          print("Counter incremented");
        });
      });
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> getNextPosts() async {
    try {
      log("Getting next articles");
      if (state.posts!.isEmpty ||
          state.lastRcmdDocument == null ||
          state.nextRcmdPostLoading == PostStatus.exhausted) return;

      log("Getting articles");
      state = state.copyWith(nextRcmdPostLoading: PostStatus.processing);

      final snapshot = await firestore
          .collection("articles")
          .startAfterDocument(state.lastRcmdDocument!)
          .limit(5)
          .get();

      if (snapshot.docs.isEmpty) {
        state = state.copyWith(nextRcmdPostLoading: PostStatus.exhausted);
        return;
      }
      final posts = snapshot.docs.map((e) {
        // convert timestamp to DateTime

        e.data()["createdTime"] =
            (e.data()["createdTime"] as Timestamp).toDate().toIso8601String();
        // log(e.data().toString());
        return PostModel.fromMap(e.data());
      }).toList();

      state = state.copyWith(
          posts: [...state.posts!, ...posts],
          nextRcmdPostLoading: PostStatus.processed,
          lastRcmdDocument: snapshot.docs.last);
    } catch (e) {
      state = state.copyWith(nextRcmdPostLoading: PostStatus.error);
      log(e.toString());
    }
  }

  Future<void> getRecentPosts() async {
    try {
      log("Getting recent articles");
      state = state.copyWith(
        recentPostStatus: PostStatus.processing,
        lastRecentDocument: null,
        nextRecentPostLoading: PostStatus.initial,
        recentPosts: [],
      );

      final snapshot = await firestore
          .collection("articles")
          .orderBy("createdTime", descending: true)
          .limit(5)
          .get();
      final posts = snapshot.docs.map((e) {
        // convert timestamp to DateTime

        e.data()["createdTime"] =
            (e.data()["createdTime"] as Timestamp).toDate().toIso8601String();
        // log(e.data().toString());
        return PostModel.fromMap(e.data());
      }).toList();

      if (posts.isEmpty) {
        state = state.copyWith(recentPostStatus: PostStatus.exhausted);
        return;
      }

      state = state.copyWith(
          recentPosts: posts,
          recentPostStatus: PostStatus.processed,
          lastRecentDocument: snapshot.docs.last);
    } catch (e) {
      state = state.copyWith(recentPostStatus: PostStatus.error);
      log(e.toString());
    }
  }

  Future<void> getNextRecentPosts() async {
    try {
      log("Getting next recent articles");
      if (state.recentPosts!.isEmpty ||
          state.lastRecentDocument == null ||
          state.nextRecentPostLoading == PostStatus.exhausted) return;

      log("Getting articles");
      // state = state.copyWith(scrollStatus: ScrollStatus.processing);
      state = state.copyWith(nextRecentPostLoading: PostStatus.processing);

      final snapshot = await firestore
          .collection("articles")
          .orderBy("createdTime", descending: true)
          .startAfterDocument(state.lastRecentDocument!)
          .limit(5)
          .get();
      final posts = snapshot.docs.map((e) {
        // convert timestamp to DateTime

        e.data()["createdTime"] =
            (e.data()["createdTime"] as Timestamp).toDate().toIso8601String();
        // log(e.data().toString());
        return PostModel.fromMap(e.data());
      }).toList();

      if (posts.isEmpty) {
        state = state.copyWith(nextRecentPostLoading: PostStatus.exhausted);
        return;
      }

      state = state.copyWith(
          recentPosts: [...state.recentPosts!, ...posts],
          nextRecentPostLoading: PostStatus.processed,
          lastRecentDocument: snapshot.docs.last);
    } catch (e) {
      state = state.copyWith(
          recentPostStatus: PostStatus.error,
          nextRecentPostLoading: PostStatus.error);
      log(e.toString());
    }
  }

  Future<void> getMyPosts() async {
    try {
      final snapshot = await firestore
          .collection("articles")
          .where("userId", isEqualTo: ref.watch(authStateProvider).user!.uid)
          .get();
      final posts = snapshot.docs.map((e) {
        // convert timestamp to DateTime
        e.data()["createdTime"] =
            (e.data()["createdTime"] as Timestamp).toDate().toIso8601String();
        // log(e.data().toString());
        return PostModel.fromMap(e.data());
      }).toList();
      state = state.copyWith(myPosts: posts);
    } catch (e) {
      log(e.toString());
    }
  }

  getBookmarkedPosts(context) async {
    try {
      log(ref.watch(authStateProvider).user!.uid);

      final bookmarks = await firestore
          .collection('bookmarks')
          .doc(ref.watch(authStateProvider).user!.uid)
          .get()
          .then((value) {
        if (value.data() == null) return [];
        return value.data()!['bookmarked'];
      });

      if (bookmarks == null || bookmarks.isEmpty) {
        return [];
      }
      log(bookmarks.toString());
      final snapshot = await firestore
          .collection("articles")
          .where("id", whereIn: bookmarks)
          .get();

      if (snapshot.docs.isEmpty) {
        return [];
      }

      final posts = snapshot.docs.map((e) {
        // convert timestamp to DateTime
        e.data()["createdTime"] =
            (e.data()["createdTime"] as Timestamp).toDate().toIso8601String();
        // log(e.data().toString());
        return PostModel.fromMap(e.data());
      }).toList();
      // log(posts.toString());
      state = state.copyWith(bookMarkedPosts: posts);
      log(state.bookMarkedPosts.toString());
    } catch (e) {
      showSnackBar("Failed to add in Bookmark", context, Colors.red);
      log(e.toString());
    }
  }

  getPeoples(int from) async {
    try {
      final snapshot = await firestore
          .collection("users")
          .where("uid", isNotEqualTo: ref.watch(authStateProvider).user!.uid)
          .get();
      final people = snapshot.docs.map((value) {
        return UserModel.fromMap(value.data());
      }).toList();
      log("Peoples loaded" + people.length.toString());
      state = state.copyWith(users: people);
    } catch (e) {
      print(e);
    }
  }

  getChatRoom(targetUid) {
    try {
      // check if chatroom already exist in userChatRoom list
      var chatRoomUid = state.userChatRoom!
          .firstWhere((element) => element.participants!.containsKey(targetUid))
          .chatroomuid;
      log("Chatroom found " + chatRoomUid.toString());
      state = state.copyWith(
          currentChatRoomUid: state.userChatRoom!
              .firstWhere(
                  (element) => element.participants!.containsKey(targetUid))
              .chatroomuid!);
    } catch (e) {
      state = state.copyWith(currentChatRoomUid: "");
      print(e);
      return null;
    }
  }

  loadChatRooms() async {
    try {
      final querySnapshot = await firestore
          .collection("chatRoomModel")
          .where("participants.${ref.watch(authStateProvider).user!.uid}",
              isEqualTo: true)
          .get();

      final chatingUsersUid = querySnapshot.docs.map((doc) {
        Chatroommodel chatroommodel =
            Chatroommodel.fromMap(doc.data() as Map<String, dynamic>);
        Map<String, dynamic>? participants = chatroommodel.participants;
        List<String> participantsKey = participants!.keys.toList();
        participantsKey.remove(ref.watch(authStateProvider).user!.uid);

        return participantsKey.first;
      });

      final chatingUsers = await firestore
          .collection("users")
          .where("uid", whereIn: chatingUsersUid)
          .get();

      final users = chatingUsers.docs.map((doc) {
        return UserModel.fromMap(doc.data());
      }).toList();

      state = state.copyWith(chattingUsers: users);
    } catch (e) {
      print(e);
    }
  }

  SendMessage(String msg, to, from) async {
    log("Sending msg " + msg + " to " + to + " from " + from);

    try {
      if (msg != null) {
        String chatRoomUid = state.currentChatRoomUid;
        if (chatRoomUid == null || chatRoomUid.isEmpty) {
          // creating new chatroom
          chatRoomUid = Uuid().v4();
          state = state.copyWith(currentChatRoomUid: chatRoomUid);

          Chatroommodel chatRoomModel = Chatroommodel(participants: {
            ref.watch(authStateProvider).user!.uid: true,
            to: true
          }, chatroomuid: chatRoomUid, lastmessage: msg);
          await firestore
              .collection("chatRoomModel")
              .doc(chatRoomUid)
              .set(chatRoomModel.toMap());
          log("chatroom created");
          state = state.copyWith(
            userChatRoom: [
              ...state.userChatRoom!,
              chatRoomModel
            ], // adding chatroom to userChatRoom list if not exist
            chattingUsers: [
              ...state.chattingUsers!,
              state.users!.firstWhere((element) => element.uid == to)
            ],
          ); // adding user to chattingUsers list if not exist
        }
        Chattingmodel chattingModel = await Chattingmodel(
            seen: false,
            sendOn: DateTime.now().toLocal().microsecondsSinceEpoch.toString(),
            sendtime: DateTime.now().toLocal().toString(),
            messageId:
                DateTime.now().toLocal().microsecondsSinceEpoch.toString(),
            lastmessage: msg,
            sender: ref.watch(authStateProvider).user!.uid.toString());

        await firestore
            .collection("ChatRoom")
            .doc(chatRoomUid)
            .collection("Messages")
            .doc(chattingModel.messageId)
            .set(chattingModel.toMap())
            .then((value) =>
                firestore.collection("chatRoomModel").doc(chatRoomUid).set({
                  "lastmessage": msg,
                  "participants": {"$from": true, "$to": true}
                }, SetOptions(merge: true)))
            .whenComplete(() {
          if (state.userChatRoom!
              .any((element) => element.chatroomuid == chatRoomUid)) {
            state.userChatRoom!
                .firstWhere((element) => element.chatroomuid == chatRoomUid)
                .lastmessage = msg;
          } else {
            state.userChatRoom!.add(Chatroommodel(
                participants: {"$from": true, "$to": true},
                chatroomuid: chatRoomUid,
                lastmessage: msg));
          }
        }).onError((error, stackTrace) => log(error.toString()));
      }
    } catch (e) {
      print(e);
    }
  }

  updatePost(PostModel post, context) async {
    try {
      state = state.copyWith(
        uploadArticleStatus: UploadArticleStatus.processing,
        posts: state.posts!.map((e) => e.id == post.id ? post : e).toList(),
        bookMarkedPosts: state.bookMarkedPosts!
            .map((e) => e.id == post.id ? post : e)
            .toList(),
        myPosts: state.myPosts!.map((e) => e.id == post.id ? post : e).toList(),
      );
      await firestore
          .collection("articles")
          .where("id", isEqualTo: post.id)
          .get()
          .then((querySnapshot) {
        querySnapshot.docs.forEach((doc) {
          doc.reference.update(post.toMap());
        });
      });
      state =
          state.copyWith(uploadArticleStatus: UploadArticleStatus.processed);
      return true;
    } catch (e) {
      state = state.copyWith(uploadArticleStatus: UploadArticleStatus.error);
      log(e.toString());
      return false;
    }
  }

  addToBookMark(uid, id, context) async {
    try {
      await firestore.collection('bookmarks').doc(uid).set({
        'uid': uid,
        'bookmarked': FieldValue.arrayUnion([id])
      }, SetOptions(merge: true)).then(
          (value) => showSnackBar("Added to Bookmark", context, Colors.green));
    } catch (e) {
      showSnackBar("Failed to add in Bookmark", context, Colors.red);
      log(e.toString());
    }
  }

  articleSearchSuggestion(String val) async {
    log("Fetching suggestion for $val");
    if (val.length >= 1) {
      try {
        state = state.copyWith(suggestionLoading: PostStatus.processing);

        await firestore
            .collection('articles')
            .where('subject', isGreaterThanOrEqualTo: val)
            .where('subject', isLessThan: val + 'z')
            .limit(5)
            .get()
            .then((snapshot) {
          log("Suggestion picked");
          state = state.copyWith(
              suggestionLoading: PostStatus.processed,
              articleSearchSuggestions: snapshot.docs
                  .map((e) => PostModel.fromMap(e.data()))
                  .toList());
        });
      } catch (e) {
        state = state.copyWith(suggestionLoading: PostStatus.error);

        print(e);
      }
    }
  }

  userSearhSuggestion(email) {
    try {
      state = state.copyWith(suggestionLoading: PostStatus.processing);
      firestore
          .collection('users')
          .where('email', isGreaterThanOrEqualTo: email)
          .where('email', isLessThan: email + 'z')
          .limit(5)
          .get()
          .then((snapshot) {
        state = state.copyWith(
            suggestionLoading: PostStatus.processed,
            userSearchSuggestion:
                snapshot.docs.map((e) => UserModel.fromMap(e.data())).toList());
      });
    } catch (e) {
      state = state.copyWith(suggestionLoading: PostStatus.error);
      print(e);
    }
  }

  showSnackBar(message, context, color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color,
      ),
    );
  }
}

class CommunityState {
  List<PostModel>? posts;
  List<PostModel>? recentPosts;
  List<PostModel>? myPosts;
  List<PostModel>? bookMarkedPosts;
  List<PostModel>? featuredPosts;
  List<UserModel>? users;
  List<UserModel>? userSearchSuggestion;
  List<UserModel>? chattingUsers;
  List<PostModel>? articleSearchSuggestions;
  List<Chatroommodel>? allUsersChatRoom;
  List<Chatroommodel>? userChatRoom;
  String currentChatRoomUid;
  PostStatus? rcmdPostStatus;
  PostStatus? recentPostStatus;
  PostStatus? featuredPostStatus;
  PostStatus? nextRcmdPostLoading;
  PostStatus? nextRecentPostLoading;
  PostStatus? suggestionLoading;
  DocumentSnapshot? lastRcmdDocument;
  DocumentSnapshot? lastRecentDocument;
  UploadArticleStatus? uploadArticleStatus;

  CommunityState(
      {this.posts,
      this.recentPosts,
      this.myPosts,
      this.bookMarkedPosts,
      this.featuredPosts,
      this.userChatRoom,
      this.users,
      this.userSearchSuggestion,
      this.chattingUsers,
      this.allUsersChatRoom,
      this.suggestionLoading,
      this.currentChatRoomUid = "",
      this.articleSearchSuggestions,
      this.rcmdPostStatus,
      this.recentPostStatus,
      this.nextRcmdPostLoading,
      this.nextRecentPostLoading,
      this.featuredPostStatus,
      this.uploadArticleStatus,
      this.lastRecentDocument,
      this.lastRcmdDocument});

  CommunityState copyWith({
    List<PostModel>? posts,
    List<PostModel>? myPosts,
    List<PostModel>? recentPosts,
    List<PostModel>? bookMarkedPosts,
    List<PostModel>? featuredPosts,
    List<PostModel>? articleSearchSuggestions,
    List<UserModel>? users,
    List<UserModel>? userSearchSuggestion,
    List<UserModel>? chattingUsers,
    List<Chatroommodel>? userChatRoom,
    String? currentChatRoomUid,
    PostStatus? featuredPostStatus,
    PostStatus? recentPostStatus,
    PostStatus? rcmdPostStatus,
    PostStatus? nextRcmdPostLoading,
    PostStatus? nextRecentPostLoading,
    PostStatus? suggestionLoading,
    UploadArticleStatus? uploadArticleStatus,
    DocumentSnapshot? lastRcmdDocument,
    DocumentSnapshot? lastRecentDocument,
  }) {
    return CommunityState(
      posts: posts ?? this.posts,
      myPosts: myPosts ?? this.myPosts,
      bookMarkedPosts: bookMarkedPosts ?? this.bookMarkedPosts,
      featuredPosts: featuredPosts ?? this.featuredPosts,
      users: users ?? this.users,
      userSearchSuggestion: userSearchSuggestion ?? this.userSearchSuggestion,
      chattingUsers: chattingUsers ?? this.chattingUsers,
      recentPosts: recentPosts ?? this.recentPosts,
      userChatRoom: userChatRoom ?? this.userChatRoom,
      currentChatRoomUid: currentChatRoomUid ?? this.currentChatRoomUid,
      articleSearchSuggestions: articleSearchSuggestions ?? [],
      rcmdPostStatus: rcmdPostStatus ?? this.rcmdPostStatus,
      featuredPostStatus: featuredPostStatus ?? this.featuredPostStatus,
      recentPostStatus: recentPostStatus ?? this.recentPostStatus,
      uploadArticleStatus: uploadArticleStatus ?? this.uploadArticleStatus,
      lastRcmdDocument: lastRcmdDocument ?? this.lastRcmdDocument,
      lastRecentDocument: lastRecentDocument ?? this.lastRecentDocument,
      nextRcmdPostLoading: nextRcmdPostLoading ?? this.nextRcmdPostLoading,
      suggestionLoading: suggestionLoading ?? this.suggestionLoading,
      nextRecentPostLoading:
          nextRecentPostLoading ?? this.nextRecentPostLoading,
    );
  }
}

enum PostStatus { initial, processing, processed, error, exhausted }

enum UploadArticleStatus { initial, processing, processed, error }
