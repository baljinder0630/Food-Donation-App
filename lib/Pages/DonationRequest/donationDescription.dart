import 'dart:ui';
import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_donation_app/Pages/DonationRequest/donationDescriptionHeader.dart';
import 'package:food_donation_app/Provider/donateRequestProvider.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Community/Functions/toCamelCase.dart';
import '../constants/constants.dart';
import 'package:food_donation_app/Router/route.gr.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';

@RoutePage()
class DonationDescription extends ConsumerWidget {
  final String requestName;
  final String NGOName;
  final String NGOImage;
  final Position ngoPosition;
  final String totalRequest;
  final String completedRequest;
  final String ngoLocation;
  final Timestamp timestamp;
  final String description;
  final String phoneNumber;
  final String requestType;

  const DonationDescription({
    required this.requestName,
    required this.NGOName,
    required this.NGOImage,
    required this.ngoPosition,
    required this.totalRequest,
    required this.completedRequest,
    required this.ngoLocation,
    required this.timestamp,
    required this.description,
    required this.phoneNumber,
    required this.requestType,
    Key? key,
  }) : super(key: key);

  String getServings(String str) {
    int num = int.parse(str);
    if (num > 1e9) {
      return "${(num / 1e9).toStringAsFixed(1)}B";
    }
    if (num > 1e6) {
      return "${(num / 1e6).toStringAsFixed(1)}M";
    }
    if (num > 1e3) {
      return "${(num / 1e3).toStringAsFixed(1)}K";
    }
    return "$num";
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final status = ref.watch(donationRequestProvider).foodCategoryStatus;

    showSuccessDialog(BuildContext context) {
      showGeneralDialog(
        context: context,
        transitionDuration: Duration(milliseconds: 300),
        barrierDismissible: true,
        barrierLabel: '',
        transitionBuilder: (context, anim1, anim2, child) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, 1),
              end: Offset.zero,
            ).animate(anim1),
            child: child,
          );
        },
        pageBuilder: (context, ani1, ani2) {
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: SimpleDialog(
              elevation: 0,
              backgroundColor: Colors.transparent,
              children: [
                Container(
                  width: 378,
                  padding: EdgeInsets.all(19.20),
                  decoration: ShapeDecoration(
                    color: Color(0xFFFEFEFE),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28.80),
                    ),
                    shadows: const [
                      BoxShadow(
                        color: Color(0x3F000000),
                        blurRadius: 12,
                        offset: Offset(1.20, 1.20),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Posted Successfully',
                        style: TextStyle(
                          color: Color(0xFF201F24),
                          fontSize: 19.20,
                          fontFamily: 'Outfit',
                          fontWeight: FontWeight.w600,
                          height: 0,
                          letterSpacing: 0.38,
                        ),
                      ),
                      const SizedBox(height: 19.20),
                      Image.asset(
                        "lib/assets/Community/PostSuccessfully.png",
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(height: 19.20),
                      Container(
                        child: const Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'THANK YOU',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF5272FC),
                                fontSize: 19.20,
                                fontStyle: FontStyle.italic,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w800,
                                height: 0,
                                letterSpacing: 4.03,
                              ),
                            ),
                            SizedBox(height: 9.60),
                            SizedBox(
                              width: 323.52,
                              child: Text(
                                '"HOPE IS LIKE A FLAME; IT CAN NEVER BE EXTINGUISHED, EVEN IN THE DARKEST OF TIMES." WE HOPE YOU GET A BETTER SUPPORT',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF201F24),
                                  fontSize: 13.44,
                                  fontFamily: 'Outfit',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                  letterSpacing: 0.54,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 19.20),
                      const Text(
                        'Further Notifications Will be Updated ',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF201F24),
                          fontSize: 13.44,
                          fontFamily: 'Outfit',
                          fontWeight: FontWeight.w400,
                          height: 0,
                          letterSpacing: 0.54,
                        ),
                      ),
                      SizedBox(height: 19.20),
                      ElevatedButton(
                        onPressed: () async {
                          await context
                              .pushRoute(const AppBottomNavigationBarRoute());
                        },
                        child: const Center(
                            child: Text('Go back',
                                style: TextStyle(color: Colors.white))),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      );
    }

    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: <Widget>[
          DonationDescriptionHeader(
            requestName: requestName,
            NGOName: NGOName,
            NGOImage: NGOImage,
            ngoPosition: ngoPosition,
            totalRequest: totalRequest,
            completedRequest: completedRequest,
            ngoLocation: ngoLocation,
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(20.0.r),
                  child: Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 100.w - 40.r,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  toCamelCase(
                                      "${timestamp.toDate().day}/${timestamp.toDate().month}/${timestamp.toDate().year} ${timestamp.toDate().hour}:${timestamp.toDate().minute}"),
                                  style: TextStyle(
                                      fontStyle: FontStyle.italic,
                                      color: black,
                                      fontSize: 17.sp,
                                      overflow: TextOverflow.ellipsis),
                                ),
                                SizedBox(
                                  width: 10.r,
                                ),
                                Container(
                                  height: 5.0.r,
                                  width: 5.r,
                                  decoration: BoxDecoration(
                                    color: green,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                SizedBox(
                                  width: 10.r,
                                ),
                                Text(
                                  "$requestType Donation",
                                  style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    color: black,
                                    fontSize: 17.sp,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: requestType == "Fund Donation"
                                      ? Text(
                                          "${getServings(completedRequest)}  of ${getServings(totalRequest)} funds collected",
                                          style: TextStyle(
                                            fontStyle: FontStyle.italic,
                                            color: brown,
                                            fontSize: 17.sp,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        )
                                      : Text(
                                          "${getServings(completedRequest)}  of ${getServings(totalRequest)} requests completed",
                                          style: TextStyle(
                                            fontStyle: FontStyle.italic,
                                            color: brown,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 17.sp,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      //   Here add the call widget...

                      SizedBox(
                        width: 80.w,
                        height: 50.h,
                        child: OutlinedButton(
                          onPressed: () async {
                            final Uri url = Uri(
                              scheme: 'tel',
                              path: phoneNumber,
                            );
                            if (await canLaunchUrl(url)) {
                              await launchUrl(url);
                            } else {
                              if (kDebugMode) {
                                print("Can't make a call to this number");
                              }
                            }
                            // Add your functionality here for making a call
                          },
                          style: OutlinedButton.styleFrom(
                            backgroundColor: null,
                          ),
                          child: Icon(
                            Icons.phone,
                            size: 24,
                            color: brown,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Text(
                    "Description",
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20.r),
                  child: description == ""
                      ? Container(
                          height: 360.h,
                          child: const Center(
                            child: Text("No description"),
                          ),
                        )
                      : Text(
                          description,
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontSize: 18.sp,
                            color: black.withOpacity(0.6),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Center(
                  child: SizedBox(
                    height: 50.h,
                    width: 200.w,
                    child: OutlinedButton(
                      onPressed: () async {
                        bool ans = await ref
                            .read(donationRequestProvider.notifier)
                            .raiseRequest();
                        if (ans) {
                          showSuccessDialog(context);
                        } else {
                          Fluttertoast.showToast(
                              msg: "Error while donating",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        }
                      },
                      style: OutlinedButton.styleFrom(backgroundColor: green),
                      child: SizedBox(
                        width: 230.w,
                        child: (status == 'processing')
                            ? Center(
                                child: SizedBox(
                                  width: 20.r,
                                  height: 20.r,
                                  child: const CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 2,
                                  ),
                                ),
                              )
                            : Center(
                                child: Text(
                                  "Donate",
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
