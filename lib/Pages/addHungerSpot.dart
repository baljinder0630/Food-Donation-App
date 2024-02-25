import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'dart:ui';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_donation_app/Pages/Community/Widgets/myBackButton.dart';
import 'package:food_donation_app/Pages/Donate/Widgets/custom_subheading.dart';
import 'package:food_donation_app/Pages/Donate/Widgets/custom_text_form_field.dart';
import 'package:food_donation_app/Pages/constants/constants.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

@RoutePage()
class HungerSpotPage extends StatefulWidget {
  @override
  _HungerSpotPageState createState() => _HungerSpotPageState();
}

class _HungerSpotPageState extends State<HungerSpotPage> {
  final streetController = TextEditingController();
  final landMarkController = TextEditingController();
  final districtController = TextEditingController();
  final pinCodeController = TextEditingController();
  final plotNoController = TextEditingController();
  bool _isUploading = false;

  final _picker = ImagePicker();
  bool _saveButtonClicked = false;
  File? _imageFile;

  final _formKey = GlobalKey<FormState>();

  Future<void> _uploadDocument() async {
    setState(() {
      _isUploading = true;
    });

    try {
      Reference storageReference = FirebaseStorage.instance
          .ref()
          .child('hungerSpotDocuments/${_imageFile!.path.split('/').last}');
      UploadTask uploadTask = storageReference.putFile(_imageFile!);
      await uploadTask.whenComplete(() => null);

      String documentURL = await storageReference.getDownloadURL();

      await FirebaseFirestore.instance.collection('hungerSpot').add({
        'plotNo': plotNoController.text.trim(),
        'street': streetController.text.trim(),
        'landmark': landMarkController.text.trim(),
        'district': districtController.text.trim(),
        'pinCode': pinCodeController.text.trim(),
        'documentURL': documentURL.trim(),
      });

      if (mounted && context != null) {
        setState(() {
          _isUploading = false;
          streetController.clear();
          landMarkController.clear();
          districtController.clear();
          pinCodeController.clear();
          plotNoController.clear();
          _imageFile = null;
        });
      }

      showSuccessDialog();
    } catch (e) {
      print('Error uploading document: $e');
      setState(() {
        _isUploading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Error uploading document. Please try again.'),
        duration: Duration(seconds: 3),
      ));
    }
  }

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
            toolbarColor: green,
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
        setState(() {
          _imageFile = File(croppedFile.path);
          _saveButtonClicked = false;
        });
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
                leading: Icon(Icons.camera_alt, color: green),
                title: Text("Camera", style: TextStyle(color: green)),
              ),
              ListTile(
                onTap: () async {
                  await _getImage(ImageSource.gallery);
                  Navigator.pop(context);
                },
                leading: Icon(Icons.photo, color: green),
                title: Text("Gallery", style: TextStyle(color: green)),
              ),
              SizedBox(height: 20.h)
            ],
          ),
        );
      },
    );
  }

  imagePreview() {
    showGeneralDialog(
      barrierDismissible: true,
      barrierLabel: '',
      context: context,
      pageBuilder: (context, anim1, anim2) => BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
        child: SimpleDialog(
          title: Text(
            'Preview',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
          children: [
            Container(
              padding: EdgeInsets.all(16.0.r),
              child: Hero(
                tag: 'PostImage',
                child: Image.file(_imageFile!),
              ),
            ),
            TextButton(
                onPressed: () {
                  setState(() {
                    _imageFile = null;
                  });
                  context.popRoute();
                },
                child: Text("Remove"))
          ],
        ),
      ),
    );
  }

  showSuccessDialog() {
    showGeneralDialog(
        context: context,
        barrierDismissible: true,
        barrierLabel: '',
        pageBuilder: (context, ani1, ani2) {
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: SimpleDialog(
              elevation: 0,
              backgroundColor: Colors.transparent,
              children: [
                Container(
                  width: 378.w,
                  padding: EdgeInsets.all(19.20.r),
                  decoration: ShapeDecoration(
                    color: Color(0xFFFEFEFE),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28.80.r),
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
                        'Success',
                        style: TextStyle(
                          color: Color(0xFF201F24),
                          fontSize: 19.20.sp,
                          fontFamily: 'Outfit',
                          fontWeight: FontWeight.w600,
                          height: 0,
                          letterSpacing: 0.38.sp,
                        ),
                      ),
                      SizedBox(height: 19.20.h),
                      Image.asset(
                        "lib/assets/Community/PostSuccessfully.png",
                        fit: BoxFit.contain,
                      ),
                      SizedBox(height: 19.20.h),
                      Container(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'THANKYOU',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF5272FC),
                                fontSize: 19.20.sp,
                                fontStyle: FontStyle.italic,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w800,
                                height: 0,
                                letterSpacing: 4.03.sp,
                              ),
                            ),
                            SizedBox(height: 9.60.h),
                            SizedBox(
                              width: 323.52.w,
                              child: Text(
                                '"HOPE IS LIKE A FLAME; IT CAN NEVER BE EXTINGUISHED, EVEN IN THE DARKEST OF TIMES." WE HOPE YOU GET A BETTER SUPPORT',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF201F24),
                                  fontSize: 13.44.sp,
                                  fontFamily: 'Outfit',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                  letterSpacing: 0.54.sp,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 19.20.h),
                      Text(
                        'Further Notifications Will be Updated',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF201F24),
                          fontSize: 13.44.sp,
                          fontFamily: 'Outfit',
                          fontWeight: FontWeight.w400,
                          height: 0,
                          letterSpacing: 0.54.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        shadowColor: Colors.transparent,
        foregroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        leading: Align(alignment: Alignment.centerRight, child: MyBackButton()),
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.fromLTRB(0.0, 40.h, 0.0, 0.0),
        child: Column(
          children: [
            Container(
              height: 250.h,
              width: MediaQuery.of(context).size.width * 0.6,
              child: const Center(child: Text("Space for some image")),
            ),
            Subheading(text: 'Add Hunger Spot Details'),
            Container(
              margin:
                  const EdgeInsets.symmetric(horizontal: 7.0, vertical: 30.0),
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
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
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    CustomTextFormField(
                      hintText: "Plot No",
                      controller: plotNoController,
                      numericKeyboard: true,
                      onEditingComplete: () {
                        FocusScope.of(context).nextFocus();
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Plot no';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10.h),
                    CustomTextFormField(
                      hintText: "Street Name",
                      controller: streetController,
                      onEditingComplete: () {
                        FocusScope.of(context).nextFocus();
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Steet Name';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10.h),
                    CustomTextFormField(
                      hintText: "Landmark",
                      controller: landMarkController,
                      onEditingComplete: () {
                        FocusScope.of(context).nextFocus();
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter landmark';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: CustomTextFormField(
                            hintText: "District",
                            controller: districtController,
                            onEditingComplete: () {
                              FocusScope.of(context).nextFocus();
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter district';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Expanded(
                          child: CustomTextFormField(
                            hintText: "PinCode",
                            numericKeyboard: true,
                            controller: pinCodeController,
                            onEditingComplete: () {
                              FocusScope.of(context).nextFocus();
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter pincode';
                              } else if (value.length != 6) {
                                return 'Please enter valid pincode';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 29.w),
                          child: GestureDetector(
                            onTap: () {
                              showCameraOptions();
                            },
                            child: Container(
                              width: 103.35.w,
                              height: 127.40.h,
                              decoration: ShapeDecoration(
                                color: Color(0xFFFFFBFB),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                shadows: [
                                  BoxShadow(
                                    color:
                                        _saveButtonClicked && _imageFile == null
                                            ? Colors.red
                                            : Color(0x3F000000),
                                    blurRadius: 5,
                                    offset: Offset(0, 0),
                                    spreadRadius: 0,
                                  )
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 45.50,
                                    height: 45.50,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: ShapeDecoration(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                    child: Icon(Icons.add_circle_rounded,
                                        size: 45.5.r, color: Color(0xFF76A095)),
                                  ),
                                  SizedBox(height: 13.h),
                                  Container(
                                    width: 88.40.w,
                                    child: Text(
                                      'Upload Image of Trust',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: _saveButtonClicked &&
                                                _imageFile == null
                                            ? Colors.red
                                            : Color(0xFF76A095),
                                        fontSize: 9.10.sp,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600,
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
                        _imageFile == null
                            ? SizedBox()
                            : Hero(
                                tag: 'PostImage',
                                child: GestureDetector(
                                  onTap: () {
                                    imagePreview();
                                  },
                                  child: Container(
                                      width: 125.r,
                                      height: 125.r,
                                      margin: EdgeInsets.only(left: 29.w),
                                      decoration: ShapeDecoration(
                                        image: DecorationImage(
                                          image: FileImage(_imageFile!),
                                          fit: BoxFit.cover,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15.r),
                                        ),
                                        shadows: const [
                                          BoxShadow(
                                            color: Color(0x3F000000),
                                            blurRadius: 5,
                                            offset: Offset(0, 0),
                                            spreadRadius: 0,
                                          )
                                        ],
                                      )),
                                ),
                              )
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Center(
                      child: ElevatedButton(
                        onPressed: _isUploading
                            ? null
                            : () {
                                setState(() {
                                  _saveButtonClicked = true;
                                });
                                if (_formKey.currentState!.validate() &&
                                    _imageFile != null) {
                                  _uploadDocument();
                                }
                              },
                        child: _isUploading
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
                            : Text(
                                'Submit',
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
