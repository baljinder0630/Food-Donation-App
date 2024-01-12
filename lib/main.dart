import 'package:flutter/material.dart';
import 'package:food_donation_app/Router/route.dart';
import 'package:food_donation_app/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        routerConfig: _appRouter.config(),
        title: 'Food Donation App',
        theme: ThemeData(
            primaryColor: primaryColor,
            scaffoldBackgroundColor: backgroundColor,
            appBarTheme: const AppBarTheme(
                color: Colors.transparent,
                elevation: 0,
                iconTheme: IconThemeData(color: Colors.black))));
  }
}
