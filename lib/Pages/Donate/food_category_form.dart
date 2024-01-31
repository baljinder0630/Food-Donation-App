import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_donation_app/Pages/Donate/Widgets/custom_subheading.dart';
import 'package:food_donation_app/Pages/Donate/Widgets/food_category_grid.dart';
import 'package:food_donation_app/Pages/Donate/data/categories_data.dart';

@RoutePage()
class FoodCategoryForm extends StatefulWidget {
  const FoodCategoryForm({super.key});

  @override
  State<FoodCategoryForm> createState() => _FoodCategoryFormState();
}

class _FoodCategoryFormState extends State<FoodCategoryForm> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController plotNoController = TextEditingController();
  TextEditingController streetController = TextEditingController();
  TextEditingController districtController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
                    // child: Image.asset('images/food_categories.png'),
                    child: const Center(child: Text("Space for some image")),
                  ),
                  const Subheading(text: 'Select Food Category'),
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
                    child: Column(
                      children: [
                        Container(
                            height: MediaQuery.of(context).size.height * 0.7,
                            child: FoodCategoryGrid(data: data))
                      ],
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
