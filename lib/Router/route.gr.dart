// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i16;
import 'package:flutter/material.dart' as _i18;
import 'package:food_donation_app/bottomNavBar.dart' as _i1;
import 'package:food_donation_app/Models/Post.model.dart' as _i17;
import 'package:food_donation_app/Pages/Community/articleDetail.dart' as _i2;
import 'package:food_donation_app/Pages/Community/communityScreen.dart' as _i3;
import 'package:food_donation_app/Pages/Community/postArticle.dart' as _i12;
import 'package:food_donation_app/Pages/DashBoard/dashBoard.dart' as _i4;
import 'package:food_donation_app/Pages/Donate/donateform.dart' as _i5;
import 'package:food_donation_app/Pages/DonationRequest/donationDescription.dart'
    as _i6;
import 'package:food_donation_app/Pages/DonationRequest/donationRequest.dart'
    as _i7;
import 'package:food_donation_app/Pages/DonationRequest/raiseRequest.dart'
    as _i13;
import 'package:food_donation_app/Pages/homePage.dart' as _i8;
import 'package:food_donation_app/Pages/HomePages/hungerSpots.dart' as _i9;
import 'package:food_donation_app/Pages/HomePages/pickupRequest.dart' as _i11;
import 'package:food_donation_app/Pages/Login/login.dart' as _i10;
import 'package:food_donation_app/Pages/Signup/Signup.dart' as _i14;
import 'package:food_donation_app/Pages/SplashScreen/splashScreen.dart' as _i15;

abstract class $AppRouter extends _i16.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i16.PageFactory> pagesMap = {
    AppBottomNavigationBarRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.AppBottomNavigationBar(),
      );
    },
    ArticleDetailRoute.name: (routeData) {
      final args = routeData.argsAs<ArticleDetailRouteArgs>();
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.ArticleDetail(
          article: args.article,
          key: args.key,
        ),
      );
    },
    CommunityHomePageRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.CommunityHomePage(),
      );
    },
    DashBoardPageRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.DashBoardPage(),
      );
    },
    DonateFormRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.DonateForm(),
      );
    },
    DonationDescriptionRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.DonationDescription(),
      );
    },
    DonationRequestRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.DonationRequest(),
      );
    },
    HomePageRoute.name: (routeData) {
      final args = routeData.argsAs<HomePageRouteArgs>(
          orElse: () => const HomePageRouteArgs());
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.HomePage(key: args.key),
      );
    },
    HungerSpotRoute.name: (routeData) {
      final args = routeData.argsAs<HungerSpotRouteArgs>();
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.HungerSpot(
          key: args.key,
          child: args.child,
        ),
      );
    },
    LoginPageRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.LoginPage(),
      );
    },
    PickUpRequestRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.PickUpRequest(),
      );
    },
    PostArticleRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.PostArticle(),
      );
    },
    RaiseRequestRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.RaiseRequest(),
      );
    },
    SignUpPageRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i14.SignUpPage(),
      );
    },
    SplashScreenRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i15.SplashScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.AppBottomNavigationBar]
class AppBottomNavigationBarRoute extends _i16.PageRouteInfo<void> {
  const AppBottomNavigationBarRoute({List<_i16.PageRouteInfo>? children})
      : super(
          AppBottomNavigationBarRoute.name,
          initialChildren: children,
        );

  static const String name = 'AppBottomNavigationBarRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i2.ArticleDetail]
class ArticleDetailRoute extends _i16.PageRouteInfo<ArticleDetailRouteArgs> {
  ArticleDetailRoute({
    required _i17.PostModel article,
    _i18.Key? key,
    List<_i16.PageRouteInfo>? children,
  }) : super(
          ArticleDetailRoute.name,
          args: ArticleDetailRouteArgs(
            article: article,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'ArticleDetailRoute';

  static const _i16.PageInfo<ArticleDetailRouteArgs> page =
      _i16.PageInfo<ArticleDetailRouteArgs>(name);
}

class ArticleDetailRouteArgs {
  const ArticleDetailRouteArgs({
    required this.article,
    this.key,
  });

  final _i17.PostModel article;

  final _i18.Key? key;

  @override
  String toString() {
    return 'ArticleDetailRouteArgs{article: $article, key: $key}';
  }
}

/// generated route for
/// [_i3.CommunityHomePage]
class CommunityHomePageRoute extends _i16.PageRouteInfo<void> {
  const CommunityHomePageRoute({List<_i16.PageRouteInfo>? children})
      : super(
          CommunityHomePageRoute.name,
          initialChildren: children,
        );

  static const String name = 'CommunityHomePageRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i4.DashBoardPage]
class DashBoardPageRoute extends _i16.PageRouteInfo<void> {
  const DashBoardPageRoute({List<_i16.PageRouteInfo>? children})
      : super(
          DashBoardPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashBoardPageRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i5.DonateForm]
class DonateFormRoute extends _i16.PageRouteInfo<void> {
  const DonateFormRoute({List<_i16.PageRouteInfo>? children})
      : super(
          DonateFormRoute.name,
          initialChildren: children,
        );

  static const String name = 'DonateFormRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i6.DonationDescription]
class DonationDescriptionRoute extends _i16.PageRouteInfo<void> {
  const DonationDescriptionRoute({List<_i16.PageRouteInfo>? children})
      : super(
          DonationDescriptionRoute.name,
          initialChildren: children,
        );

  static const String name = 'DonationDescriptionRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i7.DonationRequest]
class DonationRequestRoute extends _i16.PageRouteInfo<void> {
  const DonationRequestRoute({List<_i16.PageRouteInfo>? children})
      : super(
          DonationRequestRoute.name,
          initialChildren: children,
        );

  static const String name = 'DonationRequestRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i8.HomePage]
class HomePageRoute extends _i16.PageRouteInfo<HomePageRouteArgs> {
  HomePageRoute({
    _i18.Key? key,
    List<_i16.PageRouteInfo>? children,
  }) : super(
          HomePageRoute.name,
          args: HomePageRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'HomePageRoute';

  static const _i16.PageInfo<HomePageRouteArgs> page =
      _i16.PageInfo<HomePageRouteArgs>(name);
}

class HomePageRouteArgs {
  const HomePageRouteArgs({this.key});

  final _i18.Key? key;

  @override
  String toString() {
    return 'HomePageRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i9.HungerSpot]
class HungerSpotRoute extends _i16.PageRouteInfo<HungerSpotRouteArgs> {
  HungerSpotRoute({
    _i18.Key? key,
    required String child,
    List<_i16.PageRouteInfo>? children,
  }) : super(
          HungerSpotRoute.name,
          args: HungerSpotRouteArgs(
            key: key,
            child: child,
          ),
          initialChildren: children,
        );

  static const String name = 'HungerSpotRoute';

  static const _i16.PageInfo<HungerSpotRouteArgs> page =
      _i16.PageInfo<HungerSpotRouteArgs>(name);
}

class HungerSpotRouteArgs {
  const HungerSpotRouteArgs({
    this.key,
    required this.child,
  });

  final _i18.Key? key;

  final String child;

  @override
  String toString() {
    return 'HungerSpotRouteArgs{key: $key, child: $child}';
  }
}

/// generated route for
/// [_i10.LoginPage]
class LoginPageRoute extends _i16.PageRouteInfo<void> {
  const LoginPageRoute({List<_i16.PageRouteInfo>? children})
      : super(
          LoginPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginPageRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i11.PickUpRequest]
class PickUpRequestRoute extends _i16.PageRouteInfo<void> {
  const PickUpRequestRoute({List<_i16.PageRouteInfo>? children})
      : super(
          PickUpRequestRoute.name,
          initialChildren: children,
        );

  static const String name = 'PickUpRequestRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i12.PostArticle]
class PostArticleRoute extends _i16.PageRouteInfo<void> {
  const PostArticleRoute({List<_i16.PageRouteInfo>? children})
      : super(
          PostArticleRoute.name,
          initialChildren: children,
        );

  static const String name = 'PostArticleRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i13.RaiseRequest]
class RaiseRequestRoute extends _i16.PageRouteInfo<void> {
  const RaiseRequestRoute({List<_i16.PageRouteInfo>? children})
      : super(
          RaiseRequestRoute.name,
          initialChildren: children,
        );

  static const String name = 'RaiseRequestRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i14.SignUpPage]
class SignUpPageRoute extends _i16.PageRouteInfo<void> {
  const SignUpPageRoute({List<_i16.PageRouteInfo>? children})
      : super(
          SignUpPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpPageRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i15.SplashScreen]
class SplashScreenRoute extends _i16.PageRouteInfo<void> {
  const SplashScreenRoute({List<_i16.PageRouteInfo>? children})
      : super(
          SplashScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashScreenRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}
