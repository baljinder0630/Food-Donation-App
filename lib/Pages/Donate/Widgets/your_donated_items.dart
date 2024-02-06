import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_donation_app/Pages/Donate/Widgets/custom_edit_dialog.dart';
import 'package:food_donation_app/Pages/Donate/Widgets/custom_subheading.dart';
import 'package:food_donation_app/Provider/donateRequestProvider.dart';
import 'package:food_donation_app/Provider/foodCategoryProvider.dart';

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
        Subheading(text: 'Your Donated Items'),
        Container(
          height: 245.0,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: widget.foodCategories.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(8),
              child: Container(
                width: 150,
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
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(10),
                      ),
                      child: Container(
                        height: 120,
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
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.foodCategories[index].name ?? '',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 4),
                          Row(children: [
                            const Text('Quantity: '),
                            Spacer(),
                            Text(widget.foodCategories[index].quantity ?? ''),
                          ]),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              InkWell(
                                  onTap: () {
                                    showDialog(
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
                                  child: const Text(
                                    'EDIT',
                                    style: TextStyle(color: Colors.green),
                                  )),
                              const Spacer(),
                              InkWell(
                                  onTap: () {
                                    widget.deleteFoodCategory(index);
                                  },
                                  child: const Text(
                                    'DELETE',
                                    style: TextStyle(color: Colors.red),
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
