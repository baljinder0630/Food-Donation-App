import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_donation_app/Pages/Donate/Widgets/custom_alert_dialog.dart';
import 'package:food_donation_app/Pages/Donate/Widgets/custom_subheading.dart';
import 'package:food_donation_app/Pages/Donate/Widgets/your_donated_items.dart';
import 'package:food_donation_app/Provider/donateRequestProvider.dart';
import 'package:food_donation_app/constants.dart';
import 'package:food_donation_app/Pages/Donate/data/categories_data.dart';

@RoutePage()
class FoodCategoryForm extends ConsumerStatefulWidget {
  const FoodCategoryForm({super.key});

  @override
  ConsumerState<FoodCategoryForm> createState() => _FoodCategoryFormState();
}

class _FoodCategoryFormState extends ConsumerState<FoodCategoryForm> {
  TextEditingController foodController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController imagePathController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ref.watch(donationRequestProvider);
    final foodCategories =
        ref.watch(donationRequestProvider.notifier).getFoodCategories();
    for (int i = 0; i < foodCategories.length; i++) {
      print(foodCategories[i].imageFile?.path);
    }
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.fromLTRB(0.0, 40.h, 0.0, 0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 200.h,
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: const Center(child: Text("Space for some image")),
                ),
                Subheading(text: 'Select Food Category'),
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
                  child: Wrap(
                    spacing: 10.0,
                    runSpacing: 20.0,
                    children: List.generate(
                      data.length,
                      (index) => Container(
                        width: MediaQuery.of(context).size.width *
                            0.4, // Adjust width as needed
                        height: 200.h, // Adjust height as needed
                        decoration: BoxDecoration(
                          color: Colors.white, // Background color
                          borderRadius: BorderRadius.circular(20.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: InkWell(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return DonationConfirmationDialog(
                                  category: data[index]['category'],
                                  foodController: foodController,
                                  quantityController: quantityController,
                                  imageController: imagePathController,
                                  updateFoodCategory: (String foodName,
                                      String quantity,
                                      File img,
                                      WidgetRef ref) {
                                    ref
                                        .read(donationRequestProvider.notifier)
                                        .updateFoodCategory(
                                            foodName, quantity, img);
                                  },
                                  ref: ref,
                                );
                              },
                            );
                          },
                          child: Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  gradient: const RadialGradient(
                                    colors: [Colors.white, primaryColor],
                                    radius: 1.0,
                                    stops: [0.0, 1.0],
                                    center: Alignment.center,
                                  ),
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    data[index]['img'],
                                    width: 60,
                                    height: 80,
                                    fit: BoxFit.contain,
                                  ),
                                  SizedBox(height: 8.0.h),
                                  Center(
                                    child: Text(
                                      data[index]['category'],
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 8.0.h),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                foodCategories.isNotEmpty
                    ? YourDonatedItems(
                        foodCategories: foodCategories,
                        editFoodCategory: (int index, String foodName,
                            String quantity, File img, WidgetRef ref) {
                          ref
                              .read(donationRequestProvider.notifier)
                              .editFoodCategory(index, foodName, quantity, img);
                        },
                        deleteFoodCategory: (index) {
                          ref
                              .read(donationRequestProvider.notifier)
                              .deleteFoodCategory(index);
                        },
                        ref: ref)
                    : Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
