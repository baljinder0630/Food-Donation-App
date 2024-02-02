import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_donation_app/Pages/Donate/Widgets/actionbutton.dart';
import 'package:food_donation_app/Pages/Donate/Widgets/custom_text_form_field.dart';

class DonationConfirmationDialog extends StatelessWidget {
  final String category;
  final TextEditingController foodController;
  final TextEditingController quantityController;
  final WidgetRef ref;
  final void Function(String foodName, String quantity, WidgetRef ref)
      updateFoodCategory;

  const DonationConfirmationDialog(
      {Key? key,
      required this.category,
      required this.foodController,
      required this.quantityController,
      required this.updateFoodCategory,
      required this.ref})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Donate $category?',
        style: const TextStyle(fontSize: 20.0),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomTextFormField(
              hintText: 'Food Type', controller: foodController),
          SizedBox(height: 10.0),
          CustomTextFormField(
              hintText: 'Quantity',
              controller: quantityController,
              numericKeyboard: true)
        ],
      ),
      actions: <Widget>[
        ActionButton(
            text: 'Cancel',
            onPressed: () {
              Navigator.of(context).pop();
            }),
        ActionButton(
          text: 'Donate',
          onPressed: () {
            updateFoodCategory(
                foodController.text, quantityController.text, ref);
            Navigator.of(context).pop();
          },
        )
      ],
    );
  }
}
