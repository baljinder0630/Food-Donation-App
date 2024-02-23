import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Community/Widgets/myAppBar.dart';
import '../constants/constants.dart';

@RoutePage()
class AcceptPickupRequestPage extends StatelessWidget {
  final String foodName;
  final String postedTime;
  final List<dynamic> foodCategory;
  final String address;
  final String phoneNumber;

  const AcceptPickupRequestPage({
    required this.foodName,
    required this.postedTime,
    required this.foodCategory,
    required this.address,
    required this.phoneNumber,
    Key? key, // Use Key? key instead of super.key
  }) : super(key: key); // Use super(key: key) to pass the key parameter

  Widget foodCard() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Number of columns
        crossAxisSpacing: 10.0.r, // Spacing between columns
        mainAxisSpacing: 10.0.r, // Spacing between rows
      ),
      itemCount: foodCategory.length,
      itemBuilder: (BuildContext context, int index) {
        late String imageURL;
        late String foodNAME;
        late String foodQuantity;
        late String foodCATEGORY;
        var food = foodCategory[index];
        if (food is Map<String, dynamic> && food.containsKey('imageURL')) {
          imageURL = food['imageURL'];
        }
        if (food is Map<String, dynamic> && food.containsKey('name')) {
          foodNAME = food['name'];
        }
        if (food is Map<String, dynamic> && food.containsKey('quantity')) {
          foodQuantity = food['quantity'];
        }
        if (food is Map<String, dynamic> && food.containsKey('foodCategory')) {
          foodCATEGORY = food['foodCategory'];
        }
        return Container(
          height: 170.h,
          child: Card(
            elevation: 2.0,
            child: Column(
              children: [
                Expanded(
                  child: Text(
                    foodNAME,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 8.0.r),
                  child: CircleAvatar(
                    radius: 55.r,
                    backgroundColor: green,
                    child: CircleAvatar(
                      radius: 52.r,
                      backgroundColor: bgColor,
                      child: ClipOval(
                        child: Image.network(
                          imageURL,
                          width: 140.w,
                          height: 140.h,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    "Quantity : $foodQuantity",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.sp,
                        overflow: TextOverflow.ellipsis),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 50.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyAppBar(
              centerWidget: Padding(
                padding: EdgeInsets.only(left: 57.w),
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: 200.w,
                    height: 40.h,
                    padding: EdgeInsets.only(top: 5.h),
                    child: Text(
                      "Accept Request",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
              rightWidget: Padding(
                padding: EdgeInsets.only(right: 34.18.w),
                child: IconButton(
                  icon: const Icon(
                    Icons.menu_rounded,
                    color: Colors.white,
                  ),
                  onPressed: () => {},
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 30.r, right: 30.r, top: 20.r),
              height: 120.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      SizedBox(
                        width: 250.w,
                        child: Row(children: [
                          Expanded(
                            child: Text(
                              "Posted by: $foodName",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold,
                                  overflow: TextOverflow.ellipsis),
                            ),
                          ),
                        ]),
                      ),
                      // User Name of user is displayed
                      SizedBox(
                        width: 250.w,
                        child: Row(children: [
                          Expanded(
                            child: Text(
                              "Posted $postedTime ago",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.sp,
                                  overflow: TextOverflow.ellipsis),
                            ),
                          ),
                        ]),
                      ),
                      // Time is displayed here...
                      SizedBox(
                        width: 250.w,
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
                    ],
                  ),
                  SizedBox(
                    width: 80.w,
                    height: 50.h,
                    child: OutlinedButton(
                      onPressed: () async {
                        final Uri url = Uri(
                          scheme: 'tel',
                          path: "$phoneNumber",
                        );
                        if (await canLaunchUrl(url)) {
                          await launchUrl(url);
                        } else {
                          print("Can't make a call to this number");
                        }
                        // Add your functionality here for making a call
                      },
                      style: OutlinedButton.styleFrom(
                        backgroundColor: null,
                      ),
                      child: Icon(
                        Icons.phone,
                        // You can replace Icons.phone with any other icon you prefer
                        size: 24, // Adjust the size of the icon as needed
                        color: red1, // Color of the icon
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                  bottom: 10.r, top: 10.r, left: 10.r, right: 10.r),
              height: MediaQuery.of(context).size.height - 50.r - 330.h,
              child: foodCard(),
              // child: MyGridView(),
            ),
            Center(
              child: SizedBox(
                height: 50.h,
                width: 200.w,
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(backgroundColor: green),
                  child: SizedBox(
                    width: 230.w,
                    child: Center(
                      child: Text(
                        "Proceed",
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          decorationColor: white,
                          decorationThickness: 2,
                          color: white,
                          fontSize: 17.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50.h,
            ),
            // Wrap the Expanded with a Container and specify its height
          ],
        ),
      ),
    );
  }
}

class MyGridView extends StatelessWidget {
  // Sample data for the GridView
  final List<String> items = List.generate(20, (index) => 'Item $index');

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Number of columns
        crossAxisSpacing: 10.0.r, // Spacing between columns
        mainAxisSpacing: 10.0.r, // Spacing between rows
      ),
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        return SizedBox(
          height: 100.h,
          child: Card(
            elevation: 2.0,
            child: Center(
              child: Text(items[index]),
            ),
          ),
        );
      },
    );
  }
}
