import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_donation_app/Pages/Donate/Widgets/button.dart';
import 'package:food_donation_app/Pages/Donate/Widgets/custom_alert_dialog.dart';
import 'package:food_donation_app/Pages/Donate/Widgets/custom_subheading.dart';
import 'package:food_donation_app/Pages/Donate/Widgets/your_donated_items.dart';
import 'package:food_donation_app/Provider/donateRequestProvider.dart';
import 'package:food_donation_app/Router/route.gr.dart';
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

    return Stack(fit: StackFit.expand, children: [
      Scaffold(
        appBar: AppBar(
          toolbarHeight: 240.h,
          flexibleSpace: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(
                'assets/food_c.png',
                width: 450.h,
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              color: Color(0xFFE1E4E7),
              // padding: EdgeInsets.fromLTRB(0.0, 40.h, 0.0, 0.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    // margin: const EdgeInsets.symmetric(
                    //     horizontal: 7.0, vertical: 30.0),
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
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
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Wrap(
                      spacing: 10.0,
                      runSpacing: 20.0,
                      children: List.generate(
                        data.length,
                        (index) => Container(
                          width: MediaQuery.of(context).size.width * 0.43,
                          height: 200.h,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.r),
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
                              showModalBottomSheet(
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
                                          .read(
                                              donationRequestProvider.notifier)
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
                                      colors: [Colors.white, Colors.green],
                                      radius: 0.8,
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
                                      width: 60.w,
                                      height: 80.h,
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
                      ? Container(
                          margin: EdgeInsets.all(10.r),
                          child: YourDonatedItems(
                              foodCategories: foodCategories,
                              editFoodCategory: (int index, String foodName,
                                  String quantity, File img, WidgetRef ref) {
                                ref
                                    .read(donationRequestProvider.notifier)
                                    .editFoodCategory(
                                        index, foodName, quantity, img);
                              },
                              deleteFoodCategory: (index) {
                                ref
                                    .read(donationRequestProvider.notifier)
                                    .deleteFoodCategory(index);
                              },
                              ref: ref),
                        )
                      : Container(),
                  SizedBox(
                    height: 10.h,
                  ),
                  CustomButton(
                    text: 'Next',
                    onPressed: () {
                      if (foodCategories.isEmpty) {
                        Fluttertoast.showToast(
                            msg: "Please select at least one category.",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.green,
                            textColor: Colors.white,
                            fontSize: 16.0);
                        return;
                      } else {
                        context.pushRoute(const ConfirmationFormRoute());
                      }
                    },
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ]);
  }
}
