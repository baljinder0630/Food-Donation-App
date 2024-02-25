import 'package:auto_route/auto_route.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_donation_app/Pages/Community/Widgets/myBackButton.dart';
import 'package:food_donation_app/Pages/Community/Widgets/postWidget.dart';
import 'package:food_donation_app/Provider/communityProvider.dart';
import '../constants/constants.dart';

@RoutePage()
class ArticleSearchPage extends ConsumerStatefulWidget {
  const ArticleSearchPage({super.key});

  @override
  ConsumerState<ArticleSearchPage> createState() => Article_SearchPageState();
}

class Article_SearchPageState extends ConsumerState<ArticleSearchPage> {
  @override
  Widget build(BuildContext context) {
    final suggestionLoading = ref.watch(communityProvider).suggestionLoading;
    final suggestions = ref.watch(communityProvider).articleSearchSuggestions;
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          toolbarHeight: 80.h,
          leading: Container(
              alignment: Alignment.centerRight, child: const MyBackButton()),
          title: TextField(
            autofocus: true,
            decoration: InputDecoration(
              suffixIcon: const Icon(Icons.search),
              hintText: "Search for article",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(13.r)),
              enabledBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(13.r)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(13.r),
                  borderSide: BorderSide(color: black, width: 1)),
            ),
            onChanged: (value) {
              EasyDebounce.debounce(
                  'my-debouncer', // <-- An ID for this particular debouncer
                  const Duration(
                      milliseconds: 500), // <-- The debounce duration
                  () async {
                await ref
                    .watch(communityProvider.notifier)
                    .articleSearchSuggestion(value);
              });
            },
          ),
        ),
        body: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: SafeArea(
                child: Column(
              children: [
                suggestionLoading == PostStatus.processing
                    ? Padding(
                        padding: EdgeInsets.only(top: 20.h),
                        child: Center(
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(green),
                            strokeWidth: 5.0,
                          ),
                        ),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        itemCount: suggestions!.length,
                        itemBuilder: (context, index) {
                          return PostWidget(post: suggestions[index]);
                        })
              ],
            ))));
  }
}
