import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../Router/route.gr.dart';
import '../Community/Widgets/myAppBar.dart';

@RoutePage()
class AcceptPickupRequestPage extends StatefulWidget {
  const AcceptPickupRequestPage({super.key});

  @override
  State<AcceptPickupRequestPage> createState() =>
      _AcceptPickupRequestPageState();
}

class _AcceptPickupRequestPageState extends State<AcceptPickupRequestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 50.r),
        child: Column(
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
                      "Description",
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
            SingleChildScrollView(
              child: Column(
                children: [
                  Text("heyy"),
                  ElevatedButton(
                      onPressed: () async {
                        final Uri url = Uri(scheme: "tel", path: '7464956179');
                        if (await canLaunchUrl(url)) {
                          await launchUrl(url);
                        } else {
                          print("Can't launch this url");
                        }
                      },
                      child: Text("Call US")),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
