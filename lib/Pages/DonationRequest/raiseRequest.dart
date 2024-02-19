import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_donation_app/Pages/Donate/Widgets/custom_phone_no_field.dart';
import 'package:food_donation_app/Pages/Donate/Widgets/custom_subheading.dart';
import 'package:food_donation_app/Pages/Donate/Widgets/custom_text_form_field.dart';
import 'package:food_donation_app/Pages/DonationRequest/Widgets/CustomTextField.dart';

import 'package:food_donation_app/Provider/raiseRequestProvider.dart';
import 'package:food_donation_app/Router/route.gr.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'dart:ui';

@RoutePage()
class RaiseRequest extends ConsumerStatefulWidget {
  const RaiseRequest({Key? key}) : super(key: key);

  @override
  ConsumerState<RaiseRequest> createState() => _RaiseDonationReq();
}

class _RaiseDonationReq extends ConsumerState<RaiseRequest> {
  final _mobileNumberController = TextEditingController();
  final _ngoController = TextEditingController();
  final _plotnoController = TextEditingController();
  final _streetnoController = TextEditingController();
  final _servingsController = TextEditingController();
  final _districtController = TextEditingController();
  final _pincodeController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  void dispose() {
    _mobileNumberController.dispose();
    _ngoController.dispose();
    _plotnoController.dispose();
    _servingsController.dispose();
    _districtController.dispose();
    _pincodeController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

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
                      onPressed: () {
                        context.pushRoute(const LandDonationRoute());
                      },
                      child: const Center(child: Text('Go back')),
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

  @override
  Widget build(BuildContext context) {
    final submissionStatus = ref.watch(raiseRequestProvider).raiseRequestStatus;
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
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
                        child:
                            const Center(child: Text("Space for some image")),
                      ),
                      Subheading(text: 'Raise Donation Request'),
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
                              hintText: 'Name of organisation',
                              controller: _ngoController,
                              validator: (text) {
                                if (text == null || text.isEmpty) {
                                  return 'Name cannot be empty';
                                } else if (text.length < 2 ||
                                    text.length > 49) {
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
                                controller: _mobileNumberController),
                            SizedBox(
                              height: 15.0.h,
                            ),
                            CustomTextFormField(
                              hintText: 'Plot No',
                              controller: _plotnoController,
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
                              controller: _streetnoController,
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
                                Flexible(
                                  child: CustomTextFormField(
                                    hintText: 'District',
                                    controller: _districtController,
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
                                Flexible(
                                  child: CustomTextFormField(
                                    hintText: 'PinCode',
                                    controller: _pincodeController,
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
                            CustomTextFormField(
                              hintText: 'Number of servings',
                              controller: _servingsController,
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
                              height: 20.0.h,
                            ),
                            CustomTextField(
                                hintText: 'Description',
                                controller: _descriptionController),
                            SizedBox(
                              height: 20.0.h,
                            ),
                            ElevatedButton(
                                child: (submissionStatus == 'processing')
                                    ? Center(
                                        child: SizedBox(
                                          width: 20.r,
                                          height: 20.r,
                                          child:
                                              const CircularProgressIndicator(
                                            color: Colors.white,
                                            strokeWidth: 2,
                                          ),
                                        ),
                                      )
                                    : Text(
                                        'Save',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Color(0xFFF9F8FD),
                                          fontSize: 28.sp,
                                          fontFamily: 'Outfit',
                                          fontWeight: FontWeight.w600,
                                          height: 0,
                                          letterSpacing: 1.12.sp,
                                        ),
                                      ),
                                onPressed: () async {
                                  if (_ngoController.text.trim().isEmpty ||
                                      _mobileNumberController.text
                                          .trim()
                                          .isEmpty ||
                                      _plotnoController.text.trim().isEmpty ||
                                      _streetnoController.text.trim().isEmpty ||
                                      _districtController.text.trim().isEmpty ||
                                      _pincodeController.text.trim().isEmpty) {
                                    Fluttertoast.showToast(
                                        msg:
                                            "Please fill all fields before proceeding.",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.BOTTOM,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.green,
                                        textColor: Colors.white,
                                        fontSize: 16.0);
                                    return;
                                  } else {
                                    String ngoName = _ngoController.text;
                                    String mobileNumber =
                                        _mobileNumberController.text;
                                    String plotNo = _plotnoController.text;
                                    String streetNo = _streetnoController.text;
                                    String district = _districtController.text;
                                    String pincode = _pincodeController.text;
                                    String description = "";
                                    String numberOfServings =
                                        _servingsController.text;
                                    String requestsFulfilled = "0";
                                    bool uploaded = await ref
                                        .read(raiseRequestProvider.notifier)
                                        .uploadFoodDonationRequest(
                                            ngoName,
                                            mobileNumber,
                                            plotNo,
                                            streetNo,
                                            district,
                                            pincode,
                                            description,
                                            numberOfServings,
                                            requestsFulfilled);

                                    _descriptionController.text = "";
                                    _districtController.text = "";
                                    _mobileNumberController.text = "";
                                    _ngoController.text = "";
                                    _pincodeController.text = "";
                                    _plotnoController.text = "";
                                    _servingsController.text = "";
                                    _streetnoController.text = "";

                                    if (uploaded == true) {
                                      showSuccessDialog(context);
                                    } else {
                                      Fluttertoast.showToast(
                                          msg:
                                              "Error while submitting the form.",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.BOTTOM,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor: Colors.green,
                                          textColor: Colors.white,
                                          fontSize: 16.0);
                                    }
                                    print('Submitted');
                                  }
                                })
                          ],
                        ),
                      ),
                    ],
                  )),
            )),
      ),
    );
  }
}
