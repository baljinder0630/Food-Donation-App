import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:food_donation_app/Pages/DisasterNewsFeed/controller.dart';
import 'package:food_donation_app/Pages/DisasterNewsFeed/player.dart';
import 'package:preload_page_view/preload_page_view.dart';

@RoutePage()
class DisasterNewsFeedPage extends StatelessWidget {
  const DisasterNewsFeedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final c = Get.put(PCC());
    final pageCount = c.videoURLs.length;
    return Scaffold(
        body: SafeArea(
      child: SizedBox(
        height: double.infinity,
        child: LayoutBuilder(
          builder: (context, constraints) {
            return PreloadPageView.builder(
              itemBuilder: (ctx, i) {
                final index = i % pageCount;
                return Player(i: index);
              },
              onPageChanged: (i) async {
                c.updateAPI(i % pageCount);
              },
              preloadPagesCount: 1,
              controller: PreloadPageController(
                initialPage: pageCount * 1000,
              ),
              itemCount: pageCount * 2000,
              scrollDirection: Axis.vertical,
              physics: const AlwaysScrollableScrollPhysics(),
            );
          },
        ),
      ),
    ));
  }
}
