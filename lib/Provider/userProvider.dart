import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authStateProvider = StateNotifierProvider<UserAuth, AuthState>((ref) {
  return UserAuth();
});

class UserAuth extends StateNotifier<AuthState> {
  UserAuth()
      : super(
          AuthState(
            user: FirebaseAuth.instance.currentUser,
            authStatus: AuthStatus.initial,
            appStatus: AppStatus.initial,
          ),
        ) {
    checkAuthentication();
  }

  checkAuthentication() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        state = state.copyWith(
          authStatus: AuthStatus.processed,
          appStatus: AppStatus.unAuthenticated,
        );
        log("User is currently signed out!");
      } else {
        state = state.copyWith(
          user: user,
          authStatus: AuthStatus.processed,
          appStatus: AppStatus.authenticated,
        );
        log("User is signed in!");
      }
    });
  }

  Future<bool> signUp(email, password, name) async {
    try {
      state = state.copyWith(authStatus: AuthStatus.processing);
      log(state.user.toString());

      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (credential.user != null) {
        log("User Created Successfully");
        state = state.copyWith(user: credential.user);

        await FirebaseFirestore.instance
            .collection('users')
            .doc(credential.user!.uid)
            .set({
          'name': name,
          'email': email,
          'uid': credential.user!.uid,
        }).then((value) {
          state.user!.updateDisplayName(name);
          state.copyWith(
            authStatus: AuthStatus.processed,
            appStatus: AppStatus.authenticated,
          );
          log("User name added to firebase");
          return true;
        });
      } else {
        state = state.copyWith(
          authStatus: AuthStatus.processed,
          appStatus: AppStatus.unAuthenticated,
        );
        log("User Creation Failed");
      }
      return false;
    } on FirebaseAuthException catch (e) {
      state = state.copyWith(
        authStatus: AuthStatus.processed,
        appStatus: AppStatus.unAuthenticated,
      );
      if (e.code == 'weak-password') {
        log('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        log('The account already exists for that email.');
      }
      return false;
    }
  }

  Future<bool> login(email, password) async {
    try {
      state = state.copyWith(authStatus: AuthStatus.processing);

      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (credential.user != null) {
        log("User Logged In Successfully");
        state = state.copyWith(user: credential.user);
        state.copyWith(
          authStatus: AuthStatus.processed,
          appStatus: AppStatus.authenticated,
        );
        return true;
      } else {
        state = state.copyWith(
          authStatus: AuthStatus.processed,
          appStatus: AppStatus.unAuthenticated,
        );
        log("User Login Failed");
        return false;
      }
    } on FirebaseAuthException catch (e) {
      state = state.copyWith(
        authStatus: AuthStatus.processed,
        appStatus: AppStatus.unAuthenticated,
      );
      if (e.code == 'user-not-found') {
        log('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        log('Wrong password provided for that user.');
      }
      return false;
    }
  }
}

class AuthState {
  User? user;
  AuthStatus? authStatus;
  AppStatus? appStatus;

  AuthState({
    this.user,
    this.authStatus,
    this.appStatus,
  });

  AuthState copyWith({
    User? user,
    AuthStatus? authStatus,
    AppStatus? appStatus,
  }) {
    return AuthState(
      user: user ?? this.user,
      authStatus: authStatus ?? this.authStatus,
      appStatus: appStatus ?? this.appStatus,
    );
  }

  // User toMap() {
  //   return user;
  // }
}

enum AuthStatus { initial, processing, processed, error }

enum AppStatus { initial, authenticated, unAuthenticated }
