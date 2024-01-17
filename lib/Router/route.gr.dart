// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;
import 'package:food_donation_app/Pages/Community/communityScreen.dart' as _i1;
import 'package:food_donation_app/Pages/homePage.dart' as _i2;
import 'package:food_donation_app/Pages/Login/login.dart' as _i3;
import 'package:food_donation_app/Pages/Signup/Signup.dart' as _i4;
import 'package:food_donation_app/Pages/SplashScreen/splashScreen.dart' as _i5;

abstract class $AppRouter extends _i6.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    CommunityHomePageRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.CommunityHomePage(),
      );
    },
    HomePageRoute.name: (routeData) {
      final args = routeData.argsAs<HomePageRouteArgs>(
          orElse: () => const HomePageRouteArgs());
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.HomePage(key: args.key),
      );
    },
    LoginPageRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.LoginPage(),
      );
    },
    SignUpPageRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.SignUpPage(),
      );
    },
    SplashScreenRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.SplashScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.CommunityHomePage]
class CommunityHomePageRoute extends _i6.PageRouteInfo<void> {
  const CommunityHomePageRoute({List<_i6.PageRouteInfo>? children})
      : super(
          CommunityHomePageRoute.name,
          initialChildren: children,
        );

  static const String name = 'CommunityHomePageRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i2.HomePage]
class HomePageRoute extends _i6.PageRouteInfo<HomePageRouteArgs> {
  HomePageRoute({
    _i7.Key? key,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          HomePageRoute.name,
          args: HomePageRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'HomePageRoute';

  static const _i6.PageInfo<HomePageRouteArgs> page =
      _i6.PageInfo<HomePageRouteArgs>(name);
}

class HomePageRouteArgs {
  const HomePageRouteArgs({this.key});

  final _i7.Key? key;

  @override
  String toString() {
    return 'HomePageRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i3.LoginPage]
class LoginPageRoute extends _i6.PageRouteInfo<void> {
  const LoginPageRoute({List<_i6.PageRouteInfo>? children})
      : super(
          LoginPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginPageRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i4.SignUpPage]
class SignUpPageRoute extends _i6.PageRouteInfo<void> {
  const SignUpPageRoute({List<_i6.PageRouteInfo>? children})
      : super(
          SignUpPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpPageRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i5.SplashScreen]
class SplashScreenRoute extends _i6.PageRouteInfo<void> {
  const SplashScreenRoute({List<_i6.PageRouteInfo>? children})
      : super(
          SplashScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashScreenRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}
