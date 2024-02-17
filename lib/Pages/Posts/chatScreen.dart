import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_donation_app/Pages/Community/Widgets/myAppBar.dart';
import 'package:food_donation_app/Pages/Community/Widgets/searchBar.dart';
import 'package:food_donation_app/Pages/Community/allChats.dart';
import 'package:food_donation_app/Router/route.gr.dart';

@RoutePage()
class ChattingPage extends StatefulWidget {
  const ChattingPage({super.key});

  @override
  State<ChattingPage> createState() => _ChattingPageState();
}

class _ChattingPageState extends State<ChattingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: 50.h),
            child: Column(
              children: [
                // Text(
                //   'Community',
                //   style: TextStyle(
                //     color: Color(0xFF201F24),
                //     fontSize: 20.sp,
                //     fontFamily: 'Outfit',
                //     fontWeight: FontWeight.w600,
                //     height: 0,
                //     letterSpacing: 0.40.sp,
                //   ),
                // ),
                // SizedBox(height: 10.h),
                MyAppBar(
                    centerWidget: Padding(
                      padding: EdgeInsets.only(left: 57.w),
                      child: GestureDetector(
                        onTap: () {
                          context.pushRoute(ProfileSearchPageRoute());
                        },
                        child: MySearchBar(title: "Profile"),
                      ),
                    ),
                    rightWidget: SizedBox()),

                Expanded(
                  child: RefreshIndicator(
                    onRefresh: () async {
                      // else if(selectedCategory == 2)
                      //   return await ref
                      //       .read(communityProvider.notifier)
                      //       .loadChatRooms();
                      // else if(selectedCategory == 3)
                      //   return await ref
                      //       .read(communityProvider.notifier)
                      //       .getPeoples(0);
                    },
                    child: SingleChildScrollView(
                      padding: EdgeInsets.zero,
                      physics: BouncingScrollPhysics(),
                      // controller: _scrollController,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20.h,
                          ),
                          AllChatsPage()
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
