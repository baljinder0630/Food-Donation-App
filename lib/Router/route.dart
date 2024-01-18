import 'package:auto_route/auto_route.dart';
import 'package:food_donation_app/Router/route.gr.dart';

@AutoRouterConfig(replaceInRouteName: "Route")
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        CustomRoute(
          page: SplashScreenRoute.page,
          path: "/",
          transitionsBuilder: TransitionsBuilders.fadeIn,
        ),
        CustomRoute(
          page: AppBottomNavigationBarRoute.page,
          path: "/home",
          transitionsBuilder: TransitionsBuilders.fadeIn,
        ),
        CustomRoute(
          page: DashBoardPageRoute.page,
          path: "/dashboard",
          transitionsBuilder: TransitionsBuilders.fadeIn,
        ),
        CustomRoute(
          page: SignUpPageRoute.page,
          path: "/signup",
          transitionsBuilder: TransitionsBuilders.slideTop,
        ),
        CustomRoute(
          page: LoginPageRoute.page,
          transitionsBuilder: TransitionsBuilders.slideTop,
        ),
        CustomRoute(
          page: DonationRequestRoute.page,
          transitionsBuilder: TransitionsBuilders.slideTop,
        ),
      ];
}
