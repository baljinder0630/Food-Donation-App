// // ignore_for_file: file_names

// import 'package:flutter_riverpod/flutter_riverpod.dart';

// final foodCategoryProvider =
//     StateNotifierProvider<FoodCategoryNotifier, FoodCategory>(
//   (ref) => FoodCategoryNotifier(ref: ref),
// );

// class FoodCategory {
//   String? name;
//   String? quantity;

//   FoodCategory({
//     this.name,
//     this.quantity,
//   });

//   FoodCategory.fromJson(Map<String, dynamic> json) {
//     name = json['name'];
//     quantity = json['quantity'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = {};
//     data['name'] = name;
//     data['quantity'] = quantity;
//     return data;
//   }

//   FoodCategory copyWith(
//       {String? name,
//       String? quantity,
//       FoodCategoryStatus? foodCategoryStatus}) {
//     return FoodCategory(
//       name: name ?? this.name,
//       quantity: quantity ?? this.quantity,
//     );
//   }
// }

// class FoodCategoryNotifier extends StateNotifier<FoodCategory> {
//   final StateNotifierProviderRef ref;
//   FoodCategoryNotifier({required this.ref})
//       : super(FoodCategory(
//           name: '',
//           quantity: '',
//         ));
// }

// enum FoodCategoryStatus { initial, processing, completed }

// ignore_for_file: file_names

import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final foodCategoryProvider =
    StateNotifierProvider<FoodCategoryNotifier, FoodCategory>(
  (ref) => FoodCategoryNotifier(ref: ref),
);

class FoodCategory {
  String? name;
  String? quantity;
  File? imageFile;

  FoodCategory({
    this.name,
    this.quantity,
    this.imageFile,
  });

  FoodCategory.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    quantity = json['quantity'];
    if (json['imagePath'] != null) {
      imageFile = File(json['imagePath']);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['name'] = name;
    data['quantity'] = quantity;
    if (imageFile != null) {
      data['imagePath'] = imageFile!.path;
    }
    return data;
  }

  FoodCategory copyWith(
      {String? name,
      String? quantity,
      File? imageFile,
      FoodCategoryStatus? foodCategoryStatus}) {
    return FoodCategory(
      name: name ?? this.name,
      quantity: quantity ?? this.quantity,
      imageFile: imageFile ?? this.imageFile,
    );
  }
}

class FoodCategoryNotifier extends StateNotifier<FoodCategory> {
  final StateNotifierProviderRef ref;
  FoodCategoryNotifier({required this.ref})
      : super(FoodCategory(
          name: '',
          quantity: '',
          imageFile: null,
        ));
}

enum FoodCategoryStatus { initial, processing, completed }
