import 'package:flutter/services.dart';
import 'package:auto_route/auto_route.dart';
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
  @override
  Widget build(BuildContext context) {
    ref.listen(authStateProvider, (previous, next) async {
      if (next.appStatus == AppStatus.authenticated) {
        await Future.delayed(Duration(seconds: 2)); // Wait for 2 seconds
        context.router.replace(const AppBottomNavigationBarRoute());
      } else {
        await Future.delayed(Duration(seconds: 2)); // Wait for 2 seconds
        context.router.replace(const SignUpPageRoute());
      }
    });

    return Scaffold(
      body: Image.asset(
        'assets/splash_background_img.png',
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      ),
    );
  }
}
