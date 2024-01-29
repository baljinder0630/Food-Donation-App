import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_donation_app/Provider/userProvider.dart';
import 'package:food_donation_app/Router/route.gr.dart';

@RoutePage()
class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  late FirebaseMessaging firebaseMessaging;
  @override
  void initState() {
    firebaseMessaging = FirebaseMessaging.instance;
    firebaseMessaging.getToken().then((value) {
      // TODO: Save token to firestore
      log("Firebase messaging token ");
      print(value.toString());
    });
    FirebaseMessaging.onMessage.listen((RemoteMessage event) {
      log("message recieved");
      log(event.notification!.body.toString());
      //  show this notification
    });
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      log('Message clicked!');
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(authStateProvider, (previous, next) {
      if (next.appStatus == AppStatus.authenticated) {
        context.router.replace(const AppBottomNavigationBarRoute());
        // context.router.replace(const CommunityHomePageRoute());
      } else {
        context.router.replace(const SignUpPageRoute());
      }
    });

    return Scaffold(
        body: Center(
      child: Text("Splash Screen"),
    ));
  }
}
