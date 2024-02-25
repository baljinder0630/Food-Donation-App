import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_donation_app/Pages/Onboarding/onboarding_screens/intro_screen1.dart';
import 'package:food_donation_app/Pages/Onboarding/onboarding_screens/intro_screen2.dart';
import 'package:food_donation_app/Pages/Onboarding/onboarding_screens/intro_screen3.dart';
import 'package:food_donation_app/Pages/Onboarding/onboarding_screens/intro_screen4.dart';
import 'package:food_donation_app/Router/route.gr.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

@RoutePage()
class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _controller = PageController();
  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      PageView(
          controller: _controller,
          onPageChanged: (index) {
            setState(() {
              onLastPage = (index == 3);
            });
          },
          children: [
            const IntroScreen1(),
            IntroScreen2(),
            IntroScreen3(),
            IntroScreen4()
          ]),
      Container(
          alignment: const Alignment(0, 0.8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 7.0),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: GestureDetector(
                  onTap: () {
                    _controller.jumpToPage(3);
                  },
                  child: const SizedBox(
                    width: 42,
                    child: Text(
                      'Skip',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              SmoothPageIndicator(
                controller: _controller,
                count: 4,
                effect: SlideEffect(
                    dotHeight: 12.r,
                    dotWidth: 12.r,
                    spacing: 8,
                    radius: 10.r,
                    dotColor: Colors.white,
                    activeDotColor: Colors.green),
              ),
              onLastPage
                  ? Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 7.0),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          context.router
                              .replace(const AppBottomNavigationBarRoute());
                        },
                        child: const SizedBox(
                          width: 42,
                          child: Text(
                            'Done',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    )
                  : Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 7.0),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          _controller.nextPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeIn);
                        },
                        child: const SizedBox(
                          width: 42,
                          child: Text(
                            'Next',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    )
            ],
          ))
    ]));
  }
}
