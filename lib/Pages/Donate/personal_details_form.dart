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
      backgroundColor: Colors.grey.withOpacity(0.2),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
              padding: EdgeInsets.fromLTRB(0.0, 40.h, 0.0, 0.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 250.h,
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: const Center(child: Text("Space for some image")),
                  ),
                  Subheading(text: 'Fill Personal Details'),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 7.0, vertical: 30.0),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 16.0),
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
                      borderRadius: BorderRadius.circular(20.0),
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
                            const SizedBox(
                              width: 10.0,
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
                          height: 20.0.h,
                        ),
                        CustomButton(
                            text: 'Next',
                            onPressed: () {
                              if (nameController.text.trim().isEmpty ||
                                  phoneController.text.trim().isEmpty ||
                                  plotNoController.text.trim().isEmpty ||
                                  streetController.text.trim().isEmpty ||
                                  districtController.text.trim().isEmpty ||
                                  pincodeController.text.trim().isEmpty) {
                                Fluttertoast.showToast(
                                    msg: "Please fill all fields before proceeding.",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.green,
                                    textColor: Colors.white,
                                    fontSize: 16.0
                                );
                                return;
                              }
                              else{
                              ref
                                  .read(donationRequestProvider.notifier)
                                  .updatePersonalDetails(
                                      nameController.text,
                                      phoneController.text,
                                      plotNoController.text,
                                      streetController.text,
                                      districtController.text,
                                      pincodeController.text);
                              nameController.text = "";
                              phoneController.text = "";
                              plotNoController.text = "";
                              streetController.text = "";
                              districtController.text = "";
                              pincodeController.text = "";
                              context.pushRoute(const FoodCategoryFormRoute());
                            }})
                      ],
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
