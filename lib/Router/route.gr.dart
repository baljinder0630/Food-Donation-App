// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i22;
import 'package:flutter/material.dart' as _i24;
import 'package:food_donation_app/bottomNavBar.dart' as _i1;
import 'package:food_donation_app/Models/Post.model.dart' as _i23;
import 'package:food_donation_app/Pages/Community/articleDetail.dart' as _i2;
import 'package:food_donation_app/Pages/Community/articleHistory.dart' as _i3;
import 'package:food_donation_app/Pages/Community/articleSearchPage.dart'
    as _i4;
import 'package:food_donation_app/Pages/Community/communityScreen.dart' as _i6;
import 'package:food_donation_app/Pages/Community/postArticle.dart' as _i16;
import 'package:food_donation_app/Pages/DashBoard/dashBoard.dart' as _i7;
import 'package:food_donation_app/Pages/Donate/camera_preview.dart' as _i5;
import 'package:food_donation_app/Pages/Donate/donateform.dart' as _i8;
import 'package:food_donation_app/Pages/DonationRequest/donationDescription.dart'
    as _i9;
import 'package:food_donation_app/Pages/DonationRequest/donationRequest.dart'
    as _i10;
import 'package:food_donation_app/Pages/DonationRequest/raiseRequest.dart'
    as _i17;
import 'package:food_donation_app/Pages/DonationRequest/raiseRequest2.dart'
    as _i18;
import 'package:food_donation_app/Pages/DonationRequest/SuccessRequest.dart'
    as _i21;
import 'package:food_donation_app/Pages/DonationRequest/YourDonationRequest.dart'
    as _i11;
import 'package:food_donation_app/Pages/homePage.dart' as _i12;
import 'package:food_donation_app/Pages/HomePages/hungerSpots.dart' as _i13;
import 'package:food_donation_app/Pages/HomePages/pickupRequest.dart' as _i15;
import 'package:food_donation_app/Pages/Login/login.dart' as _i14;
import 'package:food_donation_app/Pages/Signup/Signup.dart' as _i19;
import 'package:food_donation_app/Pages/SplashScreen/splashScreen.dart' as _i20;

abstract class $AppRouter extends _i22.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i22.PageFactory> pagesMap = {
    AppBottomNavigationBarRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.AppBottomNavigationBar(),
      );
    },
    ArticleDetailRoute.name: (routeData) {
      final args = routeData.argsAs<ArticleDetailRouteArgs>();
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.ArticleDetail(
          article: args.article,
          key: args.key,
        ),
      );
    },
    ArticleHistoryRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.ArticleHistory(),
      );
    },
    ArticleSearchPageRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.ArticleSearchPage(),
      );
    },
    CameraScreenRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.CameraScreen(),
      );
    },
    CommunityHomePageRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.CommunityHomePage(),
      );
    },
    DashBoardPageRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.DashBoardPage(),
      );
    },
    DonateFormRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.DonateForm(),
      );
    },
    DonationDescriptionRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.DonationDescription(),
      );
    },
    DonationRequestRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.DonationRequest(),
      );
    },
    DonationTrackingPageRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i11.DonationTrackingPage(),
      );
    },
    HomePageRoute.name: (routeData) {
      final args = routeData.argsAs<HomePageRouteArgs>(
          orElse: () => const HomePageRouteArgs());
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i12.HomePage(key: args.key),
      );
    },
    HungerSpotRoute.name: (routeData) {
      final args = routeData.argsAs<HungerSpotRouteArgs>();
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i13.HungerSpot(
          key: args.key,
          child: args.child,
        ),
      );
    },
    LoginPageRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i14.LoginPage(),
      );
    },
    PickUpRequestRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i15.PickUpRequest(),
      );
    },
    PostArticleRoute.name: (routeData) {
      final args = routeData.argsAs<PostArticleRouteArgs>(
          orElse: () => const PostArticleRouteArgs());
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i16.PostArticle(
          isEdit: args.isEdit,
          post: args.post,
          key: args.key,
        ),
      );
    },
    RaiseRequestRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i17.RaiseRequest(),
      );
    },
    RaiseRequest2Route.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i18.RaiseRequest2(),
      );
    },
    SignUpPageRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i19.SignUpPage(),
      );
    },
    SplashScreenRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i20.SplashScreen(),
      );
    },
    SuccessPageRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i21.SuccessPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.AppBottomNavigationBar]
class AppBottomNavigationBarRoute extends _i22.PageRouteInfo<void> {
  const AppBottomNavigationBarRoute({List<_i22.PageRouteInfo>? children})
      : super(
          AppBottomNavigationBarRoute.name,
          initialChildren: children,
        );

  static const String name = 'AppBottomNavigationBarRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i2.ArticleDetail]
class ArticleDetailRoute extends _i22.PageRouteInfo<ArticleDetailRouteArgs> {
  ArticleDetailRoute({
    required _i23.PostModel article,
    _i24.Key? key,
    List<_i22.PageRouteInfo>? children,
  }) : super(
          ArticleDetailRoute.name,
          args: ArticleDetailRouteArgs(
            article: article,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'ArticleDetailRoute';

  static const _i22.PageInfo<ArticleDetailRouteArgs> page =
      _i22.PageInfo<ArticleDetailRouteArgs>(name);
}

class ArticleDetailRouteArgs {
  const ArticleDetailRouteArgs({
    required this.article,
    this.key,
  });

  final _i23.PostModel article;

  final _i24.Key? key;

  @override
  String toString() {
    return 'ArticleDetailRouteArgs{article: $article, key: $key}';
  }
}

/// generated route for
/// [_i3.ArticleHistory]
class ArticleHistoryRoute extends _i22.PageRouteInfo<void> {
  const ArticleHistoryRoute({List<_i22.PageRouteInfo>? children})
      : super(
          ArticleHistoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'ArticleHistoryRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i4.ArticleSearchPage]
class ArticleSearchPageRoute extends _i22.PageRouteInfo<void> {
  const ArticleSearchPageRoute({List<_i22.PageRouteInfo>? children})
      : super(
          ArticleSearchPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'ArticleSearchPageRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i5.CameraScreen]
class CameraScreenRoute extends _i22.PageRouteInfo<void> {
  const CameraScreenRoute({List<_i22.PageRouteInfo>? children})
      : super(
          CameraScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'CameraScreenRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i6.CommunityHomePage]
class CommunityHomePageRoute extends _i22.PageRouteInfo<void> {
  const CommunityHomePageRoute({List<_i22.PageRouteInfo>? children})
      : super(
          CommunityHomePageRoute.name,
          initialChildren: children,
        );

  static const String name = 'CommunityHomePageRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i7.DashBoardPage]
class DashBoardPageRoute extends _i22.PageRouteInfo<void> {
  const DashBoardPageRoute({List<_i22.PageRouteInfo>? children})
      : super(
          DashBoardPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashBoardPageRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i8.DonateForm]
class DonateFormRoute extends _i22.PageRouteInfo<void> {
  const DonateFormRoute({List<_i22.PageRouteInfo>? children})
      : super(
          DonateFormRoute.name,
          initialChildren: children,
        );

  static const String name = 'DonateFormRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i9.DonationDescription]
class DonationDescriptionRoute extends _i22.PageRouteInfo<void> {
  const DonationDescriptionRoute({List<_i22.PageRouteInfo>? children})
      : super(
          DonationDescriptionRoute.name,
          initialChildren: children,
        );

  static const String name = 'DonationDescriptionRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i10.DonationRequest]
class DonationRequestRoute extends _i22.PageRouteInfo<void> {
  const DonationRequestRoute({List<_i22.PageRouteInfo>? children})
      : super(
          DonationRequestRoute.name,
          initialChildren: children,
        );

  static const String name = 'DonationRequestRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i11.DonationTrackingPage]
class DonationTrackingPageRoute extends _i22.PageRouteInfo<void> {
  const DonationTrackingPageRoute({List<_i22.PageRouteInfo>? children})
      : super(
          DonationTrackingPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'DonationTrackingPageRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i12.HomePage]
class HomePageRoute extends _i22.PageRouteInfo<HomePageRouteArgs> {
  HomePageRoute({
    _i24.Key? key,
    List<_i22.PageRouteInfo>? children,
  }) : super(
          HomePageRoute.name,
          args: HomePageRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'HomePageRoute';

  static const _i22.PageInfo<HomePageRouteArgs> page =
      _i22.PageInfo<HomePageRouteArgs>(name);
}

class HomePageRouteArgs {
  const HomePageRouteArgs({this.key});

  final _i24.Key? key;

  @override
  String toString() {
    return 'HomePageRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i13.HungerSpot]
class HungerSpotRoute extends _i22.PageRouteInfo<HungerSpotRouteArgs> {
  HungerSpotRoute({
    _i24.Key? key,
    required String child,
    List<_i22.PageRouteInfo>? children,
  }) : super(
          HungerSpotRoute.name,
          args: HungerSpotRouteArgs(
            key: key,
            child: child,
          ),
          initialChildren: children,
        );

  static const String name = 'HungerSpotRoute';

  static const _i22.PageInfo<HungerSpotRouteArgs> page =
      _i22.PageInfo<HungerSpotRouteArgs>(name);
}

class HungerSpotRouteArgs {
  const HungerSpotRouteArgs({
    this.key,
    required this.child,
  });

  final _i24.Key? key;

  final String child;

  @override
  String toString() {
    return 'HungerSpotRouteArgs{key: $key, child: $child}';
  }
}

/// generated route for
/// [_i14.LoginPage]
class LoginPageRoute extends _i22.PageRouteInfo<void> {
  const LoginPageRoute({List<_i22.PageRouteInfo>? children})
      : super(
          LoginPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginPageRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i15.PickUpRequest]
class PickUpRequestRoute extends _i22.PageRouteInfo<void> {
  const PickUpRequestRoute({List<_i22.PageRouteInfo>? children})
      : super(
          PickUpRequestRoute.name,
          initialChildren: children,
        );

  static const String name = 'PickUpRequestRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i16.PostArticle]
class PostArticleRoute extends _i22.PageRouteInfo<PostArticleRouteArgs> {
  PostArticleRoute({
    bool isEdit = false,
    _i23.PostModel? post,
    _i24.Key? key,
    List<_i22.PageRouteInfo>? children,
  }) : super(
          PostArticleRoute.name,
          args: PostArticleRouteArgs(
            isEdit: isEdit,
            post: post,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'PostArticleRoute';

  static const _i22.PageInfo<PostArticleRouteArgs> page =
      _i22.PageInfo<PostArticleRouteArgs>(name);
}

class PostArticleRouteArgs {
  const PostArticleRouteArgs({
    this.isEdit = false,
    this.post,
    this.key,
  });

  final bool isEdit;

  final _i23.PostModel? post;

  final _i24.Key? key;

  @override
  String toString() {
    return 'PostArticleRouteArgs{isEdit: $isEdit, post: $post, key: $key}';
  }
}

/// generated route for
/// [_i17.RaiseRequest]
class RaiseRequestRoute extends _i22.PageRouteInfo<void> {
  const RaiseRequestRoute({List<_i22.PageRouteInfo>? children})
      : super(
          RaiseRequestRoute.name,
          initialChildren: children,
        );

  static const String name = 'RaiseRequestRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i18.RaiseRequest2]
class RaiseRequest2Route extends _i22.PageRouteInfo<void> {
  const RaiseRequest2Route({List<_i22.PageRouteInfo>? children})
      : super(
          RaiseRequest2Route.name,
          initialChildren: children,
        );

  static const String name = 'RaiseRequest2Route';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i19.SignUpPage]
class SignUpPageRoute extends _i22.PageRouteInfo<void> {
  const SignUpPageRoute({List<_i22.PageRouteInfo>? children})
      : super(
          SignUpPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpPageRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i20.SplashScreen]
class SplashScreenRoute extends _i22.PageRouteInfo<void> {
  const SplashScreenRoute({List<_i22.PageRouteInfo>? children})
      : super(
          SplashScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashScreenRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i21.SuccessPage]
class SuccessPageRoute extends _i22.PageRouteInfo<void> {
  const SuccessPageRoute({List<_i22.PageRouteInfo>? children})
      : super(
          SuccessPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'SuccessPageRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}
