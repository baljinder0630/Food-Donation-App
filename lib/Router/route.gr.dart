// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i11;
import 'package:food_donation_app/bottomNavBar.dart' as _i1;
import 'package:food_donation_app/Pages/DashBoard/dashBoard.dart' as _i2;
import 'package:food_donation_app/Pages/Donate/donateform.dart' as _i3;
import 'package:food_donation_app/Pages/DonationRequest/donationDescription.dart'
    as _i4;
import 'package:food_donation_app/Pages/DonationRequest/donationRequest.dart'
    as _i5;
import 'package:food_donation_app/Pages/HomePages/hungerSpots.dart' as _i6;
import 'package:food_donation_app/Pages/HomePages/pickupRequest.dart' as _i8;
import 'package:food_donation_app/Pages/Login/login.dart' as _i7;
import 'package:food_donation_app/Pages/Signup/Signup.dart' as _i9;
import 'package:food_donation_app/Pages/SplashScreen/splashScreen.dart' as _i10;

abstract class $AppRouter extends _i11.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i11.PageFactory> pagesMap = {
    AppBottomNavigationBarRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.AppBottomNavigationBar(),
      );
    },
    DashBoardPageRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.DashBoardPage(),
      );
    },
    DonateFormRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.DonateForm(),
      );
    },
    DonationDescriptionRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.DonationDescription(),
      );
    },
    DonationRequestRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.DonationRequest(),
      );
    },
    HungerSpotRoute.name: (routeData) {
      final args = routeData.argsAs<HungerSpotRouteArgs>();
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.HungerSpot(child: args.child),
      );
    },
    LoginPageRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.LoginPage(),
      );
    },
    PickUpReequestRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.PickUpReequest(),
      );
    },
    SignUpPageRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.SignUpPage(),
      );
    },
    SplashScreenRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.SplashScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.AppBottomNavigationBar]
class AppBottomNavigationBarRoute extends _i11.PageRouteInfo<void> {
  const AppBottomNavigationBarRoute({List<_i11.PageRouteInfo>? children})
      : super(
          AppBottomNavigationBarRoute.name,
          initialChildren: children,
        );

  static const String name = 'AppBottomNavigationBarRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i2.DashBoardPage]
class DashBoardPageRoute extends _i11.PageRouteInfo<void> {
  const DashBoardPageRoute({List<_i11.PageRouteInfo>? children})
      : super(
          DashBoardPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashBoardPageRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i3.DonateForm]
class DonateFormRoute extends _i11.PageRouteInfo<void> {
  const DonateFormRoute({List<_i11.PageRouteInfo>? children})
      : super(
          DonateFormRoute.name,
          initialChildren: children,
        );

  static const String name = 'DonateFormRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i4.DonationDescription]
class DonationDescriptionRoute extends _i11.PageRouteInfo<void> {
  const DonationDescriptionRoute({List<_i11.PageRouteInfo>? children})
      : super(
          DonationDescriptionRoute.name,
          initialChildren: children,
        );

  static const String name = 'DonationDescriptionRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i5.DonationRequest]
class DonationRequestRoute extends _i11.PageRouteInfo<void> {
  const DonationRequestRoute({List<_i11.PageRouteInfo>? children})
      : super(
          DonationRequestRoute.name,
          initialChildren: children,
        );

  static const String name = 'DonationRequestRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i6.HungerSpot]
class HungerSpotRoute extends _i11.PageRouteInfo<HungerSpotRouteArgs> {
  HungerSpotRoute({
    required String child,
    List<_i11.PageRouteInfo>? children,
  }) : super(
          HungerSpotRoute.name,
          args: HungerSpotRouteArgs(child: child),
          initialChildren: children,
        );

  static const String name = 'HungerSpotRoute';

  static const _i11.PageInfo<HungerSpotRouteArgs> page =
      _i11.PageInfo<HungerSpotRouteArgs>(name);
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
/// [_i7.LoginPage]
class LoginPageRoute extends _i11.PageRouteInfo<void> {
  const LoginPageRoute({List<_i11.PageRouteInfo>? children})
      : super(
          LoginPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginPageRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i8.PickUpReequest]
class PickUpReequestRoute extends _i11.PageRouteInfo<void> {
  const PickUpReequestRoute({List<_i11.PageRouteInfo>? children})
      : super(
          PickUpReequestRoute.name,
          initialChildren: children,
        );

  static const String name = 'PickUpReequestRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i9.SignUpPage]
class SignUpPageRoute extends _i11.PageRouteInfo<void> {
  const SignUpPageRoute({List<_i11.PageRouteInfo>? children})
      : super(
          SignUpPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpPageRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i10.SplashScreen]
class SplashScreenRoute extends _i11.PageRouteInfo<void> {
  const SplashScreenRoute({List<_i11.PageRouteInfo>? children})
      : super(
          SplashScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashScreenRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}
