import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_donation_app/Pages/Community/Widgets/myBackButton.dart';
import 'package:food_donation_app/Provider/communityProvider.dart';
import 'package:easy_debounce/easy_debounce.dart';

@RoutePage()
class ArticleSearchPage extends ConsumerStatefulWidget {
  const ArticleSearchPage({super.key});
  @override
  ConsumerState<ArticleSearchPage> createState() => Article_SearchPageState();
}

class Article_SearchPageState extends ConsumerState<ArticleSearchPage> {
  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Your code here
      ref.read(communityProvider.notifier).getMyPosts();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
              suffixIcon: Icon(Icons.search),
              hintText: "Search for article",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(13.r)),
              enabledBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(13.r)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(13.r),
                  borderSide: BorderSide(color: Colors.teal, width: 2)),
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
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: suggestions!.length,
                    itemBuilder: (context, index) {
                      return Text(suggestions[index]);
                    })
              ],
            ))));
  }
}
