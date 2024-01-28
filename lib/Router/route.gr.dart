// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i24;
import 'package:flutter/foundation.dart' as _i27;
import 'package:flutter/material.dart' as _i26;
import 'package:food_donation_app/bottom_nav_bar.dart' as _i1;
import 'package:food_donation_app/Models/Post.model.dart' as _i25;
import 'package:food_donation_app/Pages/Community/articleDetail.dart' as _i2;
import 'package:food_donation_app/Pages/Community/communityScreen.dart' as _i4;
import 'package:food_donation_app/Pages/Community/postArticle.dart' as _i17;
import 'package:food_donation_app/Pages/DashBoard/dashBoard.dart' as _i6;
import 'package:food_donation_app/Pages/Donate/camera_preview.dart' as _i3;
import 'package:food_donation_app/Pages/Donate/confirmation_form.dart' as _i5;
import 'package:food_donation_app/Pages/Donate/food_category_form.dart' as _i10;
import 'package:food_donation_app/Pages/Donate/otp_screen.dart' as _i14;
import 'package:food_donation_app/Pages/Donate/personal_details_form.dart'
    as _i15;
import 'package:food_donation_app/Pages/Donate/razorpay_payment_gateway.dart'
    as _i20;
import 'package:food_donation_app/Pages/DonationRequest/donation_description.dart'
    as _i7;
import 'package:food_donation_app/Pages/DonationRequest/donation_request.dart'
    as _i8;
import 'package:food_donation_app/Pages/DonationRequest/raise_request.dart'
    as _i18;
import 'package:food_donation_app/Pages/DonationRequest/raise_request2.dart'
    as _i19;
import 'package:food_donation_app/Pages/DonationRequest/success_request.dart'
    as _i23;
import 'package:food_donation_app/Pages/DonationRequest/your_donation_request.dart'
    as _i9;
import 'package:food_donation_app/Pages/homePage.dart' as _i11;
import 'package:food_donation_app/Pages/HomePages/hungerSpots.dart' as _i12;
import 'package:food_donation_app/Pages/HomePages/pickupRequest.dart' as _i16;
import 'package:food_donation_app/Pages/Login/login.dart' as _i13;
import 'package:food_donation_app/Pages/Signup/Signup.dart' as _i21;
import 'package:food_donation_app/Pages/SplashScreen/splashScreen.dart' as _i22;

abstract class $AppRouter extends _i24.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i24.PageFactory> pagesMap = {
    AppBottomNavigationBarRoute.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.AppBottomNavigationBar(),
      );
    },
    ArticleDetailRoute.name: (routeData) {
      final args = routeData.argsAs<ArticleDetailRouteArgs>();
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.ArticleDetail(
          article: args.article,
          key: args.key,
        ),
      );
    },
    CameraScreenRoute.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.CameraScreen(),
      );
    },
    CommunityHomePageRoute.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.CommunityHomePage(),
      );
    },
    ConfirmationFormRoute.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.ConfirmationForm(),
      );
    },
    DashBoardPageRoute.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.DashBoardPage(),
      );
    },
    DonationDescriptionRoute.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.DonationDescription(),
      );
    },
    DonationRequestRoute.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.DonationRequest(),
      );
    },
    DonationTrackingPageRoute.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.DonationTrackingPage(),
      );
    },
    FoodCategoryFormRoute.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.FoodCategoryForm(),
      );
    },
    HomePageRoute.name: (routeData) {
      final args = routeData.argsAs<HomePageRouteArgs>(
          orElse: () => const HomePageRouteArgs());
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i11.HomePage(key: args.key),
      );
    },
    HungerSpotRoute.name: (routeData) {
      final args = routeData.argsAs<HungerSpotRouteArgs>();
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i12.HungerSpot(
          key: args.key,
          child: args.child,
        ),
      );
    },
    LoginPageRoute.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.LoginPage(),
      );
    },
    OtpScreenRoute.name: (routeData) {
      final args = routeData.argsAs<OtpScreenRouteArgs>();
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i14.OtpScreen(
          key: args.key,
          id: args.id,
        ),
      );
    },
    PersonalDetailsRoute.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i15.PersonalDetails(),
      );
    },
    PickUpRequestRoute.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i16.PickUpRequest(),
      );
    },
    PostArticleRoute.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i17.PostArticle(),
      );
    },
    RaiseRequestRoute.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i18.RaiseRequest(),
      );
    },
    RaiseRequest2Route.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i19.RaiseRequest2(),
      );
    },
    RazorpayPaymentGatewayRoute.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i20.RazorpayPaymentGateway(),
      );
    },
    SignUpPageRoute.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i21.SignUpPage(),
      );
    },
    SplashScreenRoute.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i22.SplashScreen(),
      );
    },
    SuccessPageRoute.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i23.SuccessPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.AppBottomNavigationBar]
class AppBottomNavigationBarRoute extends _i24.PageRouteInfo<void> {
  const AppBottomNavigationBarRoute({List<_i24.PageRouteInfo>? children})
      : super(
          AppBottomNavigationBarRoute.name,
          initialChildren: children,
        );

  static const String name = 'AppBottomNavigationBarRoute';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i2.ArticleDetail]
class ArticleDetailRoute extends _i24.PageRouteInfo<ArticleDetailRouteArgs> {
  ArticleDetailRoute({
    required _i25.PostModel article,
    _i26.Key? key,
    List<_i24.PageRouteInfo>? children,
  }) : super(
          ArticleDetailRoute.name,
          args: ArticleDetailRouteArgs(
            article: article,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'ArticleDetailRoute';

  static const _i24.PageInfo<ArticleDetailRouteArgs> page =
      _i24.PageInfo<ArticleDetailRouteArgs>(name);
}

class ArticleDetailRouteArgs {
  const ArticleDetailRouteArgs({
    required this.article,
    this.key,
  });

  final _i25.PostModel article;

  final _i26.Key? key;

  @override
  String toString() {
    return 'ArticleDetailRouteArgs{article: $article, key: $key}';
  }
}

/// generated route for
/// [_i3.CameraScreen]
class CameraScreenRoute extends _i24.PageRouteInfo<void> {
  const CameraScreenRoute({List<_i24.PageRouteInfo>? children})
      : super(
          CameraScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'CameraScreenRoute';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i4.CommunityHomePage]
class CommunityHomePageRoute extends _i24.PageRouteInfo<void> {
  const CommunityHomePageRoute({List<_i24.PageRouteInfo>? children})
      : super(
          CommunityHomePageRoute.name,
          initialChildren: children,
        );

  static const String name = 'CommunityHomePageRoute';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i5.ConfirmationForm]
class ConfirmationFormRoute extends _i24.PageRouteInfo<void> {
  const ConfirmationFormRoute({List<_i24.PageRouteInfo>? children})
      : super(
          ConfirmationFormRoute.name,
          initialChildren: children,
        );

  static const String name = 'ConfirmationFormRoute';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i6.DashBoardPage]
class DashBoardPageRoute extends _i24.PageRouteInfo<void> {
  const DashBoardPageRoute({List<_i24.PageRouteInfo>? children})
      : super(
          DashBoardPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashBoardPageRoute';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i7.DonationDescription]
class DonationDescriptionRoute extends _i24.PageRouteInfo<void> {
  const DonationDescriptionRoute({List<_i24.PageRouteInfo>? children})
      : super(
          DonationDescriptionRoute.name,
          initialChildren: children,
        );

  static const String name = 'DonationDescriptionRoute';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i8.DonationRequest]
class DonationRequestRoute extends _i24.PageRouteInfo<void> {
  const DonationRequestRoute({List<_i24.PageRouteInfo>? children})
      : super(
          DonationRequestRoute.name,
          initialChildren: children,
        );

  static const String name = 'DonationRequestRoute';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i9.DonationTrackingPage]
class DonationTrackingPageRoute extends _i24.PageRouteInfo<void> {
  const DonationTrackingPageRoute({List<_i24.PageRouteInfo>? children})
      : super(
          DonationTrackingPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'DonationTrackingPageRoute';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i10.FoodCategoryForm]
class FoodCategoryFormRoute extends _i24.PageRouteInfo<void> {
  const FoodCategoryFormRoute({List<_i24.PageRouteInfo>? children})
      : super(
          FoodCategoryFormRoute.name,
          initialChildren: children,
        );

  static const String name = 'FoodCategoryFormRoute';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i11.HomePage]
class HomePageRoute extends _i24.PageRouteInfo<HomePageRouteArgs> {
  HomePageRoute({
    _i26.Key? key,
    List<_i24.PageRouteInfo>? children,
  }) : super(
          HomePageRoute.name,
          args: HomePageRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'HomePageRoute';

  static const _i24.PageInfo<HomePageRouteArgs> page =
      _i24.PageInfo<HomePageRouteArgs>(name);
}

class HomePageRouteArgs {
  const HomePageRouteArgs({this.key});

  final _i26.Key? key;

  @override
  String toString() {
    return 'HomePageRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i12.HungerSpot]
class HungerSpotRoute extends _i24.PageRouteInfo<HungerSpotRouteArgs> {
  HungerSpotRoute({
    _i26.Key? key,
    required String child,
    List<_i24.PageRouteInfo>? children,
  }) : super(
          HungerSpotRoute.name,
          args: HungerSpotRouteArgs(
            key: key,
            child: child,
          ),
          initialChildren: children,
        );

  static const String name = 'HungerSpotRoute';

  static const _i24.PageInfo<HungerSpotRouteArgs> page =
      _i24.PageInfo<HungerSpotRouteArgs>(name);
}

class HungerSpotRouteArgs {
  const HungerSpotRouteArgs({
    this.key,
    required this.child,
  });

  final _i26.Key? key;

  final String child;

  @override
  String toString() {
    return 'HungerSpotRouteArgs{key: $key, child: $child}';
  }
}

/// generated route for
/// [_i13.LoginPage]
class LoginPageRoute extends _i24.PageRouteInfo<void> {
  const LoginPageRoute({List<_i24.PageRouteInfo>? children})
      : super(
          LoginPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginPageRoute';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i14.OtpScreen]
class OtpScreenRoute extends _i24.PageRouteInfo<OtpScreenRouteArgs> {
  OtpScreenRoute({
    _i27.Key? key,
    required String id,
    List<_i24.PageRouteInfo>? children,
  }) : super(
          OtpScreenRoute.name,
          args: OtpScreenRouteArgs(
            key: key,
            id: id,
          ),
          initialChildren: children,
        );

  static const String name = 'OtpScreenRoute';

  static const _i24.PageInfo<OtpScreenRouteArgs> page =
      _i24.PageInfo<OtpScreenRouteArgs>(name);
}

class OtpScreenRouteArgs {
  const OtpScreenRouteArgs({
    this.key,
    required this.id,
  });

  final _i27.Key? key;

  final String id;

  @override
  String toString() {
    return 'OtpScreenRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i15.PersonalDetails]
class PersonalDetailsRoute extends _i24.PageRouteInfo<void> {
  const PersonalDetailsRoute({List<_i24.PageRouteInfo>? children})
      : super(
          PersonalDetailsRoute.name,
          initialChildren: children,
        );

  static const String name = 'PersonalDetailsRoute';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i16.PickUpRequest]
class PickUpRequestRoute extends _i24.PageRouteInfo<void> {
  const PickUpRequestRoute({List<_i24.PageRouteInfo>? children})
      : super(
          PickUpRequestRoute.name,
          initialChildren: children,
        );

  static const String name = 'PickUpRequestRoute';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i17.PostArticle]
class PostArticleRoute extends _i24.PageRouteInfo<void> {
  const PostArticleRoute({List<_i24.PageRouteInfo>? children})
      : super(
          PostArticleRoute.name,
          initialChildren: children,
        );

  static const String name = 'PostArticleRoute';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i18.RaiseRequest]
class RaiseRequestRoute extends _i24.PageRouteInfo<void> {
  const RaiseRequestRoute({List<_i24.PageRouteInfo>? children})
      : super(
          RaiseRequestRoute.name,
          initialChildren: children,
        );

  static const String name = 'RaiseRequestRoute';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i19.RaiseRequest2]
class RaiseRequest2Route extends _i24.PageRouteInfo<void> {
  const RaiseRequest2Route({List<_i24.PageRouteInfo>? children})
      : super(
          RaiseRequest2Route.name,
          initialChildren: children,
        );

  static const String name = 'RaiseRequest2Route';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i20.RazorpayPaymentGateway]
class RazorpayPaymentGatewayRoute extends _i24.PageRouteInfo<void> {
  const RazorpayPaymentGatewayRoute({List<_i24.PageRouteInfo>? children})
      : super(
          RazorpayPaymentGatewayRoute.name,
          initialChildren: children,
        );

  static const String name = 'RazorpayPaymentGatewayRoute';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i21.SignUpPage]
class SignUpPageRoute extends _i24.PageRouteInfo<void> {
  const SignUpPageRoute({List<_i24.PageRouteInfo>? children})
      : super(
          SignUpPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpPageRoute';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i22.SplashScreen]
class SplashScreenRoute extends _i24.PageRouteInfo<void> {
  const SplashScreenRoute({List<_i24.PageRouteInfo>? children})
      : super(
          SplashScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashScreenRoute';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i23.SuccessPage]
class SuccessPageRoute extends _i24.PageRouteInfo<void> {
  const SuccessPageRoute({List<_i24.PageRouteInfo>? children})
      : super(
          SuccessPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'SuccessPageRoute';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}
