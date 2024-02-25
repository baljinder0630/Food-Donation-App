import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_donation_app/Pages/Community/Functions/toCamelCase.dart';
import 'package:food_donation_app/Pages/Donate/Widgets/custom_edit_dialog.dart';
import 'package:food_donation_app/Pages/Donate/Widgets/custom_subheading.dart';
import 'package:food_donation_app/Provider/foodCategoryProvider.dart';

import '../../constants/constants.dart';

class YourDonatedItems extends StatefulWidget {
  final List<FoodCategory> foodCategories;
  final void Function(
          int index, String foodName, String quantity, File img, WidgetRef ref)
      editFoodCategory;
  final void Function(int index) deleteFoodCategory;
  final WidgetRef ref;

  YourDonatedItems({
    Key? key,
    required this.foodCategories,
    required this.editFoodCategory,
    required this.deleteFoodCategory,
    required this.ref,
  }) : super(key: key);

  @override
  State<YourDonatedItems> createState() => _YourDonatedItemsState();
}

class _YourDonatedItemsState extends State<YourDonatedItems> {
  TextEditingController foodController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController imagePathController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            padding: EdgeInsets.all(15.r),
            child: Text(
              'Your Donated Items',
              style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w600),
            )),
        Container(
          height: 230.h,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: widget.foodCategories.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(8),
              child: Container(
                width: 160.w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(10.r),
                      ),
                      child: Container(
                        height: 120.h,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: FileImage(
                                widget.foodCategories[index].imageFile!),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.r),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            toCamelCase(
                              widget.foodCategories[index].name ?? '',
                            ),
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 4.h),
                          Row(children: [
                            const Text('Quantity: '),
                            const Spacer(),
                            Text(
                              toCamelCase(
                                  widget.foodCategories[index].quantity ?? ''),
                            ),
                          ]),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              InkWell(
                                  onTap: () {
                                    showModalBottomSheet(
                                        context: context,
                                        builder: (context) {
                                          return DonationEditDialog(
                                            index: index,
                                            foodController: foodController,
                                            quantityController:
                                                quantityController,
                                            imageController:
                                                imagePathController,
                                            editFoodCategory:
                                                widget.editFoodCategory,
                                            ref: widget.ref,
                                          );
                                        });
                                  },
                                  child: Text(
                                    'EDIT',
                                    style: TextStyle(color: green),
                                  )),
                              const Spacer(),
                              InkWell(
                                  onTap: () {
                                    widget.deleteFoodCategory(index);
                                  },
                                  child: Text(
                                    'DELETE',
                                    style: TextStyle(color: red1),
                                  ))
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
