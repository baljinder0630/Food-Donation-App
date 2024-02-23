import 'dart:developer';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_donation_app/Pages/Community/Functions/nameProfile.dart';
import 'package:food_donation_app/Pages/Community/Widgets/myAppBar.dart';
import 'package:food_donation_app/Pages/DonationRequest/pickupRequestPage.dart';
import 'package:food_donation_app/Pages/HomePages/pickupRequest.dart';
import 'package:food_donation_app/Pages/constants/constants.dart';
import 'package:food_donation_app/Provider/communityProvider.dart';
import 'package:food_donation_app/Provider/userProvider.dart';
import 'package:food_donation_app/Router/route.gr.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

@RoutePage()
class DashBoardPage extends ConsumerStatefulWidget {
  const DashBoardPage({super.key});

  @override
  ConsumerState<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends ConsumerState<DashBoardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 50.h),
        child: Column(
          children: [
            MyAppBar(
                centerWidget: Padding(
                  padding: EdgeInsets.only(left: 57.w),
                  child: GestureDetector(
                    onTap: () {
                      context.pushRoute(const ArticleSearchPageRoute());
                    },
                    child: Container(
                      width: 200.w,
                      height: 40.h,
                      padding: EdgeInsets.only(top: 5.h),
                      child: Text("Profile",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 24.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
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
                    onPressed: () => {menuModal(context)},
                  ),
                )),
            Padding(
              padding: EdgeInsets.only(top: 12.r, bottom: 24.r),
              child: Container(
                color: Colors.white,
                child: ProfileWidget(),
              ),
            ),
            DefaultTabController(
              length: 2,
              child: Expanded(
                child: Column(
                  children: <Widget>[
                    TabBar(
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.grey[400],
                      indicatorWeight: 1,
                      indicatorColor: Colors.black,
                      tabs: [
                        Tab(
                          icon: Icon(
                            Icons.save,
                            size: 25.sp,
                            color: Colors.black,
                          ),
                        ),
                        Tab(
                          icon: Icon(
                            Icons.food_bank,
                            size: 25.sp,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    Flexible(
                      child: Container(
                        width: double.infinity, // Adjust the width as needed
                        child: TabBarView(
                          children: [
                            // Replace with the widgets you want to display when each tab is selected
                            // Container(
                            //   child: Center(
                            //     child: Text(
                            //       "No Donation History",
                            //       style: TextStyle(
                            //         fontSize: 20.sp,
                            //         fontWeight: FontWeight.bold,
                            //       ),
                            //     ),
                            //   ),
                            // ), /
                            //
                            ref.watch(communityProvider).myPosts!.length == 0
                                ? Center(
                                    child: Text(
                                      "No Posts",
                                      style: TextStyle(
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  )
                                : Container(
                                    child: GridView.builder(
                                        gridDelegate:
                                            const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 3,
                                          crossAxisSpacing: 5.0,
                                          mainAxisSpacing: 5.0,
                                        ),
                                        physics: const BouncingScrollPhysics(),
                                        itemCount: ref
                                            .watch(communityProvider)
                                            .myPosts!
                                            .length, // Add your itemCount here (e.g. 6 for 6 items in the grid view
                                        itemBuilder: (context, index) {
                                          return InkWell(
                                            onTap: () {
                                              context
                                                  .pushRoute(ArticleDetailRoute(
                                                article: ref
                                                    .watch(communityProvider)
                                                    .myPosts![index],
                                              ));
                                            },
                                            child: Card(
                                              clipBehavior: Clip.antiAlias,
                                              child: CachedNetworkImage(
                                                imageUrl: ref
                                                    .watch(communityProvider)
                                                    .myPosts![index]
                                                    .imgUrl,
                                                fit: BoxFit.cover,
                                              ),

                                              //   Container(
                                              //     // margin: EdgeInsets.only(right: 20.w),
                                              //     width: 300.sp,
                                              //     height: 300.sp,
                                              //     margin: EdgeInsets.all(5.0),
                                              //     decoration: ShapeDecoration(
                                              //       shape:
                                              //           RoundedRectangleBorder(),
                                              //       image: DecorationImage(
                                              //         image:
                                              //             CachedNetworkImageProvider(
                                              //           ref
                                              //               .watch(
                                              //                   communityProvider)
                                              //               .myPosts![index]
                                              //               .imgUrl,
                                              //         ),
                                              //         fit: BoxFit.cover,
                                              //       ),
                                              //     ),
                                              //   ),
                                            ),
                                          );
                                        }),
                                  ), // First tab

                            StreamBuilder<QuerySnapshot>(
                              stream: FirebaseFirestore.instance
                                  .collection('requests')
                                  .where("uid",
                                      isEqualTo: ref
                                          .watch(authStateProvider)
                                          .user!
                                          .uid)
                                  .snapshots(),
                              builder: (context, snapshot) {
                                List<PickUpRequest> donationRequestWidgets = [];
                                if (snapshot.hasData) {
                                  final donationRequests =
                                      snapshot.data?.docs.reversed.toList();
                                  for (var donationRequest
                                      in donationRequests!) {
                                    final address = donationRequest['plotNo'] +
                                        ", " +
                                        donationRequest['streetController'] +
                                        ", " +
                                        donationRequest['districtController'] +
                                        ", " +
                                        donationRequest['pincodeController'];
                                    final createdTime =
                                        donationRequest['postedTime'];
                                    final cookedBefore =
                                        getCookedTime(createdTime);
                                    final donationRequestWidget = PickUpRequest(
                                      phoneNumber:
                                          donationRequest['phoneNumber'],
                                      snapshot: snapshot,
                                      foodName1: donationRequest['name'],
                                      address: address,
                                      postedTime: cookedBefore,
                                      foodCategory:
                                          donationRequest['foodCategory'],
                                    );

                                    donationRequestWidgets
                                        .add(donationRequestWidget);
                                  }
                                }
                                return Expanded(
                                  child: Container(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 10.r),
                                    height: 400.h,
                                    child: GridView.builder(
                                        gridDelegate:
                                            const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 3,
                                          crossAxisSpacing: 5.0,
                                          mainAxisSpacing: 5.0,
                                        ),
                                        itemCount:
                                            donationRequestWidgets.length,
                                        itemBuilder: (context, index) {
                                          return Card(
                                            child: Padding(
                                              padding: EdgeInsets.all(10.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    donationRequestWidgets[
                                                            index]
                                                        .foodName1,
                                                    style: TextStyle(
                                                      fontSize: 16.sp,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  SizedBox(height: 5.0),
                                                  Text(
                                                    donationRequestWidgets[
                                                            index]
                                                        .address,
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                      fontSize: 12.sp,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  SizedBox(height: 3.0),
                                                  Text(
                                                    donationRequestWidgets[
                                                            index]
                                                        .phoneNumber,
                                                    style: TextStyle(
                                                      fontSize: 12.sp,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  SizedBox(height: 6.0),
                                                  InkWell(
                                                    onTap: () {
                                                      // TODO: Navigate to the detail page
                                                      // context.pushRoute(

                                                      // );
                                                    },
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        color: green,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5.r),
                                                      ),
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              vertical: 5.0,
                                                              horizontal: 10.0),
                                                      child: Text(
                                                        "View Detail",
                                                        style: TextStyle(
                                                          fontSize: 12.sp,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          );
                                        }),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> menuModal(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            // ListTile(
            //   leading: const Icon(Icons.settings),
            //   title: const Text('Settings and privacy'),
            //   onTap: () {},
            // ),

            // const ListTile(
            //     leading: Icon(Icons.message),
            //     title: Text('Threads'),
            //     trailing: Chip(
            //       label: Padding(
            //         padding: EdgeInsets.all(2.0),
            //         child: Text(
            //           '9+',
            //           style: TextStyle(color: Colors.white),
            //         ),
            //       ),
            //       backgroundColor: Colors.blue,
            //     )),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () => {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Logout'),
                        content: Text('Are you sure you want to logout?'),
                        actions: [
                          TextButton(
                              onPressed: () {
                                context.popRoute();
                              },
                              child: Text('Cancel')),
                          TextButton(
                            onPressed: () {
                              AutoRouter.of(context).replace(SignUpPageRoute());
                              ref.read(authStateProvider.notifier).logout();
                            },
                            child: Text('Logout'),
                          )
                        ],
                      );
                    }),
              },
            ),
            // Add more ListTiles here for other options
          ],
        );
      },
    );
  }
}

class ProfileWidget extends ConsumerStatefulWidget {
  @override
  ConsumerState<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends ConsumerState<ProfileWidget> {
  final _picker = ImagePicker();

  @override
  Future<void> _getImage(ImageSource imageSource) async {
    if (imageSource == ImageSource.gallery) {
      final pickedFile =
          await _picker.pickImage(source: imageSource, imageQuality: 50);
      if (pickedFile != null) {
        imagecrop(pickedFile);
      }
    } else {
      Permission permission = Permission.camera;

      if (await permission.isGranted) {
        final pickedFile =
            await _picker.pickImage(source: imageSource, imageQuality: 50);
        if (pickedFile != null) {
          imagecrop(pickedFile);
        }
      } else {
        log("Permission Not Granted");
        PermissionStatus permissionStatus = await permission.request();
        switch (permissionStatus) {
          case PermissionStatus.granted:
            _getImage(imageSource);
            break;
          case PermissionStatus.denied:
            log("Permission Denied");
            break;
          case PermissionStatus.permanentlyDenied:
            // The user opted to never again see the permission request dialog for this
            // app. The only way to change the permission's status now is through a
            // system setting. Open the app settings screen.
            openAppSettings();
            break;
          default:
            break;
        }
      }
    }
  }

  void imagecrop(XFile BeforeCrop) async {
    if (BeforeCrop != null) {
      CroppedFile? croppedFile = await ImageCropper().cropImage(
        sourcePath: BeforeCrop.path,
        compressQuality: 50,
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
        ],
        uiSettings: [
          AndroidUiSettings(
            toolbarTitle: 'Edit Image',
            toolbarColor: Colors.teal,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false,
          ),
          IOSUiSettings(
            title: 'Edit Image',
            minimumAspectRatio: 1.0,
          ),
        ],
      );
      if (croppedFile != null) {
        ref
            .read(authStateProvider.notifier)
            .updateProfilePic(File(croppedFile.path));
      }
    }

    log("Cropped Image Path: ${BeforeCrop.path}");
  }

  showCameraOptions() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.r),
              topRight: Radius.circular(20.r),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.all(16.r),
                child: const Text(
                  'Choose an option',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ListTile(
                onTap: () async {
                  await _getImage(ImageSource.camera);
                  Navigator.pop(context);
                },
                leading: Icon(Icons.camera_alt, color: Colors.blue),
                title: Text("Camera", style: TextStyle(color: Colors.blue)),
              ),
              ListTile(
                onTap: () async {
                  await _getImage(ImageSource.gallery);
                  Navigator.pop(context);
                },
                leading: Icon(Icons.photo, color: Colors.blue),
                title: Text("Gallery", style: TextStyle(color: Colors.blue)),
              ),
              SizedBox(height: 20.h)
            ],
          ),
        );
      },
    );
  }

  Widget build(BuildContext context) {
    final updatePicStatus = ref.watch(authStateProvider).profilePicUpdateStatus;

    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 20.h), // Add some padding

          updatePicStatus == ProfilePicUpdateStatus.processing
              ? CircleAvatar(
                  radius: 62.r,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                      backgroundColor: Colors.grey[300], // Add your color here
                      radius: 60.r,
                      child: Center(child: CircularProgressIndicator())),
                )
              : Stack(
                  children: [
                    Container(
                      child: CircleAvatar(
                        radius: 62.r,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                            backgroundColor:
                                Colors.grey[300], // Add your color here
                            radius: 60.r,
                            // backgroundImage:
                            // AssetImage('assets/profile.jpg'), // Add path to your image file
                            child: ClipOval(
                              child: CachedNetworkImage(
                                imageUrl:
                                    ref.watch(authStateProvider).user!.photoURL,
                                fit: BoxFit.cover,
                                errorWidget: (context, url, error) => Text(
                                  nameProfile(ref
                                      .watch(authStateProvider)
                                      .user!
                                      .displayName),
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 30.sp,
                                    fontFamily: 'Outfit',
                                    fontWeight: FontWeight.w500,
                                    height: 0,
                                    letterSpacing: 0.56.sp,
                                  ),
                                ),
                              ),
                            )),
                      ),
                    ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: CircleAvatar(
                          radius: 20.r,
                          backgroundColor: Colors.white,
                          child: IconButton(
                            icon: Icon(Icons.edit,
                                color: Colors.black, size: 20.r),
                            onPressed: () {
                              showCameraOptions();
                            },
                          ),
                        ))
                  ],
                ),
          SizedBox(height: 20.h), // Add some padding
          Container(
            height: 32.h, // Adjust the height as needed
            width: 300.w, // Adjust the width as needed
            alignment: Alignment.center,
            child: Text(
              ref.watch(authStateProvider).user!.displayName ?? "",
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 20.h), // Add some padding
          Container(
            alignment: Alignment.center,
            width: 350.w, // Adjust the width as needed
            decoration: BoxDecoration(
              color: Colors.green[100], // Add your color here
              borderRadius:
                  BorderRadius.circular(5.r), // Adjust the radius as needed
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildStatColumn(
                      ref.watch(communityProvider).myPosts!.length.toString() ??
                          '0',
                      'posts'),
                  Container(
                      width: 1.w,
                      height: 80.h,
                      color: Colors.white), // Add some padding
                  _buildStatColumn(
                      ref
                              .watch(authStateProvider)
                              .user!
                              .totalConnects
                              .toString() ??
                          "0",
                      'connects')
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Column _buildStatColumn(String number, String title) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          number,
          style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: EdgeInsets.all(8.0.r), // Adjust the padding as needed
          child: Text(
            title,
            style: TextStyle(fontSize: 20.sp),
          ),
        ),
      ],
    );
  }
}
