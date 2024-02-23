import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_donation_app/Pages/Donate/Widgets/actionbutton.dart';

import 'package:food_donation_app/Pages/Donate/Widgets/custom_text_form_field.dart';
import 'package:food_donation_app/Provider/donateRequestProvider.dart';
import 'package:food_donation_app/constants.dart';

class FoodCategoryGrid extends StatelessWidget {
  final List<Map<dynamic, dynamic>> data;
  TextEditingController foodController = TextEditingController();
  TextEditingController quantityController = TextEditingController();

  FoodCategoryGrid({Key? key, required this.data}) : super(key: key);

  void updateFoodCategory(
      String foodName, String quantity, File imgFile, WidgetRef ref) {
    ref
        .watch(donationRequestProvider.notifier)
        .updateFoodCategory(foodName, quantity, imgFile);
  }

  void _showFoodInputDialog(BuildContext context, String category) {}

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 20.0,
      ),
      itemCount: data.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: [
              BoxShadow(
                color: Colors.green.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: InkWell(
            onTap: () {
              _showFoodInputDialog(context, data[index]['category']);
            },
            child: Stack(
              children: [
                // Gradient
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    gradient: const RadialGradient(
                      colors: [
                        Colors.white,
                        // Color.fromARGB(176, 255, 55, 0),

                        Colors.green,
                      ],
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
        );
      },
    );
  }
}
