class UserModel {
  final String uid;
  final String email;
  final String username;
  final String profile;
  final String phone;
  final List<String> bookmarks;

  UserModel({
    required this.uid,
    required this.email,
    required this.username,
    required this.profile,
    required this.phone,
    required this.bookmarks,
  });

  // Convert a UserModel into a JSON object
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'username': username,
      'profile': profile,
      'phone': phone,
      'bookmarks': bookmarks,
    };
  }

  // Create a UserModel from a JSON object
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      username: map['username'],
      profile: map['profile'],
      phone: map['phone'],
      bookmarks: List<String>.from(map['bookmarks']),
    );
  }
}
