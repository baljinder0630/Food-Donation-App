class UserModel {
  final String uid;
  final String email;
  final String displayName;
  final String photoURL;
  final totalConnects;

  UserModel({
    required this.uid,
    required this.email,
    required this.displayName,
    required this.photoURL,
    this.totalConnects,
  });

  factory UserModel.fromMap(Map<String, dynamic> data) {
    return UserModel(
      uid: data['uid'] ?? "",
      email: data['email'] ?? "",
      displayName: data['displayName'] ?? "",
      photoURL: data['photoURL'] ?? "",
      totalConnects: data['totalConnects'] ?? 0,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'displayName': displayName,
      'photoURL': photoURL,
      'totalConnects': totalConnects,
    };
  }
}
