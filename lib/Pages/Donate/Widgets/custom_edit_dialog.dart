import 'dart:io';
import 'package:image_cropper/image_cropper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_donation_app/Pages/Donate/Widgets/actionbutton.dart';
import 'package:food_donation_app/Pages/Donate/Widgets/custom_text_form_field.dart';
import 'package:image_picker/image_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DonationEditDialog extends StatelessWidget {
  final int index;
  final TextEditingController foodController;
  final TextEditingController quantityController;
  final TextEditingController imageController;

  final WidgetRef ref;
  final void Function(
          int index, String foodName, String quantity, File img, WidgetRef ref)
      editFoodCategory;

  DonationEditDialog({
    Key? key,
    required this.foodController,
    required this.quantityController,
    required this.editFoodCategory,
    required this.imageController,
    required this.index,
    required this.ref,
  }) : super(key: key);

  _cropImage(File imgFile) async {
    final croppedFile = await ImageCropper().cropImage(
        sourcePath: imgFile.path,
        aspectRatioPresets: Platform.isAndroid
            ? [
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio16x9
              ]
            : [
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio5x3,
                CropAspectRatioPreset.ratio5x4,
                CropAspectRatioPreset.ratio7x5,
                CropAspectRatioPreset.ratio16x9
              ],
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: "Image Cropper",
              toolbarColor: Colors.deepOrange,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
          IOSUiSettings(
            title: "Image Cropper",
          )
        ]);
    if (croppedFile != null) {
      imageCache.clear();
      File? imageFile = File(croppedFile.path);
      print(imageFile.path);
      return imageFile;
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final picker = ImagePicker();

    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Edit Food Details',
            style: TextStyle(fontSize: 20.0),
          ),
          CustomTextFormField(
              hintText: 'Food Type', controller: foodController),
          SizedBox(height: 10.0),
          CustomTextFormField(
              hintText: 'Quantity',
              controller: quantityController,
              numericKeyboard: true),
          const SizedBox(
            height: 10.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                'Upload image from',
                style: TextStyle(fontSize: 15.0),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey.withOpacity(0.5),
                    ),
                    child: IconButton(
                      onPressed: () async {
                        XFile? image =
                            await picker.pickImage(source: ImageSource.camera);
                        if (image != null) {
                          File imgFile = await _cropImage(File(image.path));
                          imageController.text = imgFile.path;
                        }
                      },
                      icon: const Icon(Icons.camera_alt),
                      color: Colors.black,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey.withOpacity(0.5),
                    ),
                    child: IconButton(
                      onPressed: () async {
                        XFile? image =
                            await picker.pickImage(source: ImageSource.gallery);
                        if (image != null) {
                          File imgFile = await _cropImage(File(image.path));
                          imageController.text = imgFile.path;
                        }
                      },
                      icon: const Icon(Icons.photo_library),
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                    ActionButton(
                        text: 'Cancel',
                        onPressed: () {
                          foodController.text = "";
                          quantityController.text = "";
                          imageController.text = "";
                          Navigator.of(context).pop();
                        }),
                    ActionButton(
                      text: 'Donate',
                      onPressed: () {
                        File img = File(imageController.text);
                        String foodType = foodController.text;
                        String quantity = quantityController.text;
                        if(imageController.text.trim().isEmpty||foodType.trim().isEmpty||quantity.trim().isEmpty){
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
                        editFoodCategory(
                            index, foodController.text, quantityController.text, img, ref);
                        foodController.text = "";
                        quantityController.text = "";
                        imageController.text = "";
                        Navigator.of(context).pop();
                      },
                    ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
