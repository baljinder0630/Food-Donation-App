import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_donation_app/Models/User.model.dart';

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
                totalConnects: 0),
            authStatus: AuthStatus.initial,
            appStatus: AppStatus.initial,
            messaging: FirebaseMessaging.instance,
          ),
        ) {
    checkAuthentication();
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
        await FirebaseFirestore.instance
            .collection("users")
            .where("uid", isEqualTo: user.uid)
            .get()
            .then((value) {
          if (value.docs.length == 0) {
            // log("No user found");
            // state = state.copyWith(
            //   authStatus: AuthStatus.processed,
            //   appStatus: AppStatus.unAuthenticated,
            // );
            return;
          }
          state = state.copyWith(
            user: UserModel(
                uid: value.docs[0].data()['uid'].toString(),
                email: value.docs[0].data()['email'].toString(),
                displayName: value.docs[0].data()['displayName'].toString(),
                photoURL: value.docs[0].data()['photoURL'].toString(),
                totalConnects: value.docs[0].data()['totalConnects'] ?? 0),
            authStatus: AuthStatus.processed,
            appStatus: AppStatus.authenticated,
          );
          log("User is signed in!");
        });
      }
    });
    state.messaging!.requestPermission();
    await state.messaging!.getToken().then((value) async {
      log("Token fetched");
      if (FirebaseAuth.instance.currentUser == null) return;
      await FirebaseFirestore.instance
          .collection("users")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update({"token": value});
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
  FirebaseMessaging? messaging;

  AuthState({
    this.user,
    this.authStatus,
    this.appStatus,
    this.messaging,
  });

  AuthState copyWith({
    UserModel? user,
    AuthStatus? authStatus,
    AppStatus? appStatus,
    FirebaseMessaging? messaging,
  }) {
    return AuthState(
      user: user ?? this.user,
      authStatus: authStatus ?? this.authStatus,
      appStatus: appStatus ?? this.appStatus,
      messaging: messaging ?? this.messaging,
    );
  }
}

enum AuthStatus { initial, processing, processed, error }

enum AppStatus { initial, authenticated, unAuthenticated }
