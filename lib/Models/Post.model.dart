class PostModel {
  final id;
  final subject;
  final description;
  final imgUrl;
  final userId;
  final username;
  final createdTime;
  final createdByAvatar;
  PostModel({
    required this.id,
    required this.subject,
    required this.description,
    required this.imgUrl,
    required this.createdTime,
    required this.createdByAvatar,
    required this.userId,
    required this.username,
  });

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
      "createdByAvatar": createdByAvatar
    };
  }
}
