import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  final User? firebaseUser;
  final List<String> bookmarks;
  final List<String> connectionRequests;
  final List<String> connections;

  UserModel({
    this.firebaseUser,
    required this.bookmarks,
    required this.connectionRequests,
    required this.connections,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': firebaseUser?.uid,
      'email': firebaseUser?.email,
      'displayName': firebaseUser?.displayName,
      'photoURL': firebaseUser?.photoURL,
      'bookmarks': bookmarks,
      'connectionRequests': connectionRequests,
      'connections': connections,
    };
  }
}
