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
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    // precacheImage(
    //         const AssetImage('assets/splash_screen_animation.gif'), context)
    //     .then((_) {
    //   setState(() {
    //     _isLoading = false;
    //   });
    // });
    Future.delayed(const Duration(seconds: 6), () {
      setState(() {
        _isLoading = false;
      });
      _navigate();
    });
  }

  void _navigate() {
    final authState = ref.read(authStateProvider);
    if (authState.appStatus == AppStatus.authenticated) {
      context.router.replace(const AppBottomNavigationBarRoute());
    } else {
      context.router.replace(const SignUpPageRoute());
    }
  }

  @override
  Widget build(BuildContext context) {
    // ref.listen(authStateProvider, (previous, next) {
    //   if (next.appStatus == AppStatus.authenticated) {
    //     context.router.replace(const AppBottomNavigationBarRoute());
    //   } else {
    //     context.router.replace(const SignUpPageRoute());
    //   }
    // });

    return Scaffold(
      body: Image.asset('assets/splash_screen_animation.gif'),
    );
  }
}
