import 'package:flutter/material.dart';
import 'package:food_donation_app/Pages/Donate/Widgets/custom_subheading.dart';
import 'package:food_donation_app/Provider/foodCategoryProvider.dart';

// class YourDonatedItems extends StatefulWidget {
//   final List<FoodCategory> foodCategories;
//   const YourDonatedItems({Key? key, required this.foodCategories})
//       : super(key: key);

//   @override
//   State<YourDonatedItems> createState() => _YourDonatedItemsState();
// }

// class _YourDonatedItemsState extends State<YourDonatedItems> {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Subheading(text: 'Your Donated Items'),
//         SizedBox(
//           height: 200,
//           child: ListView.builder(
//             scrollDirection: Axis.horizontal,
//             itemCount: widget.foodCategories.length,
//             itemBuilder: (context, index) => Padding(
//               padding: const EdgeInsets.all(8),
//               child: Container(
//                 width: 150,
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(10),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.grey.withOpacity(0.5),
//                       spreadRadius: 2,
//                       blurRadius: 5,
//                       offset: const Offset(0, 2),
//                     ),
//                   ],
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Container(
//                       width: 100,
//                       height: 100,
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         image: DecorationImage(
//                           fit: BoxFit.cover,
//                           image: FileImage(
//                               widget.foodCategories[index].imageFile!),
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(8),
//                       child: Text(
//                         widget.foodCategories[index].name ?? '',
//                         style: const TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                     Padding(
//                       padding:
//                           const EdgeInsets.only(left: 8, bottom: 8, right: 8),
//                       child: Text(widget.foodCategories[index].quantity ?? ''),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

class YourDonatedItems extends StatefulWidget {
  final List<FoodCategory> foodCategories;
  const YourDonatedItems({Key? key, required this.foodCategories})
      : super(key: key);

  @override
  State<YourDonatedItems> createState() => _YourDonatedItemsState();
}

class _YourDonatedItemsState extends State<YourDonatedItems> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Subheading(text: 'Your Donated Items'),
        SizedBox(
          height: 200,
          child: ListView.builder(
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
                        top:
                            Radius.circular(10), // Only top corners are rounded
                      ),
                      child: Container(
                        height: 120, // Set the height for the image section
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
                          SizedBox(height: 4),
                          Text(widget.foodCategories[index].quantity ?? ''),
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
