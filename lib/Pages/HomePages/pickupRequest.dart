import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/constants.dart';

@RoutePage()
class PickUpRequest extends StatelessWidget {
  final String foodName;
  final String postedTime;
  final List<dynamic> foodCategory;
  final String address;

  const PickUpRequest(
      {required this.foodName,
      required this.postedTime,
      required this.foodCategory,
      required this.address,
      super.key});

  List<String> getImagesList() {
    List<String> images = [];
    for (var item in foodCategory) {
      if (item is Map<String, dynamic> && item.containsKey('imageURL')) {
        if (item['imageURL'] != null) {
          images.add(item['imageURL']);
        }
      }
    }
    return images;
  }

  @override
  Widget build(BuildContext context) {
    List<String> images = getImagesList();
    return Container(
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(30.r),
      ),
      padding: EdgeInsets.all(10.r),
      margin: EdgeInsets.all(10.r),
      alignment: Alignment.center,
      height: 400.h,
      width: 300.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10.r),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    foodName,
                    style: TextStyle(
                        color: black,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.r),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    "Cooked ${postedTime} Ago.",
                    style: TextStyle(
                        color: black,
                        fontSize: 17.sp,
                        overflow: TextOverflow.ellipsis),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: images.isNotEmpty ? images.length : 4,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                if (images.isNotEmpty && index < images.length) {
                  return Container(
                    padding: EdgeInsets.only(left: 20.r),
                    child: Align(
                      widthFactor: 0.7,
                      child: CircleAvatar(
                        radius: 70.r,
                        backgroundColor: green,
                        child: ClipOval(
                          child: Image.network(
                            images[index],
                            width: 130.w,
                            height: 130.h,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  );
                } else {
                  return Container(
                    padding: EdgeInsets.only(left: 20.r),
                    child: Align(
                      widthFactor: 0.7,
                      child: CircleAvatar(
                        radius: 70.r,
                        backgroundColor: green,
                        child: CircleAvatar(
                          radius: 65.r,
                          backgroundColor: bgColor,
                          child: Image.asset(
                            "lib/assets/icons/food.png",
                            height: 60.h,
                          ),
                        ),
                      ),
                    ),
                  );
                }
              },
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 6.r),
                width: 330.w,
                child: Row(
                  children: [
                    Icon(
                      Icons.place,
                      color: red1,
                    ),
                    Expanded(
                      child: Text(
                        address,
                        style: TextStyle(
                            fontStyle: FontStyle.italic,
                            color: red1,
                            fontSize: 17.sp,
                            overflow: TextOverflow.ellipsis),
                      ),
                    ),
                  ],
                  //  Location is displayed here.
                ),
              ),
              Container(
                width: 330.w,
                padding: EdgeInsets.only(
                    top: 8.r, bottom: 8.r, left: 11.r, right: 8.r),
                child: Text(
                  "2 km away(approx).",
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    color: black,
                    fontSize: 17.sp,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 135.w,
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(backgroundColor: bgColor),
                  child: SizedBox(
                    width: 230.w,
                    child: Center(
                      child: Text(
                        "Accept",
                        style: TextStyle(
                          fontFamily: textFont,
                          fontStyle: FontStyle.italic,
                          decorationColor: green,
                          decorationThickness: 2,
                          color: green,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 135.w,
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(backgroundColor: green),
                  child: SizedBox(
                    width: 230.w,
                    child: Center(
                      child: Text(
                        "Reject",
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          decorationColor: white,
                          decorationThickness: 2,
                          color: white,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
