import 'dart:developer';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_donation_app/Models/Post.model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
          total: 0,
          scrollStatus: ScrollStatus.initial,
          postStatus: RecommendedPostStatus.initial,
          featuredPostStatus: FeaturedPostStatus.initial,
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

  Future<void> getPosts() async {
    try {
      log("Getting articles");
      state = state.copyWith(scrollStatus: ScrollStatus.processing);
      state = state.copyWith(postStatus: RecommendedPostStatus.processing);
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
      state = state.copyWith(posts: posts);
      state = state.copyWith(scrollStatus: ScrollStatus.processed);
      state = state.copyWith(postStatus: RecommendedPostStatus.processed);
    } catch (e) {
      state = state.copyWith(scrollStatus: ScrollStatus.error);
      state = state.copyWith(postStatus: RecommendedPostStatus.error);
      log(e.toString());
    }
  }

  articleSearchSuggestion(String val) async {
    log("Fetching suggestion for $val");
    if (val.length > 1)
      try {
        firestore
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

class CommunityState {
  List<PostModel>? posts;
  List<String>? articleSearchSuggestions;
  int total;
  ScrollStatus? scrollStatus;
  RecommendedPostStatus? postStatus;
  FeaturedPostStatus? featuredPostStatus;
  UploadArticleStatus? uploadArticleStatus;

  CommunityState({
    this.posts,
    this.total = 0,
    this.articleSearchSuggestions,
    this.scrollStatus,
    this.postStatus,
    this.featuredPostStatus,
    this.uploadArticleStatus,
  });

  CommunityState copyWith({
    List<PostModel>? posts,
    List<String>? articleSearchSuggestions,
    int? total,
    ScrollStatus? scrollStatus,
    RecommendedPostStatus? postStatus,
    FeaturedPostStatus? featuredPostStatus,
    UploadArticleStatus? uploadArticleStatus,
  }) {
    return CommunityState(
      posts: posts ?? this.posts,
      total: total ?? this.total,
      articleSearchSuggestions: articleSearchSuggestions ?? [],
      scrollStatus: scrollStatus ?? this.scrollStatus,
      postStatus: postStatus ?? this.postStatus,
      featuredPostStatus: featuredPostStatus ?? this.featuredPostStatus,
      uploadArticleStatus: uploadArticleStatus ?? this.uploadArticleStatus,
    );
  }
}

enum ScrollStatus { initial, exhausted, processing, processed, error }

enum FeaturedPostStatus { initial, processing, processed, error }

enum RecommendedPostStatus { initial, processing, processed, error }

enum UploadArticleStatus { initial, processing, processed, error }
