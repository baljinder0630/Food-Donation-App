import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:food_donation_app/Models/Raisereq/raise.model.dart';
import 'package:food_donation_app/Pages/Community/Widgets/myBackButton.dart';
import 'package:food_donation_app/Router/route.gr.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:developer';
import 'dart:async';
import 'dart:io';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';



@RoutePage()
class RaiseRequest extends StatefulWidget {
  const RaiseRequest({Key? key}) : super(key: key);

  @override
  State<RaiseRequest> createState() => _RaiseDonationReq();
}

class _RaiseDonationReq extends State<RaiseRequest> {
  final _formKey = GlobalKey<FormState>();
  final _mobileNumberController = TextEditingController();
  final _ngoController = TextEditingController();
  final _PlotnoController = TextEditingController();
  final _StreetnoController = TextEditingController();
  final _LandmarkController = TextEditingController();
  final _DistrictController = TextEditingController();
  final _PincodeController = TextEditingController();
  String _selectedRequestType = '';

  @override
  void dispose() {
    _mobileNumberController.dispose();
    super.dispose();
  }

  void uploadDonationRequest() async {
  raisemodel donationRequest = raisemodel(
    id: Uuid().v4(),
    ngoName: _ngoController.text,
    requestType: _selectedRequestType, // Assuming you have a variable to store the selected request type
    mobileNumber: _mobileNumberController.text,
    plotNo: _PlotnoController.text,
    streetNo: _StreetnoController.text,
    landmark: _LandmarkController.text,
    district: _DistrictController.text,
    pincode: _PincodeController.text,
  );
  final CollectionReference donationRequests =
        FirebaseFirestore.instance.collection('donationRequests');

    // Upload data to Firebase
    await donationRequests.add(donationRequest.toMap());

    // Perform any necessary actions after the data is uploaded
    showSuccessDialog();
    
    setState(() {
      // Clear text controllers or any other necessary state changes
      _ngoController.text = '';
      _mobileNumberController.text = '';
      
    });
  }

  showSuccessDialog() {
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
                    Text(
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
                    SizedBox(height: 19.20),
                    Image.asset(
                      "lib/assets/Community/PostSuccessfully.png",
                      fit: BoxFit.contain,
                    ),
                    SizedBox(height: 19.20),
                    Container(
                      child: Column(
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
                    SizedBox(height: 19.20),
                    Text(
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
                        context.pushRoute(const DonationTrackingPageRoute());
                      },
                      child: Text('Go to Donation Tracking'),
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
    return Scaffold(
      appBar: AppBar(
        title: Text("Raise Donation Request"),
        leading: MyBackButton(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: CustomTextField(
                    label: "Name of Trust or NGO's",
                    controller: _ngoController,
                    maxLength: 200,
                  ),
                ),
                SizedBox(height: 16),
                Center(
                  child: Column(
                    children: [
                      CustomDropdown(
                        label: 'Type of Request',
                        items: ['Option 1', 'Option 2', 'Option 3'],
                        value: null,
                        onChanged: (value) {
                          setState(() {
                            _selectedRequestType = value ?? '';
                            
                          });
                        },
                      ),
                      SizedBox(height: 16),
                      Container(
                        width: 337.w,
                        child: Row(
                          children: [
                            Expanded(
                              child: CustomTextField(
                                label: "Mobile Number",
                                controller: _mobileNumberController,
                                maxLength: 10,
                              ),
                            ),
                            SizedBox(width: 16),
                            ElevatedButton(
                              onPressed: () {},
                              child: Text('Send OTP'),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 16),
                      CustomTextField(
                        label: "Plot No.",
                        controller: _PlotnoController,
                        maxLength: 20,
                      ),
                      SizedBox(height: 16),
                      CustomTextField(
                        label: "Street Number",
                        controller: _StreetnoController,
                        maxLength: 20,
                      ),
                      SizedBox(height: 16),
                      CustomTextField(
                        label: "Landmark",
                        controller: _LandmarkController,
                        maxLength: 20,
                      ),
                      SizedBox(height: 16),
                      Container(
                        width: 337.w,
                        child: Row(
                          children: [
                            Expanded(
                              child: CustomTextField(
                                label: "District",
                                controller: _DistrictController,
                                maxLength: 20,
                              ),
                            ),
                            SizedBox(width: 16),
                            Expanded(
                              child: CustomTextField(
                                label: "Pincode",
                                controller: _PincodeController,
                                maxLength: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 16),
                      Container(
                        width: 337.w,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              uploadDonationRequest();
                            }
                          },
                          child: Text(
                            'Next',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            // width: 337.w,
                            primary: Colors.blue,
                            padding: EdgeInsets.symmetric(
                              horizontal: 32.0.w,
                              vertical: 16.0.w,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDropdownFormField({
    required String label,
    required List<String> items,
  }) {
    return Container(
      width: 337.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: label,
          contentPadding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        items: items.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (value) {},
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final int maxLength;
  final ValueChanged<String>? onEditingComplete;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final bool obscureText;
  final Widget? suffixIcon;
  final int maxLines;
  final VoidCallback? onTap;

  const CustomTextField({
    Key? key,
    required this.label,
    required this.controller,
    this.maxLength = 200,
    this.onEditingComplete,
    this.validator,
    this.keyboardType,
    this.obscureText = false,
    this.suffixIcon,
    this.maxLines = 1,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 337.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.r),
        boxShadow: const [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 5,
            offset: Offset(0, 0),
            spreadRadius: 0,
          ),
        ],
      ),
      child: TextFormField(
        controller: controller,
        maxLength: maxLength,
        onEditingComplete: () {
          onEditingComplete?.call(controller.text);
          FocusScope.of(context).nextFocus();
        },
        validator: validator,
        keyboardType: keyboardType,
        obscureText: obscureText,
        maxLines: maxLines,
        onTap: onTap,
        decoration: InputDecoration(
          counter: SizedBox.shrink(),
          contentPadding: EdgeInsets.all(10.r),
          filled: true,
          fillColor: Color(0xFFFEFEFE),
          hintText: label,
          hintStyle: TextStyle(
            color: Color(0xFF201F24),
            fontSize: 14.sp,
            fontFamily: 'Outfit',
            fontWeight: FontWeight.w400,
            height: 0,
            letterSpacing: 1.40.sp,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.r),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.r),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.r),
            borderSide: BorderSide.none,
          ),
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}

class CustomDropdown extends StatelessWidget {
  final String label;
  final List<String> items;
  final String? value;
  final ValueChanged<String?>? onChanged;
  final String? Function(String?)? validator;
  final VoidCallback? onTap;

  const CustomDropdown({
    Key? key,
    required this.label,
    required this.items,
    this.value,
    this.onChanged,
    this.validator,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 337.w, // You may need to replace this with your desired width
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.r),
        boxShadow: const [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 5,
            offset: Offset(0, 0),
            spreadRadius: 0,
          ),
        ],
      ),
      child: DropdownButtonFormField<String>(
        value: value,
        items: items
            .map((item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(item),
                ))
            .toList(),
        onChanged: onChanged,
        validator: validator,
        onTap: onTap,
        decoration: InputDecoration(
          filled: true,
          fillColor: Color(0xFFFEFEFE),
          hintText: label,
          hintStyle: TextStyle(
            color: Color(0xFF201F24),
            fontSize: 14.sp,
            fontFamily: 'Outfit',
            fontWeight: FontWeight.w400,
            height: 0,
            letterSpacing: 1.40.sp,
          ),
          contentPadding: EdgeInsets.all(10.r),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.r),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.r),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.r),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}

// You might need to adjust the width and other styling based on your design requirements.
