import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/constants.dart';

class DonationDescriptionHeader extends StatelessWidget {
  const DonationDescriptionHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 300,
      backgroundColor: bgColor,
      elevation: 0.0,
      pinned: true,
      stretch: true,
      flexibleSpace: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return FlexibleSpaceBar(
            background: Image.asset(
              "lib/assets/images/exploreImages/child.jpg",
              fit: BoxFit.cover,
            ),
            stretchModes: [
              StretchMode.blurBackground,
              StretchMode.zoomBackground,
            ],
          );
        },
      ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(0.0),
        child: Container(
          height: 32,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(32),
              topLeft: Radius.circular(32),
            ),
          ),
          child: Container(
            width: 50,
            height: 5,
            decoration: BoxDecoration(
              color: green,
              borderRadius: BorderRadius.circular(100.0),
            ),
          ),
        ),
      ),
      leadingWidth: 80,
      leading: GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Container(
          margin: EdgeInsets.only(top: 10, left: 22),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(56),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
              child: Container(
                height: 56,
                width: 56,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(0.2),
                ),
                child: Padding(
                  padding: EdgeInsets.only(right: 5.0),
                  child: Image.asset(
                    "lib/assets/icons/back.png",
                    width: 25,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
