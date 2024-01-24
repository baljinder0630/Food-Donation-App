import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:food_donation_app/Pages/Community/Widgets/myBackButton.dart';
import 'package:food_donation_app/Router/route.gr.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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

  @override
  void dispose() {
    _mobileNumberController.dispose();
    super.dispose();
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
                          // Handle dropdown value change
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
                              context.pushRoute(const RaiseRequest2Route());
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
