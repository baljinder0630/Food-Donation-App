import 'package:flutter/material.dart';
import 'package:food_donation_app/Pages/Donate/Widgets/custom_text_form_field.dart';

void _showFoodInputDialog(BuildContext context, String category) {
  String foodType = '';
  String quantity = '';
  TextEditingController foodController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.grey.withOpacity(0.2),
        title: Text('Donate ${category}?'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomTextFormField(hintText: 'Food', controller: foodController),
            // TextField(
            //   decoration: const InputDecoration(labelText: 'Quantity'),
            //   onChanged: (value) {
            //     quantity = value;
            //   },
            // ),
            CustomTextFormField(
                hintText: 'Quantity', controller: quantityController)
          ],
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              print('Food Type: $foodType, Quantity: $quantity');
              Navigator.of(context).pop();
            },
            child: Text('Donate'),
          ),
        ],
      );
    },
  );
}
