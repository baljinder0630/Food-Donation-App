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
          users: [],
          chatrooms: [],
          scrollStatus: ScrollStatus.initial,
          rcmdPostStatus: PostStatus.initial,
          featuredPostStatus: PostStatus.initial,
          recentPostStatus: PostStatus.initial,
          articleSearchSuggestions: [],
          uploadArticleStatus: UploadArticleStatus.initial,
        ));

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
      final posts = [...state.posts!, post];
      state = state.copyWith(posts: posts);
      state =
          state.copyWith(uploadArticleStatus: UploadArticleStatus.processed);
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

  Future<void> getPosts(from) async {
    try {
      log("Getting articles");
      state = state.copyWith(scrollStatus: ScrollStatus.processing);
      state = state.copyWith(rcmdPostStatus: PostStatus.processing);
      state = state.copyWith(featuredPostStatus: PostStatus.processing);

      final snapshot = await firestore.collection("articles").limit(10).get();
      final posts = snapshot.docs.map((e) {
        // convert timestamp to DateTime

        e.data()["createdTime"] =
            (e.data()["createdTime"] as Timestamp).toDate().toIso8601String();
        // log(e.data().toString());
        return PostModel.fromMap(e.data());
      }).toList();

      state = state.copyWith(posts: posts);
      state = state.copyWith(scrollStatus: ScrollStatus.processed);
      state = state.copyWith(rcmdPostStatus: PostStatus.processed);
      state = state.copyWith(featuredPostStatus: PostStatus.processed);
    } catch (e) {
      state = state.copyWith(scrollStatus: ScrollStatus.error);
      state = state.copyWith(featuredPostStatus: PostStatus.error);
      state = state.copyWith(rcmdPostStatus: PostStatus.error);
      log(e.toString());
    }
  }

  Future<void> getRecentPosts(from) async {
    try {
      log("Getting articles");
      state = state.copyWith(scrollStatus: ScrollStatus.processing);
      state = state.copyWith(recentPostStatus: PostStatus.processing);

      final snapshot = await firestore
          .collection("articles")
          .orderBy("createdTime", descending: true)
          .limit(10)
          .get();
      final posts = snapshot.docs.map((e) {
        // convert timestamp to DateTime

        e.data()["createdTime"] =
            (e.data()["createdTime"] as Timestamp).toDate().toIso8601String();
        // log(e.data().toString());
        return PostModel.fromMap(e.data());
      }).toList();

      state = state.copyWith(recentPosts: posts);
      state = state.copyWith(scrollStatus: ScrollStatus.processed);
      state = state.copyWith(recentPostStatus: PostStatus.processed);
    } catch (e) {
      state = state.copyWith(scrollStatus: ScrollStatus.error);
      state = state.copyWith(recentPostStatus: PostStatus.error);
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
      state = state.copyWith(users: people);
    } catch (e) {
      print(e);
    }
  }

  loadChatRooms() async {
    try {
      log("Loading chatrooms");
      final snapshot = await firestore
          .collection("chatRoomModel")
          .where("participants.${ref.watch(authStateProvider).user!.uid}",
              isEqualTo: true)
          .get();
      final chatrooms = snapshot.docs.map((value) {
        return Chatroommodel.fromMap(value.data());
      }).toList();

      state = state.copyWith(chatrooms: chatrooms);
      return chatrooms;
    } catch (e) {
      print(e);
    }
  }

  Future<Chatroommodel> createChatRoom(targetUid) async {
    try {
      bool chatAlreadyExist = state.chatrooms!
          .any((element) => element.participants!.containsKey(targetUid));
      if (chatAlreadyExist) {
        log("chatroom already exist");
        return state.chatrooms!.firstWhere(
            (element) => element.participants!.containsKey(targetUid));
      }
      Chatroommodel chatRoomModel = Chatroommodel(participants: {
        ref.watch(authStateProvider).user!.uid: true,
        targetUid: true
      }, chatroomuid: Uuid().v4(), lastmessage: "");
      await firestore
          .collection("chatRoomModel")
          .doc()
          .set(chatRoomModel.toMap());

      state = state.copyWith(chatrooms: [...state.chatrooms!, chatRoomModel]);

      log("chatroom created");
      return chatRoomModel;
    } catch (e) {
      print(e);
      return Chatroommodel(participants: {}, chatroomuid: "", lastmessage: "");
    }
  }

  SendMessage(String msg, String chatRoomUid) async {
    log("Sending msg");

    try {
      if (msg != null) {
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
            .then((value) => log("message sent"))
            .onError((error, stackTrace) => log(error.toString()));
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
    if (val.length > 1) {
      try {
        await firestore
            .collection('articles')
            .where('subject', isGreaterThanOrEqualTo: val)
            .where('subject', isLessThan: val + 'z')
            .limit(5)
            .get()
            .then((snapshot) {
          log("Suggestion picked");
          state = state.copyWith(
              articleSearchSuggestions: snapshot.docs
                  .map((doc) => doc['subject'] as String)
                  .toList());
        });
      } catch (e) {
        print(e);
      }
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
  List<UserModel>? users;
  List<Chatroommodel>? chatrooms;
  List<String>? articleSearchSuggestions;
  ScrollStatus? scrollStatus;
  PostStatus? rcmdPostStatus;
  PostStatus? recentPostStatus;
  PostStatus? featuredPostStatus;
  UploadArticleStatus? uploadArticleStatus;

  CommunityState({
    this.posts,
    this.recentPosts,
    this.myPosts,
    this.bookMarkedPosts,
    this.chatrooms,
    this.users,
    this.articleSearchSuggestions,
    this.scrollStatus,
    this.rcmdPostStatus,
    this.recentPostStatus,
    this.featuredPostStatus,
    this.uploadArticleStatus,
  });

  CommunityState copyWith({
    List<PostModel>? posts,
    List<PostModel>? myPosts,
    List<PostModel>? recentPosts,
    List<PostModel>? bookMarkedPosts,
    List<UserModel>? users,
    List<Chatroommodel>? chatrooms,
    List<String>? articleSearchSuggestions,
    ScrollStatus? scrollStatus,
    PostStatus? featuredPostStatus,
    PostStatus? recentPostStatus,
    PostStatus? rcmdPostStatus,
    UploadArticleStatus? uploadArticleStatus,
  }) {
    return CommunityState(
      posts: posts ?? this.posts,
      myPosts: myPosts ?? this.myPosts,
      bookMarkedPosts: bookMarkedPosts ?? this.bookMarkedPosts,
      users: users ?? this.users,
      recentPosts: recentPosts ?? this.recentPosts,
      chatrooms: chatrooms ?? this.chatrooms,
      articleSearchSuggestions: articleSearchSuggestions ?? [],
      scrollStatus: scrollStatus ?? this.scrollStatus,
      rcmdPostStatus: rcmdPostStatus ?? this.rcmdPostStatus,
      featuredPostStatus: featuredPostStatus ?? this.featuredPostStatus,
      recentPostStatus: recentPostStatus ?? this.recentPostStatus,
      uploadArticleStatus: uploadArticleStatus ?? this.uploadArticleStatus,
    );
  }
}

enum ScrollStatus { initial, exhausted, processing, processed, error }

enum PostStatus { initial, processing, processed, error }

enum UploadArticleStatus { initial, processing, processed, error }
