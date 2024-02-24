import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_donation_app/Pages/DonationRequest/acceptPickupRequest.dart';
import 'package:shimmer/shimmer.dart';

import '../../Router/route.gr.dart';
import '../constants/constants.dart';

@RoutePage()
class PickUpRequest extends StatelessWidget {
  final String foodName1;
  final String postedTime;
  final List<dynamic> foodCategory;
  final String address;
  final String phoneNumber;
  final AsyncSnapshot<QuerySnapshot<Object?>>? snapshot;

  const PickUpRequest({
    required this.foodName1,
    required this.postedTime,
    required this.foodCategory,
    required this.address,
    required this.snapshot,
    required this.phoneNumber,
    Key? key, // Use Key? key instead of super.key
  }) : super(key: key);

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
        borderRadius: BorderRadius.circular(20.r),
      ),
      padding: EdgeInsets.all(10.r),
      margin: EdgeInsets.all(5.r),
      alignment: Alignment.center,
      height: 330.h,
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
                    foodName1,
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
                        fontSize: 15.sp,
                        overflow: TextOverflow.ellipsis),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: images.isNotEmpty ? images.length : 3,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                if (images.isNotEmpty && index < images.length) {
                  return Container(
                    padding: EdgeInsets.only(left: 20.r),
                    child: Align(
                      widthFactor: 0.7,
                      child: Image.network(
                        images[index],
                        loadingBuilder: (BuildContext context, Widget child,
                            ImageChunkEvent? loadingProgress) {
                          if (loadingProgress == null) {
                            return CircleAvatar(
                              radius: 60.r,
                              backgroundColor: black,
                              child: CircleAvatar(
                                radius: 58.r,
                                backgroundColor: bgColor,
                                child: ClipOval(
                                  child: Image.network(
                                    images[index],
                                    errorBuilder: (BuildContext context,
                                        Object error, StackTrace? stackTrace) {
                                      print('Error loading image: $error');
                                      return const CircleAvatar(
                                        backgroundColor: Colors.grey,
                                        child: Icon(
                                          Icons.error,
                                          color: Colors.white,
                                        ),
                                      );
                                    },
                                    width: 130.w,
                                    height: 130.h,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            );
                          } else {
                            return Shimmer.fromColors(
                              baseColor: Colors.grey[300]!,
                              highlightColor: Colors.grey[100]!,
                              child: CircleAvatar(
                                radius: 58.r,
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  );
                } else {
                  return Container(
                    padding: EdgeInsets.only(left: 20.r),
                    child: Align(
                      widthFactor: 0.7,
                      child: CircleAvatar(
                        radius: 58.r,
                        backgroundColor: green,
                        child: CircleAvatar(
                          radius: 65.r,
                          backgroundColor: bgColor,
                          child: Image.asset(
                            "lib/assets/icons/food.png",
                            height: 55.h,
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
                      color: brown,
                      size: 18.sp,
                    ),
                    Expanded(
                      child: Text(
                        address,
                        style: TextStyle(
                            fontStyle: FontStyle.italic,
                            color: brown,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
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
                    fontSize: 16.sp,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    context.pushRoute(AcceptPickupRequestPageRoute(
                      foodName: foodName1,
                      postedTime: postedTime,
                      foodCategory: foodCategory,
                      address: address,
                      phoneNumber: phoneNumber,
                    ));
                  },
                  style: OutlinedButton.styleFrom(
                    backgroundColor: bgColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                  ),
                  child: SizedBox(
                    child: Center(
                      child: Text(
                        "Accept",
                        style: TextStyle(
                          fontFamily: textFont,
                          fontStyle: FontStyle.italic,
                          decorationColor: green,
                          decorationThickness: 2,
                          color: green,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 10.r,
              ),
              Expanded(
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    backgroundColor: green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                  ),
                  child: SizedBox(
                    child: Center(
                      child: Text(
                        "Reject",
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          decorationColor: white,
                          decorationThickness: 2,
                          color: white,
                          fontSize: 15.sp,
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
