import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_donation_app/Pages/Donate/Widgets/button.dart';
import 'package:food_donation_app/Pages/Donate/Widgets/custom_phone_no_field.dart';
import 'package:food_donation_app/Pages/Donate/Widgets/custom_subheading.dart';
import 'package:food_donation_app/Pages/Donate/Widgets/custom_text_form_field.dart';
import 'package:food_donation_app/Provider/donateRequestProvider.dart';
import 'package:food_donation_app/Router/route.gr.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../constants/constants.dart';

@RoutePage()
class PersonalDetails extends ConsumerStatefulWidget {
  const PersonalDetails({super.key});

  @override
  ConsumerState<PersonalDetails> createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends ConsumerState<PersonalDetails> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController plotNoController = TextEditingController();
  TextEditingController streetController = TextEditingController();
  TextEditingController districtController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // Background image
            Positioned.fill(
              child: Image.asset(
                "assets/form_bg.png",
                // Replace this with your actual image path
                fit: BoxFit.cover,
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.fromLTRB(0.r, 40.r, 0.r, 0.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        height: 250.h,
                        width: MediaQuery.of(context).size.width * 0.6,
                        // child: const Center(child: Image.asset(
                        //   "lib/assets/Community/PostSuccessfully.png",
                        //   fit: BoxFit.contain,
                        // ),),
                        child: const Center()),
                    Subheading(text: 'Fill Personal Details'),
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: 7.0.w, vertical: 30.0.h),
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.w, vertical: 16.h),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 2),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Column(
                        children: [
                          CustomTextFormField(
                            hintText: 'Name',
                            controller: nameController,
                            validator: (text) {
                              if (text == null || text.isEmpty) {
                                return 'Name cannot be empty';
                              } else if (text.length < 2 || text.length > 49) {
                                return 'Please enter a valid name';
                              } else {
                                return null;
                              }
                            },
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(50)
                            ],
                          ),
                          SizedBox(
                            height: 10.0.h,
                          ),
                          CustomPhoneNumberField(
                              hintText: 'Phone Number',
                              controller: phoneController),
                          SizedBox(
                            height: 15.0.h,
                          ),
                          CustomTextFormField(
                            hintText: 'Plot No',
                            controller: plotNoController,
                            validator: (text) {
                              if (text == null || text.length > 49) {
                                return 'Please enter valid details.';
                              } else {
                                return null;
                              }
                            },
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(50)
                            ],
                          ),
                          SizedBox(
                            height: 15.0.h,
                          ),
                          CustomTextFormField(
                            hintText: 'Street Name',
                            controller: streetController,
                            validator: (text) {
                              if (text == null || text.length > 49) {
                                return 'Please enter valid details.';
                              } else {
                                return null;
                              }
                            },
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(50)
                            ],
                          ),
                          SizedBox(
                            height: 15.0.h,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: CustomTextFormField(
                                  hintText: 'District',
                                  controller: districtController,
                                  validator: (text) {
                                    if (text == null || text.length > 49) {
                                      return 'Please enter valid details.';
                                    } else {
                                      return null;
                                    }
                                  },
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(50)
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Expanded(
                                child: CustomTextFormField(
                                  hintText: 'PinCode',
                                  controller: pincodeController,
                                  validator: (text) {
                                    if (text == null || text.length > 49) {
                                      return 'Please enter valid details.';
                                    } else {
                                      return null;
                                    }
                                  },
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(50)
                                  ],
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          CustomButton(
                              text: 'Next',
                              onPressed: () async {
                                if (nameController.text.trim().isEmpty ||
                                    phoneController.text.trim().isEmpty ||
                                    plotNoController.text.trim().isEmpty ||
                                    streetController.text.trim().isEmpty ||
                                    districtController.text.trim().isEmpty ||
                                    pincodeController.text.trim().isEmpty) {
                                  Fluttertoast.showToast(
                                      msg:
                                          "Please fill all fields before proceeding.",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.BOTTOM,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: green,
                                      textColor: Colors.white,
                                      fontSize: 16.sp);
                                  return;
                                } else {
                                  await ref
                                      .read(donationRequestProvider.notifier)
                                      .updatePersonalDetails(
                                          nameController.text,
                                          phoneController.text,
                                          plotNoController.text,
                                          streetController.text,
                                          districtController.text,
                                          pincodeController.text);
                                  context
                                      .pushRoute(const FoodCategoryFormRoute());
                                }
                              })
                        ],
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
}
