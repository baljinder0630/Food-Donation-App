import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_donation_app/Models/User.model.dart';
import 'package:food_donation_app/Pages/Community/Widgets/userCard.dart';
import 'package:food_donation_app/Provider/communityProvider.dart';
import 'package:food_donation_app/Provider/userProvider.dart';

class PeoplePage extends ConsumerStatefulWidget {
  const PeoplePage({super.key});

  @override
  ConsumerState<PeoplePage> createState() => _PeoplePageState();
}

class _PeoplePageState extends ConsumerState<PeoplePage> {
  @override
  Widget build(BuildContext context) {
    // final users = ref.watch(communityProvider).users;

    return Container(
      // height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: StreamBuilder(
            stream: ref.watch(communityProvider.notifier).getPeoples(0),
            builder: (context, snapshot) {
              QuerySnapshot? data = snapshot.data as QuerySnapshot?;
              if (snapshot.connectionState == ConnectionState.active) {
                if (snapshot.hasError) {
                  return SizedBox();
                }
                if (snapshot.hasData && data!.docs.isNotEmpty) {
                  final users = data.docs
                      .map((e) => e.data() as Map<String, dynamic>)
                      .toList();

                  return Container(
                    height: 110.h * users.length,
                    child: ListView.builder(
                        itemCount: users.length,
                        itemBuilder: (context, index) {
                          return UserCard(
                              user: UserModel.fromMap(users[index]));
                        }),
                  );
                }
              }
              return SizedBox();
            },
          )),
    );
  }
}
