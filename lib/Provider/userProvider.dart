import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_donation_app/Models/User.model.dart';
import 'package:uuid/uuid.dart';

final authStateProvider = StateNotifierProvider<UserAuth, AuthState>((ref) {
  return UserAuth();
});

class UserAuth extends StateNotifier<AuthState> {
  UserAuth()
      : super(
          AuthState(
            user: UserModel(
              uid: "",
              email: "",
              displayName: "",
              photoURL: "",
              totalConnects: 0,
            ),
            authStatus: AuthStatus.initial,
            appStatus: AppStatus.initial,
            // messaging: FirebaseMessaging.instance,
            profilePicUpdateStatus: ProfilePicUpdateStatus.initial,
          ),
        ) {
    checkAuthentication();
  }

  String getUid() {
    return state.user!.uid ?? "";
  }

  String getDisplayName() {
    return state.user!.displayName ?? "User";
  }

  String getPhotoUrl() {
    return state.user!.photoURL ?? "null";
  }

  checkAuthentication() async {

    FirebaseAuth.instance.authStateChanges().listen((User? user) async {
      if (user == null) {
        state = state.copyWith(
          authStatus: AuthStatus.processed,
          appStatus: AppStatus.unAuthenticated,
        );
        log("User is currently signed out!");
      } else {
        fetchUserData(user.uid);
      }
    });
  }

  fetchUserData(uid) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        state = state.copyWith(
          user: UserModel.fromMap(
              documentSnapshot.data() as Map<String, dynamic>),
          authStatus: AuthStatus.processed,
          appStatus: AppStatus.authenticated,
        );
        log("User Data Fetched");
      } else {
        log("User does not exist");
        state = state.copyWith(
          authStatus: AuthStatus.processed,
          appStatus: AppStatus.unAuthenticated,
        );
      }
    });
  }

  Future<bool> signUp(email, password, name, context) async {
    try {
      state = state.copyWith(authStatus: AuthStatus.processing);
      log(state.user.toString());

      return await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((credential) async {
        if (credential.user == null) return false;

        log("User Created Successfully");

        await credential.user!.updateDisplayName(name);
        await FirebaseAuth.instance.currentUser!.reload();
        User? user = FirebaseAuth.instance.currentUser;

        if (user == null) {
          return false;
        }

        final newUser = UserModel(
          uid: user.uid.toString(),
          email: user.email.toString(),
          displayName: user.displayName.toString(),
          photoURL: user.photoURL.toString(),
          totalConnects: 0,
        );

        return await FirebaseFirestore.instance
            .collection('users')
            .doc(credential.user!.uid)
            .set(newUser.toMap())
            .then((value) {
          state.copyWith(
            authStatus: AuthStatus.processed,
            appStatus: AppStatus.authenticated,
            user: newUser,
          );
          showSnackBar("SignUp Successful", context, Colors.green);

          log("User name added to firebase");
          return true;
        }).onError((error, stackTrace) {
          showSnackBar("SignUp Failed", context, Colors.red);

          state = state.copyWith(
            authStatus: AuthStatus.processed,
            appStatus: AppStatus.unAuthenticated,
          );
          log(error.toString());
          return false;
        });
      });
    } on FirebaseAuthException catch (e) {
      showSnackBar("SignUp Failed", context, Colors.red);
      log(e.message.toString());
      state = state.copyWith(
        authStatus: AuthStatus.processed,
        appStatus: AppStatus.unAuthenticated,
      );

      return false;
    }
  }

  Future<bool> login(email, password, context) async {
    try {
      state = state.copyWith(authStatus: AuthStatus.processing);

      return await FirebaseAuth.instance
          .signInWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((value) async {
        log("User Logged In Successfully");
        await checkAuthentication();
        state.copyWith(
          authStatus: AuthStatus.processed,
          appStatus: AppStatus.authenticated,
        );

        showSnackBar("Login Successful", context, Colors.green);
        return true;
      }).onError((error, stackTrace) {
        state = state.copyWith(
          authStatus: AuthStatus.processed,
          appStatus: AppStatus.unAuthenticated,
        );
        log("User Login Failed");
        showSnackBar("Login Failed", context, Colors.red);

        return false;
      });
    } on FirebaseAuthException catch (e) {
      showSnackBar("Login Failed", context, Colors.red);

      log(e.message.toString());
      state = state.copyWith(
        authStatus: AuthStatus.processed,
        appStatus: AppStatus.unAuthenticated,
      );
      return false;
    }
  }

  logout() async {
    await FirebaseAuth.instance.signOut();
    state = state.copyWith(
      user: null,
      authStatus: AuthStatus.processed,
      appStatus: AppStatus.unAuthenticated,
    );
  }

  Future<String> uploadImage(File? file) async {
    try {
      final ref = FirebaseStorage.instance.ref().child("users/${Uuid().v4()}");
      final uploadTask = ref.putFile(File(file!.path));
      final snapshot = await uploadTask.whenComplete(() => null);
      final url = await snapshot.ref.getDownloadURL();
      return url;
    } catch (e) {
      log(e.toString());
      return "";
    }
  }

  updateProfilePic(File imgUrl) async {
    try {
      if (FirebaseAuth.instance.currentUser == null || imgUrl == null) return;

      state = state.copyWith(
          profilePicUpdateStatus: ProfilePicUpdateStatus.processing);

      String url = await uploadImage(File(imgUrl.path));

      await FirebaseAuth.instance.currentUser!
          .updatePhotoURL(url)
          .whenComplete(() async => {
                await FirebaseFirestore.instance
                    .collection("users")
                    .doc(FirebaseAuth.instance.currentUser!.uid)
                    .update({"photoURL": url}).whenComplete(() =>
                        fetchUserData(FirebaseAuth.instance.currentUser!.uid)),
                state = state.copyWith(
                  profilePicUpdateStatus: ProfilePicUpdateStatus.processed,
                )
              })
          .onError((error, stackTrace) {
        state = state.copyWith(
            profilePicUpdateStatus: ProfilePicUpdateStatus.error);
      });
    } catch (e) {
      print(e);
      state =
          state.copyWith(profilePicUpdateStatus: ProfilePicUpdateStatus.error);
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

class AuthState {
  UserModel? user;
  AuthStatus? authStatus;
  AppStatus? appStatus;
  // FirebaseMessaging? messaging;
  ProfilePicUpdateStatus? profilePicUpdateStatus;

  AuthState({
    this.user,
    this.authStatus,
    this.appStatus,
    // this.messaging,
    this.profilePicUpdateStatus,
  });

  AuthState copyWith({
    UserModel? user,
    AuthStatus? authStatus,
    AppStatus? appStatus,
    // FirebaseMessaging? messaging,
    ProfilePicUpdateStatus? profilePicUpdateStatus,
  }) {
    return AuthState(
      user: user ?? this.user,
      authStatus: authStatus ?? this.authStatus,
      appStatus: appStatus ?? this.appStatus,
      // messaging: messaging ?? this.messaging,
      profilePicUpdateStatus:
          profilePicUpdateStatus ?? this.profilePicUpdateStatus,
    );
  }
}

enum AuthStatus { initial, processing, processed, error }

enum AppStatus { initial, authenticated, unAuthenticated }

enum ProfilePicUpdateStatus { initial, processing, processed, error }
