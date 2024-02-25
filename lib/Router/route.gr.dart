// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i48;
import 'package:cloud_firestore/cloud_firestore.dart' as _i53;
import 'package:flutter/foundation.dart' as _i54;
import 'package:flutter/material.dart' as _i50;
import 'package:food_donation_app/bottomNavBar.dart' as _i1;
import 'package:food_donation_app/Models/Community/Post.model.dart' as _i49;
import 'package:food_donation_app/Models/User.model.dart' as _i51;
import 'package:food_donation_app/navBar.dart' as _i2;
import 'package:food_donation_app/Pages/addHungerSpot.dart' as _i3;
import 'package:food_donation_app/Pages/ChatBot/chatbotscreen.dart' as _i4;
import 'package:food_donation_app/Pages/Community/allChats.dart' as _i5;
import 'package:food_donation_app/Pages/Community/articleDetail.dart' as _i6;
import 'package:food_donation_app/Pages/Community/articleHistory.dart' as _i7;
import 'package:food_donation_app/Pages/Community/articleSearchPage.dart'
    as _i8;
import 'package:food_donation_app/Pages/Community/chatScreen.dart' as _i9;
import 'package:food_donation_app/Pages/Community/communityScreen.dart' as _i10;
import 'package:food_donation_app/Pages/Community/incomingRequests.dart'
    as _i11;
import 'package:food_donation_app/Pages/Community/postArticle.dart' as _i12;
import 'package:food_donation_app/Pages/Community/profileSearchPage.dart'
    as _i13;
import 'package:food_donation_app/Pages/contributions/conti.dart' as _i14;
import 'package:food_donation_app/Pages/DashBoard/dashBoard.dart' as _i15;
import 'package:food_donation_app/Pages/DisasterNewsFeed/disaster_news_feed.dart'
<<<<<<< HEAD
    as _i16;
import 'package:food_donation_app/Pages/Donate/camera_preview.dart' as _i17;
import 'package:food_donation_app/Pages/Donate/confirmation_form.dart' as _i18;
import 'package:food_donation_app/Pages/Donate/donateform.dart' as _i19;
import 'package:food_donation_app/Pages/Donate/donatefundfood.dart' as _i20;
import 'package:food_donation_app/Pages/Donate/food_category_form.dart' as _i21;
import 'package:food_donation_app/Pages/Donate/otp_screen.dart' as _i22;
import 'package:food_donation_app/Pages/Donate/personal_details_form.dart'
    as _i23;
import 'package:food_donation_app/Pages/Donate/phone_screen.dart' as _i24;
import 'package:food_donation_app/Pages/Donate/razorpay_payment_gateway.dart'
    as _i25;
import 'package:food_donation_app/Pages/Donationland/landdonation.dart' as _i26;
import 'package:food_donation_app/Pages/DonationRequest/acceptPickupRequest.dart'
    as _i27;
import 'package:food_donation_app/Pages/DonationRequest/donationDescription.dart'
    as _i28;
import 'package:food_donation_app/Pages/DonationRequest/donationRequest.dart'
    as _i29;
import 'package:food_donation_app/Pages/DonationRequest/pickupRequestPage.dart'
    as _i30;
import 'package:food_donation_app/Pages/DonationRequest/raiseRequest.dart'
    as _i31;
import 'package:food_donation_app/Pages/DonationRequest/raiseRequest2.dart'
    as _i32;
import 'package:food_donation_app/Pages/DonationRequest/SuccessRequest.dart'
    as _i33;
import 'package:food_donation_app/Pages/DonationRequest/YourDonationRequest.dart'
    as _i34;
import 'package:food_donation_app/Pages/foodStore/data/models/product_model.dart'
    as _i55;
import 'package:food_donation_app/Pages/foodStore/product_item.dart' as _i35;
import 'package:food_donation_app/Pages/foodStore2/foodStore.dart' as _i36;
import 'package:food_donation_app/Pages/foodStore2/foodStoreDescription.dart'
=======
    as _i15;
import 'package:food_donation_app/Pages/Donate/camera_preview.dart' as _i16;
import 'package:food_donation_app/Pages/Donate/confirmation_form.dart' as _i17;
import 'package:food_donation_app/Pages/Donate/donateform.dart' as _i18;
import 'package:food_donation_app/Pages/Donate/donatefundfood.dart' as _i19;
import 'package:food_donation_app/Pages/Donate/food_category_form.dart' as _i20;
import 'package:food_donation_app/Pages/Donate/otp_screen.dart' as _i21;
import 'package:food_donation_app/Pages/Donate/personal_details_form.dart'
    as _i22;
import 'package:food_donation_app/Pages/Donate/phone_screen.dart' as _i23;
import 'package:food_donation_app/Pages/Donate/razorpay_payment_gateway.dart'
    as _i24;
import 'package:food_donation_app/Pages/Donationland/landdonation.dart' as _i25;
import 'package:food_donation_app/Pages/DonationRequest/acceptPickupRequest.dart'
    as _i26;
import 'package:food_donation_app/Pages/DonationRequest/donationDescription.dart'
    as _i27;
import 'package:food_donation_app/Pages/DonationRequest/donationRequest.dart'
    as _i28;
import 'package:food_donation_app/Pages/DonationRequest/pickupRequestPage.dart'
    as _i29;
import 'package:food_donation_app/Pages/DonationRequest/raiseRequest.dart'
    as _i30;
import 'package:food_donation_app/Pages/DonationRequest/raiseRequest2.dart'
    as _i31;
import 'package:food_donation_app/Pages/DonationRequest/SuccessRequest.dart'
    as _i32;
import 'package:food_donation_app/Pages/DonationRequest/YourDonationRequest.dart'
    as _i33;
import 'package:food_donation_app/Pages/foodStore/data/models/product_model.dart'
    as _i55;
import 'package:food_donation_app/Pages/foodStore/product_item.dart' as _i34;
import 'package:food_donation_app/Pages/foodStore2/foodStore.dart' as _i35;
import 'package:food_donation_app/Pages/foodStore2/foodStoreDescription.dart'
    as _i36;
import 'package:food_donation_app/Pages/GovernmentScheme/schemePage.dart'
>>>>>>> origin/master
    as _i37;
import 'package:food_donation_app/Pages/homePage.dart' as _i38;
import 'package:food_donation_app/Pages/HomePages/hungerSpots.dart' as _i39;
import 'package:food_donation_app/Pages/HomePages/pickupRequest.dart' as _i40;
import 'package:food_donation_app/Pages/Login/login.dart' as _i41;
import 'package:food_donation_app/Pages/ngoSearch.dart' as _i42;
import 'package:food_donation_app/Pages/Onboarding/onboarding_screen.dart'
    as _i43;
import 'package:food_donation_app/Pages/Posts/chatScreen.dart' as _i44;
import 'package:food_donation_app/Pages/Posts/PostsHomePage.dart' as _i45;
import 'package:food_donation_app/Pages/Signup/Signup.dart' as _i46;
import 'package:food_donation_app/Pages/SplashScreen/splashScreen.dart' as _i47;
import 'package:geolocator/geolocator.dart' as _i52;

abstract class $AppRouter extends _i48.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i48.PageFactory> pagesMap = {
    AppBottomNavigationBarRoute.name: (routeData) {
      return _i48.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AppBottomNavigationBar(),
      );
    },
    MyNavBarRoute.name: (routeData) {
      return _i48.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.MyNavBar(),
      );
    },
<<<<<<< HEAD
    HungerSpotPageRoute.name: (routeData) {
=======
    ChatBotScreenRoute.name: (routeData) {
>>>>>>> origin/master
      return _i48.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.HungerSpotPage(),
      );
    },
    ChatBotScreenRoute.name: (routeData) {
      return _i48.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.ChatBotScreen(),
      );
    },
    AllChatsPageRoute.name: (routeData) {
      return _i48.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.AllChatsPage(),
      );
    },
    ArticleDetailRoute.name: (routeData) {
      final args = routeData.argsAs<ArticleDetailRouteArgs>();
      return _i48.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.ArticleDetail(
          article: args.article,
          key: args.key,
        ),
      );
    },
    ArticleHistoryRoute.name: (routeData) {
      return _i48.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.ArticleHistory(),
      );
    },
    ArticleSearchPageRoute.name: (routeData) {
      return _i48.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.ArticleSearchPage(),
      );
    },
    ChatScreenRoute.name: (routeData) {
      final args = routeData.argsAs<ChatScreenRouteArgs>();
      return _i48.AutoRoutePage<dynamic>(
        routeData: routeData,
<<<<<<< HEAD
        child: _i9.ChatScreen(
          TargetUser: args.TargetUser,
=======
        child: _i8.ChatScreen(
          targetUser: args.targetUser,
>>>>>>> origin/master
          key: args.key,
        ),
      );
    },
    CommunityHomePageRoute.name: (routeData) {
      return _i48.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.CommunityHomePage(),
      );
    },
    IncomingRequestRoute.name: (routeData) {
      return _i48.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.IncomingRequest(),
      );
    },
    PostArticleRoute.name: (routeData) {
      final args = routeData.argsAs<PostArticleRouteArgs>(
          orElse: () => const PostArticleRouteArgs());
      return _i48.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i12.PostArticle(
          isEdit: args.isEdit,
          post: args.post,
          key: args.key,
        ),
      );
    },
    ProfileSearchPageRoute.name: (routeData) {
      return _i48.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.ProfileSearchPage(),
      );
    },
    ContributionsRoute.name: (routeData) {
      return _i48.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i14.Contributions(),
      );
    },
    DashBoardPageRoute.name: (routeData) {
      return _i48.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i15.DashBoardPage(),
      );
    },
    DisasterNewsFeedPageRoute.name: (routeData) {
      return _i48.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i16.DisasterNewsFeedPage(),
      );
    },
<<<<<<< HEAD
    CameraScreenRoute.name: (routeData) {
      return _i48.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i17.CameraScreen(),
=======
    DisasterNewsFeedPageRoute.name: (routeData) {
      return _i48.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i15.DisasterNewsFeedPage(),
      );
    },
    CameraScreenRoute.name: (routeData) {
      return _i48.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i16.CameraScreen(),
>>>>>>> origin/master
      );
    },
    ConfirmationFormRoute.name: (routeData) {
      return _i48.AutoRoutePage<dynamic>(
        routeData: routeData,
<<<<<<< HEAD
        child: const _i18.ConfirmationForm(),
=======
        child: const _i17.ConfirmationForm(),
>>>>>>> origin/master
      );
    },
    DonateFormRoute.name: (routeData) {
      return _i48.AutoRoutePage<dynamic>(
        routeData: routeData,
<<<<<<< HEAD
        child: const _i19.DonateForm(),
=======
        child: const _i18.DonateForm(),
>>>>>>> origin/master
      );
    },
    LandingDonationRoute.name: (routeData) {
      return _i48.AutoRoutePage<dynamic>(
        routeData: routeData,
<<<<<<< HEAD
        child: const _i20.LandingDonation(),
=======
        child: const _i19.LandingDonation(),
>>>>>>> origin/master
      );
    },
    FoodCategoryFormRoute.name: (routeData) {
      return _i48.AutoRoutePage<dynamic>(
        routeData: routeData,
<<<<<<< HEAD
        child: const _i21.FoodCategoryForm(),
=======
        child: const _i20.FoodCategoryForm(),
>>>>>>> origin/master
      );
    },
    OtpScreenRoute.name: (routeData) {
      final args = routeData.argsAs<OtpScreenRouteArgs>();
      return _i48.AutoRoutePage<dynamic>(
        routeData: routeData,
<<<<<<< HEAD
        child: _i22.OtpScreen(
=======
        child: _i21.OtpScreen(
>>>>>>> origin/master
          key: args.key,
          id: args.id,
        ),
      );
    },
    PersonalDetailsRoute.name: (routeData) {
      return _i48.AutoRoutePage<dynamic>(
        routeData: routeData,
<<<<<<< HEAD
        child: const _i23.PersonalDetails(),
=======
        child: const _i22.PersonalDetails(),
>>>>>>> origin/master
      );
    },
    PhoneScreenRoute.name: (routeData) {
      return _i48.AutoRoutePage<dynamic>(
        routeData: routeData,
<<<<<<< HEAD
        child: const _i24.PhoneScreen(),
=======
        child: const _i23.PhoneScreen(),
>>>>>>> origin/master
      );
    },
    RazorpayPaymentGatewayRoute.name: (routeData) {
      return _i48.AutoRoutePage<dynamic>(
        routeData: routeData,
<<<<<<< HEAD
        child: const _i25.RazorpayPaymentGateway(),
=======
        child: const _i24.RazorpayPaymentGateway(),
>>>>>>> origin/master
      );
    },
    LandDonationRoute.name: (routeData) {
      return _i48.AutoRoutePage<dynamic>(
        routeData: routeData,
<<<<<<< HEAD
        child: const _i26.landDonation(),
=======
        child: const _i25.landDonation(),
>>>>>>> origin/master
      );
    },
    AcceptPickupRequestPageRoute.name: (routeData) {
      final args = routeData.argsAs<AcceptPickupRequestPageRouteArgs>();
      return _i48.AutoRoutePage<dynamic>(
        routeData: routeData,
<<<<<<< HEAD
        child: _i27.AcceptPickupRequestPage(
=======
        child: _i26.AcceptPickupRequestPage(
>>>>>>> origin/master
          foodName: args.foodName,
          postedTime: args.postedTime,
          foodCategory: args.foodCategory,
          address: args.address,
          phoneNumber: args.phoneNumber,
          key: args.key,
        ),
      );
    },
    DonationDescriptionRoute.name: (routeData) {
      final args = routeData.argsAs<DonationDescriptionRouteArgs>();
      return _i48.AutoRoutePage<dynamic>(
        routeData: routeData,
<<<<<<< HEAD
        child: _i28.DonationDescription(
=======
        child: _i27.DonationDescription(
>>>>>>> origin/master
          requestName: args.requestName,
          NGOName: args.NGOName,
          NGOImage: args.NGOImage,
          ngoPosition: args.ngoPosition,
          totalRequest: args.totalRequest,
          completedRequest: args.completedRequest,
          ngoLocation: args.ngoLocation,
          timestamp: args.timestamp,
          description: args.description,
          phoneNumber: args.phoneNumber,
          requestType: args.requestType,
          key: args.key,
        ),
      );
    },
    DonationRequestRoute.name: (routeData) {
      return _i48.AutoRoutePage<dynamic>(
        routeData: routeData,
<<<<<<< HEAD
        child: const _i29.DonationRequest(),
=======
        child: const _i28.DonationRequest(),
>>>>>>> origin/master
      );
    },
    PickupRequestPageRoute.name: (routeData) {
      return _i48.AutoRoutePage<dynamic>(
        routeData: routeData,
<<<<<<< HEAD
        child: const _i30.PickupRequestPage(),
=======
        child: const _i29.PickupRequestPage(),
>>>>>>> origin/master
      );
    },
    RaiseRequestRoute.name: (routeData) {
      return _i48.AutoRoutePage<dynamic>(
        routeData: routeData,
<<<<<<< HEAD
        child: const _i31.RaiseRequest(),
=======
        child: const _i30.RaiseRequest(),
>>>>>>> origin/master
      );
    },
    RaiseRequest2Route.name: (routeData) {
      return _i48.AutoRoutePage<dynamic>(
        routeData: routeData,
<<<<<<< HEAD
        child: const _i32.RaiseRequest2(),
=======
        child: const _i31.RaiseRequest2(),
>>>>>>> origin/master
      );
    },
    SuccessPageRoute.name: (routeData) {
      return _i48.AutoRoutePage<dynamic>(
        routeData: routeData,
<<<<<<< HEAD
        child: const _i33.SuccessPage(),
=======
        child: const _i32.SuccessPage(),
>>>>>>> origin/master
      );
    },
    DonationTrackingPageRoute.name: (routeData) {
      return _i48.AutoRoutePage<dynamic>(
        routeData: routeData,
<<<<<<< HEAD
        child: _i34.DonationTrackingPage(),
=======
        child: _i33.DonationTrackingPage(),
>>>>>>> origin/master
      );
    },
    ProductItemRoute.name: (routeData) {
      final args = routeData.argsAs<ProductItemRouteArgs>();
      return _i48.AutoRoutePage<dynamic>(
        routeData: routeData,
<<<<<<< HEAD
        child: _i35.ProductItem(
=======
        child: _i34.ProductItem(
>>>>>>> origin/master
          key: args.key,
          product: args.product,
        ),
      );
    },
    FoodStoreRoute.name: (routeData) {
      return _i48.AutoRoutePage<dynamic>(
        routeData: routeData,
<<<<<<< HEAD
        child: const _i36.foodStore(),
=======
        child: const _i35.foodStore(),
>>>>>>> origin/master
      );
    },
    FoodStoreDescriptionRoute.name: (routeData) {
      return _i48.AutoRoutePage<dynamic>(
        routeData: routeData,
<<<<<<< HEAD
        child: const _i37.FoodStoreDescription(),
=======
        child: const _i36.FoodStoreDescription(),
      );
    },
    SchemePageRoute.name: (routeData) {
      final args = routeData.argsAs<SchemePageRouteArgs>(
          orElse: () => const SchemePageRouteArgs());
      return _i48.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i37.SchemePage(key: args.key),
>>>>>>> origin/master
      );
    },
    HomePageRoute.name: (routeData) {
      return _i48.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i38.HomePage(),
      );
    },
    HungerSpotRoute.name: (routeData) {
      final args = routeData.argsAs<HungerSpotRouteArgs>();
      return _i48.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i39.HungerSpot(
          key: args.key,
          child: args.child,
        ),
      );
    },
    PickUpRequestRoute.name: (routeData) {
      final args = routeData.argsAs<PickUpRequestRouteArgs>();
      return _i48.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i40.PickUpRequest(
          foodName1: args.foodName1,
          postedTime: args.postedTime,
          foodCategory: args.foodCategory,
          address: args.address,
          snapshot: args.snapshot,
          phoneNumber: args.phoneNumber,
          key: args.key,
        ),
      );
    },
    LoginPageRoute.name: (routeData) {
      return _i48.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i41.LoginPage(),
      );
    },
    NgoSearchPageRoute.name: (routeData) {
      return _i48.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i42.NgoSearchPage(),
      );
    },
    OnBoardingScreenRoute.name: (routeData) {
      return _i48.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i43.OnBoardingScreen(),
      );
    },
    ChattingPageRoute.name: (routeData) {
      return _i48.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i44.ChattingPage(),
      );
    },
    PostHomePageRoute.name: (routeData) {
      return _i48.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i45.PostHomePage(),
      );
    },
    SignUpPageRoute.name: (routeData) {
      return _i48.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i46.SignUpPage(),
      );
    },
    SplashScreenRoute.name: (routeData) {
      return _i48.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i47.SplashScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.AppBottomNavigationBar]
class AppBottomNavigationBarRoute extends _i48.PageRouteInfo<void> {
  const AppBottomNavigationBarRoute({List<_i48.PageRouteInfo>? children})
      : super(
          AppBottomNavigationBarRoute.name,
          initialChildren: children,
        );

  static const String name = 'AppBottomNavigationBarRoute';

  static const _i48.PageInfo<void> page = _i48.PageInfo<void>(name);
}

/// generated route for
/// [_i2.MyNavBar]
class MyNavBarRoute extends _i48.PageRouteInfo<void> {
  const MyNavBarRoute({List<_i48.PageRouteInfo>? children})
      : super(
          MyNavBarRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyNavBarRoute';

  static const _i48.PageInfo<void> page = _i48.PageInfo<void>(name);
}

/// generated route for
<<<<<<< HEAD
/// [_i3.HungerSpotPage]
class HungerSpotPageRoute extends _i48.PageRouteInfo<void> {
  const HungerSpotPageRoute({List<_i48.PageRouteInfo>? children})
      : super(
          HungerSpotPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'HungerSpotPageRoute';

  static const _i48.PageInfo<void> page = _i48.PageInfo<void>(name);
}

/// generated route for
/// [_i4.ChatBotScreen]
=======
/// [_i3.ChatBotScreen]
>>>>>>> origin/master
class ChatBotScreenRoute extends _i48.PageRouteInfo<void> {
  const ChatBotScreenRoute({List<_i48.PageRouteInfo>? children})
      : super(
          ChatBotScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChatBotScreenRoute';

  static const _i48.PageInfo<void> page = _i48.PageInfo<void>(name);
}

/// generated route for
<<<<<<< HEAD
/// [_i5.AllChatsPage]
=======
/// [_i4.AllChatsPage]
>>>>>>> origin/master
class AllChatsPageRoute extends _i48.PageRouteInfo<void> {
  const AllChatsPageRoute({List<_i48.PageRouteInfo>? children})
      : super(
          AllChatsPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'AllChatsPageRoute';

  static const _i48.PageInfo<void> page = _i48.PageInfo<void>(name);
}

/// generated route for
<<<<<<< HEAD
/// [_i6.ArticleDetail]
=======
/// [_i5.ArticleDetail]
>>>>>>> origin/master
class ArticleDetailRoute extends _i48.PageRouteInfo<ArticleDetailRouteArgs> {
  ArticleDetailRoute({
    required _i49.PostModel article,
    _i50.Key? key,
    List<_i48.PageRouteInfo>? children,
  }) : super(
          ArticleDetailRoute.name,
          args: ArticleDetailRouteArgs(
            article: article,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'ArticleDetailRoute';

  static const _i48.PageInfo<ArticleDetailRouteArgs> page =
      _i48.PageInfo<ArticleDetailRouteArgs>(name);
}

class ArticleDetailRouteArgs {
  const ArticleDetailRouteArgs({
    required this.article,
    this.key,
  });

  final _i49.PostModel article;

  final _i50.Key? key;

  @override
  String toString() {
    return 'ArticleDetailRouteArgs{article: $article, key: $key}';
  }
}

/// generated route for
<<<<<<< HEAD
/// [_i7.ArticleHistory]
=======
/// [_i6.ArticleHistory]
>>>>>>> origin/master
class ArticleHistoryRoute extends _i48.PageRouteInfo<void> {
  const ArticleHistoryRoute({List<_i48.PageRouteInfo>? children})
      : super(
          ArticleHistoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'ArticleHistoryRoute';

  static const _i48.PageInfo<void> page = _i48.PageInfo<void>(name);
}

/// generated route for
<<<<<<< HEAD
/// [_i8.ArticleSearchPage]
=======
/// [_i7.ArticleSearchPage]
>>>>>>> origin/master
class ArticleSearchPageRoute extends _i48.PageRouteInfo<void> {
  const ArticleSearchPageRoute({List<_i48.PageRouteInfo>? children})
      : super(
          ArticleSearchPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'ArticleSearchPageRoute';

  static const _i48.PageInfo<void> page = _i48.PageInfo<void>(name);
}

/// generated route for
<<<<<<< HEAD
/// [_i9.ChatScreen]
class ChatScreenRoute extends _i48.PageRouteInfo<ChatScreenRouteArgs> {
  ChatScreenRoute({
    required _i51.UserModel TargetUser,
=======
/// [_i8.ChatScreen]
class ChatScreenRoute extends _i48.PageRouteInfo<ChatScreenRouteArgs> {
  ChatScreenRoute({
    required _i51.UserModel targetUser,
>>>>>>> origin/master
    _i50.Key? key,
    List<_i48.PageRouteInfo>? children,
  }) : super(
          ChatScreenRoute.name,
          args: ChatScreenRouteArgs(
            targetUser: targetUser,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'ChatScreenRoute';

  static const _i48.PageInfo<ChatScreenRouteArgs> page =
      _i48.PageInfo<ChatScreenRouteArgs>(name);
}

class ChatScreenRouteArgs {
  const ChatScreenRouteArgs({
    required this.targetUser,
    this.key,
  });

<<<<<<< HEAD
  final _i51.UserModel TargetUser;
=======
  final _i51.UserModel targetUser;
>>>>>>> origin/master

  final _i50.Key? key;

  @override
  String toString() {
    return 'ChatScreenRouteArgs{targetUser: $targetUser, key: $key}';
  }
}

/// generated route for
<<<<<<< HEAD
/// [_i10.CommunityHomePage]
=======
/// [_i9.CommunityHomePage]
>>>>>>> origin/master
class CommunityHomePageRoute extends _i48.PageRouteInfo<void> {
  const CommunityHomePageRoute({List<_i48.PageRouteInfo>? children})
      : super(
          CommunityHomePageRoute.name,
          initialChildren: children,
        );

  static const String name = 'CommunityHomePageRoute';

  static const _i48.PageInfo<void> page = _i48.PageInfo<void>(name);
}

/// generated route for
<<<<<<< HEAD
/// [_i11.IncomingRequest]
=======
/// [_i10.IncomingRequest]
>>>>>>> origin/master
class IncomingRequestRoute extends _i48.PageRouteInfo<void> {
  const IncomingRequestRoute({List<_i48.PageRouteInfo>? children})
      : super(
          IncomingRequestRoute.name,
          initialChildren: children,
        );

  static const String name = 'IncomingRequestRoute';

  static const _i48.PageInfo<void> page = _i48.PageInfo<void>(name);
}

/// generated route for
<<<<<<< HEAD
/// [_i12.PostArticle]
=======
/// [_i11.PostArticle]
>>>>>>> origin/master
class PostArticleRoute extends _i48.PageRouteInfo<PostArticleRouteArgs> {
  PostArticleRoute({
    bool isEdit = false,
    _i49.PostModel? post,
    _i50.Key? key,
    List<_i48.PageRouteInfo>? children,
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

  static const _i48.PageInfo<PostArticleRouteArgs> page =
      _i48.PageInfo<PostArticleRouteArgs>(name);
}

class PostArticleRouteArgs {
  const PostArticleRouteArgs({
    this.isEdit = false,
    this.post,
    this.key,
  });

  final bool isEdit;

  final _i49.PostModel? post;

  final _i50.Key? key;

  @override
  String toString() {
    return 'PostArticleRouteArgs{isEdit: $isEdit, post: $post, key: $key}';
  }
}

/// generated route for
<<<<<<< HEAD
/// [_i13.ProfileSearchPage]
=======
/// [_i12.ProfileSearchPage]
>>>>>>> origin/master
class ProfileSearchPageRoute extends _i48.PageRouteInfo<void> {
  const ProfileSearchPageRoute({List<_i48.PageRouteInfo>? children})
      : super(
          ProfileSearchPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileSearchPageRoute';

  static const _i48.PageInfo<void> page = _i48.PageInfo<void>(name);
}

/// generated route for
<<<<<<< HEAD
/// [_i14.Contributions]
=======
/// [_i13.Contributions]
>>>>>>> origin/master
class ContributionsRoute extends _i48.PageRouteInfo<void> {
  const ContributionsRoute({List<_i48.PageRouteInfo>? children})
      : super(
          ContributionsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ContributionsRoute';

  static const _i48.PageInfo<void> page = _i48.PageInfo<void>(name);
}

/// generated route for
<<<<<<< HEAD
/// [_i15.DashBoardPage]
=======
/// [_i14.DashBoardPage]
>>>>>>> origin/master
class DashBoardPageRoute extends _i48.PageRouteInfo<void> {
  const DashBoardPageRoute({List<_i48.PageRouteInfo>? children})
      : super(
          DashBoardPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashBoardPageRoute';

  static const _i48.PageInfo<void> page = _i48.PageInfo<void>(name);
}

/// generated route for
<<<<<<< HEAD
/// [_i16.DisasterNewsFeedPage]
=======
/// [_i15.DisasterNewsFeedPage]
>>>>>>> origin/master
class DisasterNewsFeedPageRoute extends _i48.PageRouteInfo<void> {
  const DisasterNewsFeedPageRoute({List<_i48.PageRouteInfo>? children})
      : super(
          DisasterNewsFeedPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'DisasterNewsFeedPageRoute';

  static const _i48.PageInfo<void> page = _i48.PageInfo<void>(name);
}

/// generated route for
<<<<<<< HEAD
/// [_i17.CameraScreen]
=======
/// [_i16.CameraScreen]
>>>>>>> origin/master
class CameraScreenRoute extends _i48.PageRouteInfo<void> {
  const CameraScreenRoute({List<_i48.PageRouteInfo>? children})
      : super(
          CameraScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'CameraScreenRoute';

  static const _i48.PageInfo<void> page = _i48.PageInfo<void>(name);
}

/// generated route for
<<<<<<< HEAD
/// [_i18.ConfirmationForm]
=======
/// [_i17.ConfirmationForm]
>>>>>>> origin/master
class ConfirmationFormRoute extends _i48.PageRouteInfo<void> {
  const ConfirmationFormRoute({List<_i48.PageRouteInfo>? children})
      : super(
          ConfirmationFormRoute.name,
          initialChildren: children,
        );

  static const String name = 'ConfirmationFormRoute';

  static const _i48.PageInfo<void> page = _i48.PageInfo<void>(name);
}

/// generated route for
<<<<<<< HEAD
/// [_i19.DonateForm]
=======
/// [_i18.DonateForm]
>>>>>>> origin/master
class DonateFormRoute extends _i48.PageRouteInfo<void> {
  const DonateFormRoute({List<_i48.PageRouteInfo>? children})
      : super(
          DonateFormRoute.name,
          initialChildren: children,
        );

  static const String name = 'DonateFormRoute';

  static const _i48.PageInfo<void> page = _i48.PageInfo<void>(name);
}

/// generated route for
<<<<<<< HEAD
/// [_i20.LandingDonation]
=======
/// [_i19.LandingDonation]
>>>>>>> origin/master
class LandingDonationRoute extends _i48.PageRouteInfo<void> {
  const LandingDonationRoute({List<_i48.PageRouteInfo>? children})
      : super(
          LandingDonationRoute.name,
          initialChildren: children,
        );

  static const String name = 'LandingDonationRoute';

  static const _i48.PageInfo<void> page = _i48.PageInfo<void>(name);
}

/// generated route for
<<<<<<< HEAD
/// [_i21.FoodCategoryForm]
=======
/// [_i20.FoodCategoryForm]
>>>>>>> origin/master
class FoodCategoryFormRoute extends _i48.PageRouteInfo<void> {
  const FoodCategoryFormRoute({List<_i48.PageRouteInfo>? children})
      : super(
          FoodCategoryFormRoute.name,
          initialChildren: children,
        );

  static const String name = 'FoodCategoryFormRoute';

  static const _i48.PageInfo<void> page = _i48.PageInfo<void>(name);
}

/// generated route for
<<<<<<< HEAD
/// [_i22.OtpScreen]
=======
/// [_i21.OtpScreen]
>>>>>>> origin/master
class OtpScreenRoute extends _i48.PageRouteInfo<OtpScreenRouteArgs> {
  OtpScreenRoute({
    _i50.Key? key,
    required String id,
    List<_i48.PageRouteInfo>? children,
  }) : super(
          OtpScreenRoute.name,
          args: OtpScreenRouteArgs(
            key: key,
            id: id,
          ),
          initialChildren: children,
        );

  static const String name = 'OtpScreenRoute';

  static const _i48.PageInfo<OtpScreenRouteArgs> page =
      _i48.PageInfo<OtpScreenRouteArgs>(name);
}

class OtpScreenRouteArgs {
  const OtpScreenRouteArgs({
    this.key,
    required this.id,
  });

  final _i50.Key? key;

  final String id;

  @override
  String toString() {
    return 'OtpScreenRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
<<<<<<< HEAD
/// [_i23.PersonalDetails]
=======
/// [_i22.PersonalDetails]
>>>>>>> origin/master
class PersonalDetailsRoute extends _i48.PageRouteInfo<void> {
  const PersonalDetailsRoute({List<_i48.PageRouteInfo>? children})
      : super(
          PersonalDetailsRoute.name,
          initialChildren: children,
        );

  static const String name = 'PersonalDetailsRoute';

  static const _i48.PageInfo<void> page = _i48.PageInfo<void>(name);
}

/// generated route for
<<<<<<< HEAD
/// [_i24.PhoneScreen]
=======
/// [_i23.PhoneScreen]
>>>>>>> origin/master
class PhoneScreenRoute extends _i48.PageRouteInfo<void> {
  const PhoneScreenRoute({List<_i48.PageRouteInfo>? children})
      : super(
          PhoneScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'PhoneScreenRoute';

  static const _i48.PageInfo<void> page = _i48.PageInfo<void>(name);
}

/// generated route for
<<<<<<< HEAD
/// [_i25.RazorpayPaymentGateway]
=======
/// [_i24.RazorpayPaymentGateway]
>>>>>>> origin/master
class RazorpayPaymentGatewayRoute extends _i48.PageRouteInfo<void> {
  const RazorpayPaymentGatewayRoute({List<_i48.PageRouteInfo>? children})
      : super(
          RazorpayPaymentGatewayRoute.name,
          initialChildren: children,
        );

  static const String name = 'RazorpayPaymentGatewayRoute';

  static const _i48.PageInfo<void> page = _i48.PageInfo<void>(name);
}

/// generated route for
<<<<<<< HEAD
/// [_i26.landDonation]
=======
/// [_i25.landDonation]
>>>>>>> origin/master
class LandDonationRoute extends _i48.PageRouteInfo<void> {
  const LandDonationRoute({List<_i48.PageRouteInfo>? children})
      : super(
          LandDonationRoute.name,
          initialChildren: children,
        );

  static const String name = 'LandDonationRoute';

  static const _i48.PageInfo<void> page = _i48.PageInfo<void>(name);
}

/// generated route for
<<<<<<< HEAD
/// [_i27.AcceptPickupRequestPage]
=======
/// [_i26.AcceptPickupRequestPage]
>>>>>>> origin/master
class AcceptPickupRequestPageRoute
    extends _i48.PageRouteInfo<AcceptPickupRequestPageRouteArgs> {
  AcceptPickupRequestPageRoute({
    required String foodName,
    required String postedTime,
    required List<dynamic> foodCategory,
    required String address,
    required String phoneNumber,
    _i50.Key? key,
    List<_i48.PageRouteInfo>? children,
  }) : super(
          AcceptPickupRequestPageRoute.name,
          args: AcceptPickupRequestPageRouteArgs(
            foodName: foodName,
            postedTime: postedTime,
            foodCategory: foodCategory,
            address: address,
            phoneNumber: phoneNumber,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'AcceptPickupRequestPageRoute';

  static const _i48.PageInfo<AcceptPickupRequestPageRouteArgs> page =
      _i48.PageInfo<AcceptPickupRequestPageRouteArgs>(name);
}

class AcceptPickupRequestPageRouteArgs {
  const AcceptPickupRequestPageRouteArgs({
    required this.foodName,
    required this.postedTime,
    required this.foodCategory,
    required this.address,
    required this.phoneNumber,
    this.key,
  });

  final String foodName;

  final String postedTime;

  final List<dynamic> foodCategory;

  final String address;

  final String phoneNumber;

  final _i50.Key? key;

  @override
  String toString() {
    return 'AcceptPickupRequestPageRouteArgs{foodName: $foodName, postedTime: $postedTime, foodCategory: $foodCategory, address: $address, phoneNumber: $phoneNumber, key: $key}';
  }
}

/// generated route for
<<<<<<< HEAD
/// [_i28.DonationDescription]
=======
/// [_i27.DonationDescription]
>>>>>>> origin/master
class DonationDescriptionRoute
    extends _i48.PageRouteInfo<DonationDescriptionRouteArgs> {
  DonationDescriptionRoute({
    required String requestName,
    required String NGOName,
    required String NGOImage,
    required _i52.Position ngoPosition,
    required String totalRequest,
    required String completedRequest,
    required String ngoLocation,
    required _i53.Timestamp timestamp,
    required String description,
    required String phoneNumber,
    required String requestType,
    _i54.Key? key,
    List<_i48.PageRouteInfo>? children,
  }) : super(
          DonationDescriptionRoute.name,
          args: DonationDescriptionRouteArgs(
            requestName: requestName,
            NGOName: NGOName,
            NGOImage: NGOImage,
            ngoPosition: ngoPosition,
            totalRequest: totalRequest,
            completedRequest: completedRequest,
            ngoLocation: ngoLocation,
            timestamp: timestamp,
            description: description,
            phoneNumber: phoneNumber,
            requestType: requestType,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'DonationDescriptionRoute';

  static const _i48.PageInfo<DonationDescriptionRouteArgs> page =
      _i48.PageInfo<DonationDescriptionRouteArgs>(name);
}

class DonationDescriptionRouteArgs {
  const DonationDescriptionRouteArgs({
    required this.requestName,
    required this.NGOName,
    required this.NGOImage,
    required this.ngoPosition,
    required this.totalRequest,
    required this.completedRequest,
    required this.ngoLocation,
    required this.timestamp,
    required this.description,
    required this.phoneNumber,
    required this.requestType,
    this.key,
  });

  final String requestName;

  final String NGOName;

  final String NGOImage;

  final _i52.Position ngoPosition;

  final String totalRequest;

  final String completedRequest;

  final String ngoLocation;

  final _i53.Timestamp timestamp;

  final String description;

  final String phoneNumber;

  final String requestType;

  final _i54.Key? key;

  @override
  String toString() {
    return 'DonationDescriptionRouteArgs{requestName: $requestName, NGOName: $NGOName, NGOImage: $NGOImage, ngoPosition: $ngoPosition, totalRequest: $totalRequest, completedRequest: $completedRequest, ngoLocation: $ngoLocation, timestamp: $timestamp, description: $description, phoneNumber: $phoneNumber, requestType: $requestType, key: $key}';
  }
}

/// generated route for
<<<<<<< HEAD
/// [_i29.DonationRequest]
=======
/// [_i28.DonationRequest]
>>>>>>> origin/master
class DonationRequestRoute extends _i48.PageRouteInfo<void> {
  const DonationRequestRoute({List<_i48.PageRouteInfo>? children})
      : super(
          DonationRequestRoute.name,
          initialChildren: children,
        );

  static const String name = 'DonationRequestRoute';

  static const _i48.PageInfo<void> page = _i48.PageInfo<void>(name);
}

/// generated route for
<<<<<<< HEAD
/// [_i30.PickupRequestPage]
=======
/// [_i29.PickupRequestPage]
>>>>>>> origin/master
class PickupRequestPageRoute extends _i48.PageRouteInfo<void> {
  const PickupRequestPageRoute({List<_i48.PageRouteInfo>? children})
      : super(
          PickupRequestPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'PickupRequestPageRoute';

  static const _i48.PageInfo<void> page = _i48.PageInfo<void>(name);
}

/// generated route for
<<<<<<< HEAD
/// [_i31.RaiseRequest]
=======
/// [_i30.RaiseRequest]
>>>>>>> origin/master
class RaiseRequestRoute extends _i48.PageRouteInfo<void> {
  const RaiseRequestRoute({List<_i48.PageRouteInfo>? children})
      : super(
          RaiseRequestRoute.name,
          initialChildren: children,
        );

  static const String name = 'RaiseRequestRoute';

  static const _i48.PageInfo<void> page = _i48.PageInfo<void>(name);
}

/// generated route for
<<<<<<< HEAD
/// [_i32.RaiseRequest2]
=======
/// [_i31.RaiseRequest2]
>>>>>>> origin/master
class RaiseRequest2Route extends _i48.PageRouteInfo<void> {
  const RaiseRequest2Route({List<_i48.PageRouteInfo>? children})
      : super(
          RaiseRequest2Route.name,
          initialChildren: children,
        );

  static const String name = 'RaiseRequest2Route';

  static const _i48.PageInfo<void> page = _i48.PageInfo<void>(name);
}

/// generated route for
<<<<<<< HEAD
/// [_i33.SuccessPage]
=======
/// [_i32.SuccessPage]
>>>>>>> origin/master
class SuccessPageRoute extends _i48.PageRouteInfo<void> {
  const SuccessPageRoute({List<_i48.PageRouteInfo>? children})
      : super(
          SuccessPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'SuccessPageRoute';

  static const _i48.PageInfo<void> page = _i48.PageInfo<void>(name);
}

/// generated route for
<<<<<<< HEAD
/// [_i34.DonationTrackingPage]
=======
/// [_i33.DonationTrackingPage]
>>>>>>> origin/master
class DonationTrackingPageRoute extends _i48.PageRouteInfo<void> {
  const DonationTrackingPageRoute({List<_i48.PageRouteInfo>? children})
      : super(
          DonationTrackingPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'DonationTrackingPageRoute';

  static const _i48.PageInfo<void> page = _i48.PageInfo<void>(name);
}

/// generated route for
<<<<<<< HEAD
/// [_i35.ProductItem]
=======
/// [_i34.ProductItem]
>>>>>>> origin/master
class ProductItemRoute extends _i48.PageRouteInfo<ProductItemRouteArgs> {
  ProductItemRoute({
    _i50.Key? key,
    required _i55.ProductModel product,
    List<_i48.PageRouteInfo>? children,
  }) : super(
          ProductItemRoute.name,
          args: ProductItemRouteArgs(
            key: key,
            product: product,
          ),
          initialChildren: children,
        );

  static const String name = 'ProductItemRoute';

  static const _i48.PageInfo<ProductItemRouteArgs> page =
      _i48.PageInfo<ProductItemRouteArgs>(name);
}

class ProductItemRouteArgs {
  const ProductItemRouteArgs({
    this.key,
    required this.product,
  });

  final _i50.Key? key;

  final _i55.ProductModel product;

  @override
  String toString() {
    return 'ProductItemRouteArgs{key: $key, product: $product}';
  }
}

/// generated route for
<<<<<<< HEAD
/// [_i36.foodStore]
=======
/// [_i35.foodStore]
>>>>>>> origin/master
class FoodStoreRoute extends _i48.PageRouteInfo<void> {
  const FoodStoreRoute({List<_i48.PageRouteInfo>? children})
      : super(
          FoodStoreRoute.name,
          initialChildren: children,
        );

  static const String name = 'FoodStoreRoute';

  static const _i48.PageInfo<void> page = _i48.PageInfo<void>(name);
}

/// generated route for
<<<<<<< HEAD
/// [_i37.FoodStoreDescription]
=======
/// [_i36.FoodStoreDescription]
>>>>>>> origin/master
class FoodStoreDescriptionRoute extends _i48.PageRouteInfo<void> {
  const FoodStoreDescriptionRoute({List<_i48.PageRouteInfo>? children})
      : super(
          FoodStoreDescriptionRoute.name,
          initialChildren: children,
        );

  static const String name = 'FoodStoreDescriptionRoute';

  static const _i48.PageInfo<void> page = _i48.PageInfo<void>(name);
}

/// generated route for
<<<<<<< HEAD
=======
/// [_i37.SchemePage]
class SchemePageRoute extends _i48.PageRouteInfo<SchemePageRouteArgs> {
  SchemePageRoute({
    _i50.Key? key,
    List<_i48.PageRouteInfo>? children,
  }) : super(
          SchemePageRoute.name,
          args: SchemePageRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'SchemePageRoute';

  static const _i48.PageInfo<SchemePageRouteArgs> page =
      _i48.PageInfo<SchemePageRouteArgs>(name);
}

class SchemePageRouteArgs {
  const SchemePageRouteArgs({this.key});

  final _i50.Key? key;

  @override
  String toString() {
    return 'SchemePageRouteArgs{key: $key}';
  }
}

/// generated route for
>>>>>>> origin/master
/// [_i38.HomePage]
class HomePageRoute extends _i48.PageRouteInfo<void> {
  const HomePageRoute({List<_i48.PageRouteInfo>? children})
      : super(
          HomePageRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomePageRoute';

  static const _i48.PageInfo<void> page = _i48.PageInfo<void>(name);
}

/// generated route for
/// [_i39.HungerSpot]
class HungerSpotRoute extends _i48.PageRouteInfo<HungerSpotRouteArgs> {
  HungerSpotRoute({
    _i50.Key? key,
    required String child,
    List<_i48.PageRouteInfo>? children,
  }) : super(
          HungerSpotRoute.name,
          args: HungerSpotRouteArgs(
            key: key,
            child: child,
          ),
          initialChildren: children,
        );

  static const String name = 'HungerSpotRoute';

  static const _i48.PageInfo<HungerSpotRouteArgs> page =
      _i48.PageInfo<HungerSpotRouteArgs>(name);
}

class HungerSpotRouteArgs {
  const HungerSpotRouteArgs({
    this.key,
    required this.child,
  });

  final _i50.Key? key;

  final String child;

  @override
  String toString() {
    return 'HungerSpotRouteArgs{key: $key, child: $child}';
  }
}

/// generated route for
/// [_i40.PickUpRequest]
class PickUpRequestRoute extends _i48.PageRouteInfo<PickUpRequestRouteArgs> {
  PickUpRequestRoute({
    required String foodName1,
    required String postedTime,
    required List<dynamic> foodCategory,
    required String address,
    required _i50.AsyncSnapshot<_i53.QuerySnapshot<Object?>>? snapshot,
    required String phoneNumber,
    _i50.Key? key,
    List<_i48.PageRouteInfo>? children,
  }) : super(
          PickUpRequestRoute.name,
          args: PickUpRequestRouteArgs(
            foodName1: foodName1,
            postedTime: postedTime,
            foodCategory: foodCategory,
            address: address,
            snapshot: snapshot,
            phoneNumber: phoneNumber,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'PickUpRequestRoute';

  static const _i48.PageInfo<PickUpRequestRouteArgs> page =
      _i48.PageInfo<PickUpRequestRouteArgs>(name);
}

class PickUpRequestRouteArgs {
  const PickUpRequestRouteArgs({
    required this.foodName1,
    required this.postedTime,
    required this.foodCategory,
    required this.address,
    required this.snapshot,
    required this.phoneNumber,
    this.key,
  });

  final String foodName1;

  final String postedTime;

  final List<dynamic> foodCategory;

  final String address;

  final _i50.AsyncSnapshot<_i53.QuerySnapshot<Object?>>? snapshot;

  final String phoneNumber;

  final _i50.Key? key;

  @override
  String toString() {
    return 'PickUpRequestRouteArgs{foodName1: $foodName1, postedTime: $postedTime, foodCategory: $foodCategory, address: $address, snapshot: $snapshot, phoneNumber: $phoneNumber, key: $key}';
  }
}

/// generated route for
/// [_i41.LoginPage]
class LoginPageRoute extends _i48.PageRouteInfo<void> {
  const LoginPageRoute({List<_i48.PageRouteInfo>? children})
      : super(
          LoginPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginPageRoute';

  static const _i48.PageInfo<void> page = _i48.PageInfo<void>(name);
}

/// generated route for
/// [_i42.NgoSearchPage]
class NgoSearchPageRoute extends _i48.PageRouteInfo<void> {
  const NgoSearchPageRoute({List<_i48.PageRouteInfo>? children})
      : super(
          NgoSearchPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'NgoSearchPageRoute';

  static const _i48.PageInfo<void> page = _i48.PageInfo<void>(name);
}

/// generated route for
/// [_i43.OnBoardingScreen]
class OnBoardingScreenRoute extends _i48.PageRouteInfo<void> {
  const OnBoardingScreenRoute({List<_i48.PageRouteInfo>? children})
      : super(
          OnBoardingScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnBoardingScreenRoute';

  static const _i48.PageInfo<void> page = _i48.PageInfo<void>(name);
}

/// generated route for
/// [_i44.ChattingPage]
class ChattingPageRoute extends _i48.PageRouteInfo<void> {
  const ChattingPageRoute({List<_i48.PageRouteInfo>? children})
      : super(
          ChattingPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChattingPageRoute';

  static const _i48.PageInfo<void> page = _i48.PageInfo<void>(name);
}

/// generated route for
/// [_i45.PostHomePage]
class PostHomePageRoute extends _i48.PageRouteInfo<void> {
  const PostHomePageRoute({List<_i48.PageRouteInfo>? children})
      : super(
          PostHomePageRoute.name,
          initialChildren: children,
        );

  static const String name = 'PostHomePageRoute';

  static const _i48.PageInfo<void> page = _i48.PageInfo<void>(name);
}

/// generated route for
/// [_i46.SignUpPage]
class SignUpPageRoute extends _i48.PageRouteInfo<void> {
  const SignUpPageRoute({List<_i48.PageRouteInfo>? children})
      : super(
          SignUpPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpPageRoute';

  static const _i48.PageInfo<void> page = _i48.PageInfo<void>(name);
}

/// generated route for
/// [_i47.SplashScreen]
class SplashScreenRoute extends _i48.PageRouteInfo<void> {
  const SplashScreenRoute({List<_i48.PageRouteInfo>? children})
      : super(
          SplashScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashScreenRoute';

  static const _i48.PageInfo<void> page = _i48.PageInfo<void>(name);
}
