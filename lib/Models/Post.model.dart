import 'package:cloud_firestore/cloud_firestore.dart';

class PostModel {
  final id;
  final subject;
  final description;
  String imgUrl;
  final userId;
  final username;
  final Timestamp createdTime;
  String? createdByAvatar;
  bool? edited = false;
  PostModel(
      {required this.id,
      required this.subject,
      required this.description,
      required this.imgUrl,
      required this.createdTime,
      required this.createdByAvatar,
      required this.userId,
      required this.username,
      this.edited});

  factory PostModel.fromMap(Map<String, dynamic> map) {
    return PostModel(
      id: map['id'],
      subject: map['subject'],
      description: map['description'],
      imgUrl: map['imgUrl'],
      userId: map['userId'],
      username: map['username'],
      createdTime: map['createdTime'],
      createdByAvatar: map['createdByAvatar'],
      edited: map['edited'] ?? false,
    );
  }
  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "subject": subject,
      "description": description,
      "imgUrl": imgUrl,
      "userId": userId,
      "username": username,
      "createdTime": createdTime,
      "createdByAvatar": createdByAvatar,
      "edited": edited ?? false,
    };
  }
}
