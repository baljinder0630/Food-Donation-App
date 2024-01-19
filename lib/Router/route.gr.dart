// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i14;
import 'package:flutter/material.dart' as _i15;
import 'package:food_donation_app/Pages/Community/communityScreen.dart' as _i2;
import 'package:food_donation_app/Pages/Community/postArticle.dart' as _i11;
import 'package:food_donation_app/Pages/DonationRequest/raiseRequest.dart' as _i16;
import 'package:food_donation_app/Pages/DashBoard/dashBoard.dart' as _i3;
import 'package:food_donation_app/Pages/Donate/donateform.dart' as _i4;
import 'package:food_donation_app/Pages/DonationRequest/donationDescription.dart'
    as _i5;
import 'package:food_donation_app/Pages/DonationRequest/donationRequest.dart'
    as _i6;
import 'package:food_donation_app/Pages/HomePages/hungerSpots.dart' as _i8;
import 'package:food_donation_app/Pages/HomePages/pickupRequest.dart' as _i10;
import 'package:food_donation_app/Pages/Login/login.dart' as _i9;
import 'package:food_donation_app/Pages/Signup/Signup.dart' as _i12;
import 'package:food_donation_app/Pages/SplashScreen/splashScreen.dart' as _i13;
import 'package:food_donation_app/Pages/homePage.dart' as _i7;
import 'package:food_donation_app/bottomNavBar.dart' as _i1;

abstract class $AppRouter extends _i14.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i14.PageFactory> pagesMap = {
    AppBottomNavigationBarRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.AppBottomNavigationBar(),
      );
    },
    CommunityHomePageRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.CommunityHomePage(),
      );
    },
    RaiseRequestPageRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i16.RaiseRequest(),
      );
    },
    DashBoardPageRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.DashBoardPage(),
      );
    },
    DonateFormRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.DonateForm(),
      );
    },
    DonationDescriptionRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.DonationDescription(),
      );
    },
    DonationRequestRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.DonationRequest(),
      );
    },
    HomePageRoute.name: (routeData) {
      final args = routeData.argsAs<HomePageRouteArgs>(
          orElse: () => const HomePageRouteArgs());
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.HomePage(key: args.key),
      );
    },
    HungerSpotRoute.name: (routeData) {
      final args = routeData.argsAs<HungerSpotRouteArgs>();
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.HungerSpot(child: args.child),
      );
    },
    LoginPageRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.LoginPage(),
      );
    },
    PickUpReequestRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.PickUpRequest(),
      );
    },
    PostArticleRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.PostArticle(),
      );
    },
    SignUpPageRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.SignUpPage(),
      );
    },
    SplashScreenRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.SplashScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.AppBottomNavigationBar]
class AppBottomNavigationBarRoute extends _i14.PageRouteInfo<void> {
  const AppBottomNavigationBarRoute({List<_i14.PageRouteInfo>? children})
      : super(
          AppBottomNavigationBarRoute.name,
          initialChildren: children,
        );

  static const String name = 'AppBottomNavigationBarRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i2.CommunityHomePage]
class CommunityHomePageRoute extends _i14.PageRouteInfo<void> {
  const CommunityHomePageRoute({List<_i14.PageRouteInfo>? children})
      : super(
          CommunityHomePageRoute.name,
          initialChildren: children,
        );

  static const String name = 'CommunityHomePageRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i3.DashBoardPage]
class DashBoardPageRoute extends _i14.PageRouteInfo<void> {
  const DashBoardPageRoute({List<_i14.PageRouteInfo>? children})
      : super(
          DashBoardPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashBoardPageRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i4.DonateForm]
class DonateFormRoute extends _i14.PageRouteInfo<void> {
  const DonateFormRoute({List<_i14.PageRouteInfo>? children})
      : super(
          DonateFormRoute.name,
          initialChildren: children,
        );

  static const String name = 'DonateFormRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i5.DonationDescription]
class DonationDescriptionRoute extends _i14.PageRouteInfo<void> {
  const DonationDescriptionRoute({List<_i14.PageRouteInfo>? children})
      : super(
          DonationDescriptionRoute.name,
          initialChildren: children,
        );

  static const String name = 'DonationDescriptionRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i6.DonationRequest]
class DonationRequestRoute extends _i14.PageRouteInfo<void> {
  const DonationRequestRoute({List<_i14.PageRouteInfo>? children})
      : super(
          DonationRequestRoute.name,
          initialChildren: children,
        );

  static const String name = 'DonationRequestRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i7.HomePage]
class HomePageRoute extends _i14.PageRouteInfo<HomePageRouteArgs> {
  HomePageRoute({
    _i15.Key? key,
    List<_i14.PageRouteInfo>? children,
  }) : super(
          HomePageRoute.name,
          args: HomePageRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'HomePageRoute';

  static const _i14.PageInfo<HomePageRouteArgs> page =
      _i14.PageInfo<HomePageRouteArgs>(name);
}

class HomePageRouteArgs {
  const HomePageRouteArgs({this.key});

  final _i15.Key? key;

  @override
  String toString() {
    return 'HomePageRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i8.HungerSpot]
class HungerSpotRoute extends _i14.PageRouteInfo<HungerSpotRouteArgs> {
  HungerSpotRoute({
    required String child,
    List<_i14.PageRouteInfo>? children,
  }) : super(
          HungerSpotRoute.name,
          args: HungerSpotRouteArgs(child: child),
          initialChildren: children,
        );

  static const String name = 'HungerSpotRoute';

  static const _i14.PageInfo<HungerSpotRouteArgs> page =
      _i14.PageInfo<HungerSpotRouteArgs>(name);
}

class HungerSpotRouteArgs {
  const HungerSpotRouteArgs({required this.child});

  final String child;

  @override
  String toString() {
    return 'HungerSpotRouteArgs{child: $child}';
  }
}

/// generated route for
/// [_i9.LoginPage]
class LoginPageRoute extends _i14.PageRouteInfo<void> {
  const LoginPageRoute({List<_i14.PageRouteInfo>? children})
      : super(
          LoginPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginPageRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i10.PickUpRequest]
class PickUpReequestRoute extends _i14.PageRouteInfo<void> {
  const PickUpReequestRoute({List<_i14.PageRouteInfo>? children})
      : super(
          PickUpReequestRoute.name,
          initialChildren: children,
        );

  static const String name = 'PickUpReequestRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i11.PostArticle]
class PostArticleRoute extends _i14.PageRouteInfo<void> {
  const PostArticleRoute({List<_i14.PageRouteInfo>? children})
      : super(
          PostArticleRoute.name,
          initialChildren: children,
        );

  static const String name = 'PostArticleRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i12.SignUpPage]
class SignUpPageRoute extends _i14.PageRouteInfo<void> {
  const SignUpPageRoute({List<_i14.PageRouteInfo>? children})
      : super(
          SignUpPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpPageRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i13.SplashScreen]
class SplashScreenRoute extends _i14.PageRouteInfo<void> {
  const SplashScreenRoute({List<_i14.PageRouteInfo>? children})
      : super(
          SplashScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashScreenRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i16.RaiseRequest]
class RaiseRequestPageRoute extends _i14.PageRouteInfo<void> {
  const RaiseRequestPageRoute({List<_i14.PageRouteInfo>? children})
      : super(
          RaiseRequestPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'RaiseRequestPageRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}
