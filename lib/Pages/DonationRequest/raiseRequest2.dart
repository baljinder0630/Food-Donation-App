import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:food_donation_app/Pages/Community/Widgets/myBackButton.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_donation_app/Router/route.gr.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

@RoutePage()
class RaiseRequest2 extends StatefulWidget {
  const RaiseRequest2({Key? key}) : super(key: key);

  @override
  State<RaiseRequest2> createState() => _RaiseDonationReq();
}

class _RaiseDonationReq extends State<RaiseRequest2> {
  final _formKey = GlobalKey<FormState>();
  final _volunteerController = TextEditingController();

  final _descriptionController = TextEditingController();
  String? Recovery;

  List<Map<dynamic, dynamic>> data = [
    {
      'img': 'images/fruits.png',
      'category': 'Fruits and veggies',
    },
    {
      'img': 'images/bakery.png',
      'category': 'Bread & Bakery Items',
    },
    {
      'img': 'images/dairy.png',
      'category': 'Dairy Products',
    },
    {
      'img': 'images/beverage1.png',
      'category': 'Drinks & Beverages',
    },
    {
      'img': 'images/groceries.png',
      'category': 'Food items & supplies',
    },
    {
      'img': 'images/vegetables.png',
      'category': 'Packed items',
    }
  ];

  uploadPost() async {}

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: MyBackButton(),
        elevation: 0,
        leadingWidth: 100.w,
        centerTitle: true,
        title: Text("Raise Donation Request"),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: CustomDropdownWidget(
                    label: "Asisit Recovery",
                    items: ["Yes,Urgently", "If Possible", " NO"],
                    value: Recovery,
                    onChanged: (value) {
                      // Handle dropdown value change
                      Recovery = value;
                    },
                    validator: (value) {
                      // Add validation logic here
                      if (value == null || value.isEmpty) {
                        return 'Please select an option';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 32.0),
                  child: Text(
                    "Accepted Food Items:",
                    style: TextStyle(
                      color: Color(0xFF201F24),
                      fontFamily: 'Outfit',
                      fontSize: 18.0,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 1.8,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16.0),
                  child: Container(
                    height: 200.0,
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.all(10.0),
                          width: 160.0,
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          decoration: BoxDecoration(
                            color: Colors.white, // Background color
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
                              Center(
                                child: Image.asset(
                                  data[index]['img'],
                                  width: 70.0,
                                  height: 80.0,
                                ),
                              ),
                              const SizedBox(height: 8.0),
                              Column(children: [
                                Text(
                                  data[index]['category'],
                                  style: const TextStyle(
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ]),
                              const SizedBox(
                                height: 2.0,
                              ),
                              FloatingActionButton(
                                onPressed: () {},
                                backgroundColor: Colors.orange,
                                shape: const CircleBorder(),
                                mini: true,
                                child: const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          SizedBox(height: 32.h),
                          Container(
                            // Description text field
                            width: 337.w,
                            height: 573.h,
                            decoration: ShapeDecoration(
                              color: Color(0xFFFEFEFE),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.r),
                              ),
                              shadows: const [
                                BoxShadow(
                                  color: Color(0x3F000000),
                                  blurRadius: 5,
                                  offset: Offset(0, 0),
                                  spreadRadius: 0,
                                )
                              ],
                            ),
                            child: Column(
                              children: [
                                Container(
                                  height: 399.h,
                                  child: TextFormField(
                                    controller: _descriptionController,
                                    maxLength: 5000,
                                    validator: (value) {
                                      if (value == "" || value == null) {
                                        return 'Please enter some text';
                                      } else if (value.length < 200) {
                                        return 'Please enter atleast 200 characters';
                                      } else if (value.length == 5000) {
                                        return 'Maximum limit reached';
                                      }
                                      return null;
                                    },
                                    maxLines: 15.h.toInt(),
                                    decoration: InputDecoration(
                                      counter: SizedBox.shrink(),
                                      contentPadding: EdgeInsets.all(10.r),
                                      filled: true,
                                      fillColor: Color(0xFFFEFEFE),
                                      hintText:
                                          "Description minimum of 200 Words",
                                      hintStyle: TextStyle(
                                        color: Color(0xFF201F24),
                                        fontSize: 14.sp,
                                        fontFamily: 'Outfit',
                                        fontWeight: FontWeight.w400,
                                        height: 0,
                                        letterSpacing: 1.40.sp,
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.r),
                                        borderSide: BorderSide.none,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.r),
                                        borderSide: BorderSide.none,
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.r),
                                        borderSide: BorderSide.none,
                                      ),
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Container(
                                    width: 284.w,
                                    color: Color(0xff000000),
                                    height: 1.h,
                                  ),
                                ),
                                SizedBox(
                                  height: 25.h,
                                ),
                                Row(
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 29.w),
                                        child: GestureDetector(
                                          onTap: () async {
                                            context.navigateTo(
                                                CameraScreenRoute());
                                          },
                                          child: Container(
                                            width: 103.35.w,
                                            height: 127.40.h,
                                            decoration: ShapeDecoration(
                                              color: Color(0xFFFFFBFB),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                              shadows: const [
                                                BoxShadow(
                                                  color: Color(0x3F000000),
                                                  blurRadius: 5,
                                                  offset: Offset(0, 0),
                                                  spreadRadius: 0,
                                                )
                                              ],
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  width: 45.50,
                                                  height: 45.50,
                                                  clipBehavior: Clip.antiAlias,
                                                  decoration: ShapeDecoration(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                    ),
                                                  ),
                                                  child: Icon(
                                                      Icons.add_circle_rounded,
                                                      size: 45.5.r,
                                                      color: Color(0xFF76A095)),
                                                ),
                                                SizedBox(height: 13.h),
                                                Container(
                                                  width: 88.40.w,
                                                  child: Text(
                                                    'Upload FCRA certificate',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      color: Color(0xFF76A095),
                                                      fontSize: 9.10.sp,
                                                      fontFamily: 'Poppins',
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      height: 0,
                                                      letterSpacing: 0.18.sp,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 29.w),
                                        child: GestureDetector(
                                          onTap: () async {
                                            context.navigateTo(
                                                CameraScreenRoute());
                                          },
                                          child: Container(
                                            width: 103.35.w,
                                            height: 127.40.h,
                                            decoration: ShapeDecoration(
                                              color: Color(0xFFFFFBFB),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                              shadows: const [
                                                BoxShadow(
                                                  color: Color(0x3F000000),
                                                  blurRadius: 5,
                                                  offset: Offset(0, 0),
                                                  spreadRadius: 0,
                                                )
                                              ],
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  width: 45.50,
                                                  height: 45.50,
                                                  clipBehavior: Clip.antiAlias,
                                                  decoration: ShapeDecoration(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                    ),
                                                  ),
                                                  child: Icon(
                                                      Icons.add_circle_rounded,
                                                      size: 45.5.r,
                                                      color: Color(0xFF76A095)),
                                                ),
                                                SizedBox(height: 13.h),
                                                Container(
                                                  width: 88.40.w,
                                                  child: Text(
                                                    'Upload Images of Trust',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      color: Color(0xFF76A095),
                                                      fontSize: 9.10.sp,
                                                      fontFamily: 'Poppins',
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      height: 0,
                                                      letterSpacing: 0.18.sp,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 25.h,
                          ),
                          CustomTextField(
                            label: 'Number of Volunteers Required',
                            controller: _volunteerController,
                            maxLength: 5, // Change the maximum length as needed
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter the number of volunteers required';
                              }
                              // You can add additional validation if needed
                              return null;
                            },
                            suffixIcon:
                                null, // You can add a suffix icon if needed
                          ),
                          SizedBox(
                            height: 25.h,
                          ),
                          GestureDetector(
                            onTap: () async {
                              if (_formKey.currentState!.validate()) {
                                // Process data.
                                await uploadPost();
                                context.pushRoute(const SuccessPageRoute());
                              }
                            },
                            child: Container(
                              width: 180.w,
                              height: 47.h,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 27.w, vertical: 6.h),
                              decoration: ShapeDecoration(
                                color: Color(0xFF5272FC),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.r),
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
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
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextFormField({
    required String label,
    TextEditingController? controller,
    Widget? suffixWidget,
  }) {
    return Container(
      width: 302.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.r),
        boxShadow: const [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 5,
            offset: Offset(0, 0),
            spreadRadius: 0,
          )
        ],
      ),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          contentPadding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
          suffixIcon: suffixWidget,
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please enter some text';
          }
          return null;
        },
        style: TextStyle(
          fontSize: 16.0, // Adjust the multiplier as needed
        ),
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

class CustomDropdownWidget extends StatelessWidget {
  final String label;
  final List<String> items;
  final String? value;
  final ValueChanged<String?> onChanged;
  final String? Function(String?)? validator;

  const CustomDropdownWidget({
    Key? key,
    required this.label,
    required this.items,
    required this.value,
    required this.onChanged,
    this.validator,
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
      child: DropdownButtonFormField<String>(
        value: value,
        items: items.map((item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(item),
          );
        }).toList(),
        onChanged: onChanged,
        validator: validator,
        decoration: InputDecoration(
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
        ),
      ),
    );
  }
}

class CustomMultiSelectChipDisplay<T> extends StatelessWidget {
  final List<T> items;
  final Function(T) onTap;

  const CustomMultiSelectChipDisplay({
    Key? key,
    required this.items,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiSelectChipDisplay(
      items: items.map((e) => MultiSelectItem(e, e.toString())).toList(),
      onTap: (value) {
        onTap(value);
      },
      chipColor: Colors.blue, // customize the chip color
      textStyle: TextStyle(color: Colors.white), // customize the text style
      icon: Icon(Icons.cancel), // customize the delete icon
    );
  }
}
