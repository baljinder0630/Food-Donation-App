import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_donation_app/Models/Post.model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class Community extends StateNotifier<CommunityState> {
  final StateNotifierProviderRef ref;
  Community({required this.ref})
      : super(CommunityState(
          posts: [],
          total: 0,
          scrollStatus: ScrollStatus.initial,
          postStatus: RecommendedPostStatus.initial,
          featuredPostStatus: FeaturedPostStatus.initial,
        ));

  Future<void> uploadPost(PostModel post) async {
    return;
  }
}

class CommunityState {
  List<PostModel>? posts;
  int? total;
  ScrollStatus? scrollStatus;
  RecommendedPostStatus? postStatus;
  FeaturedPostStatus? featuredPostStatus;

  CommunityState({
    this.posts,
    this.total,
    this.scrollStatus,
    this.postStatus,
    this.featuredPostStatus,
  });

  CommunityState copyWith({
    List<PostModel>? posts,
    int? total,
    ScrollStatus? scrollStatus,
    RecommendedPostStatus? postStatus,
    FeaturedPostStatus? featuredPostStatus,
  }) {
    return CommunityState(
      posts: posts ?? this.posts,
      total: total ?? this.total,
      scrollStatus: scrollStatus ?? this.scrollStatus,
      postStatus: postStatus ?? this.postStatus,
      featuredPostStatus: featuredPostStatus ?? this.featuredPostStatus,
    );
  }
}

enum ScrollStatus { initial, exhausted, processing, processed, error }

enum FeaturedPostStatus { initial, processing, processed, error }

enum RecommendedPostStatus { initial, processing, processed, error }
