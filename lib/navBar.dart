import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class MyNavBar extends StatefulWidget {
  const MyNavBar({super.key});

  @override
  State<MyNavBar> createState() => _MyNavBarState();
}

class _MyNavBarState extends State<MyNavBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: const Center(
          child: Text('MyNavBar'),
        ),
        bottomNavigationBar: Container(
          height: 104.5.h,
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: SvgPicture.asset(
              '/lib/assets/Navbar/',
              fit: BoxFit.cover,
            ),
          ),
        ));
  }
}

//  navbar provider

final myNavBarProvider = StateNotifierProvider<MyNavBarProvider, int>((ref) {
  return MyNavBarProvider();
});

class MyNavBarProvider extends StateNotifier<int> {
  MyNavBarProvider() : super(0);

  void changeIndex(int index) {
    state = index;
  }
}
