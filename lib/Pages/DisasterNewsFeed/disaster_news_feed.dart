import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_donation_app/Pages/Community/Widgets/myBackButton.dart';
import 'package:get/get.dart';
import 'package:food_donation_app/Pages/DisasterNewsFeed/controller.dart';
import 'package:food_donation_app/Pages/DisasterNewsFeed/player.dart';
import 'package:preload_page_view/preload_page_view.dart';
import 'package:share/share.dart';
import 'package:expandable_text/expandable_text.dart';

//Disaster News Feed
@RoutePage()
class DisasterNewsFeedPage extends StatelessWidget {
  const DisasterNewsFeedPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final c = Get.put(PCC());
    final pageCount = c.videoURLs.length;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox.expand(
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
            const Positioned(
              left: 0,
              right: 0,
              top: 16.0,
              child: Center(
                child: Text(
                  'Disaster News',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.all(16.0),
                color: Colors.transparent,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundImage: NetworkImage(
                              'https://plus.unsplash.com/premium_photo-1671398049394-53ea333b6ea7?q=80&w=1528&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
                        ),
                        SizedBox(width: 12),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              right: 3.w,
              bottom: 10.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () async {
                      final url = c.videoURLs[0];
                      await Share.share(url, subject: 'Share');
                    },
                    icon: const Icon(Icons.share, color: Colors.white),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.play_arrow, color: Colors.white),
                  ),
                ],
              ),
            ),
            Positioned(
                left: 55.0.w,
                right: 35.0.w,
                bottom: 10.0.h,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  color: Colors.transparent,
                  child: const ExpandableText(
                    'Demo text: Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups. In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying',
                    expandText: '...More',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 12.5,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    expandOnTextTap: true,
                    collapseOnTextTap: true,
                    maxLines: 2,
                  ),
                )),
            AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                shadowColor: Colors.transparent,
                foregroundColor: Colors.transparent,
                surfaceTintColor: Colors.transparent,
                leading: Align(
                    alignment: Alignment.centerRight, child: MyBackButton())),
          ],
        ),
      ),
    );
  }
}
