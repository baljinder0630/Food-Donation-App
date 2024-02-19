import 'package:auto_route/auto_route.dart';
import 'package:food_donation_app/Pages/DonationRequest/pickupRequestPage.dart';
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
          transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
        ),
        CustomRoute(
          page: LoginPageRoute.page,
          transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
        ),
        CustomRoute(
          page: CommunityHomePageRoute.page,
          transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
        ),
        CustomRoute(
          page: PostArticleRoute.page,
          transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
        ),
        CustomRoute(
          page: DonationRequestRoute.page,
          transitionsBuilder: TransitionsBuilders.slideTop,
        ),
        CustomRoute(
          page: DonationDescriptionRoute.page,
          transitionsBuilder: TransitionsBuilders.slideTop,
        ),
        // CustomRoute(
        //   page: AcceptPickupRequestPageRoute.page,
        //   transitionsBuilder: TransitionsBuilders.slideTop,
        // ),
        CustomRoute(
          page: PickupRequestPageRoute.page,
          transitionsBuilder: TransitionsBuilders.slideTop,
        ),
        CustomRoute(
          page: ArticleDetailRoute.page,
          transitionsBuilder: TransitionsBuilders.slideTop,
        ),
        CustomRoute(
          page: RaiseRequestRoute.page,
          transitionsBuilder: TransitionsBuilders.slideTop,
        ),
        CustomRoute(
          page: RaiseRequest2Route.page,
          transitionsBuilder: TransitionsBuilders.slideLeft,
        ),
        CustomRoute(
          page: CameraScreenRoute.page,
          transitionsBuilder: TransitionsBuilders.slideTop,
        ),
        CustomRoute(
          page: SuccessPageRoute.page,
          transitionsBuilder: TransitionsBuilders.fadeIn,
        ),
        CustomRoute(
          page: DonationTrackingPageRoute.page,
          transitionsBuilder: TransitionsBuilders.slideTop,
        ),
        CustomRoute(
          page: ArticleSearchPageRoute.page,
          transitionsBuilder: TransitionsBuilders.slideLeft,
        ),
        CustomRoute(
          page: ArticleHistoryRoute.page,
          transitionsBuilder: TransitionsBuilders.slideLeft,
        ),
        CustomRoute(
          page: FoodCategoryFormRoute.page,
          transitionsBuilder: TransitionsBuilders.slideLeft,
        ),
        CustomRoute(
            page: ConfirmationFormRoute.page,
            transitionsBuilder: TransitionsBuilders.slideTop),

        CustomRoute(
            page: ChatBotScreenRoute.page,
            transitionsBuilder: TransitionsBuilders.slideTop),
        CustomRoute(
          page: ChatScreenRoute.page,
          transitionsBuilder: TransitionsBuilders.slideLeft,
        ),
        CustomRoute(
          page: ProfileSearchPageRoute.page,
          transitionsBuilder: TransitionsBuilders.slideLeft,
        ),
        CustomRoute(
          page: ChattingPageRoute.page,
          transitionsBuilder: TransitionsBuilders.slideLeft,
        ),
        // CustomRoute(
        //   page: PhoneScreenRoute.page,
        //   transitionsBuilder: TransitionsBuilders.slideLeft,
        // ),
        // CustomRoute(
        //     page: OtpScreenRoute.page,
        //     transitionsBuilder: TransitionsBuilders.slideBottom),
        CustomRoute(
          page: IncomingRequestRoute.page,
          transitionsBuilder: TransitionsBuilders.slideLeft,
        ),
      ];
}
