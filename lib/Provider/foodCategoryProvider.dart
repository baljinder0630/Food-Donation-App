// ignore_for_file: file_names

import 'package:flutter_riverpod/flutter_riverpod.dart';

class FoodCategory {
  String? name;
  String? quantity;

  FoodCategory({this.name, this.quantity});

  FoodCategory.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['name'] = name;
    data['quantity'] = quantity;
    return data;
  }

  FoodCategory copyWith({String? name, String? quantity}) {
    return FoodCategory(
      name: name ?? this.name,
      quantity: quantity ?? this.quantity,
    );
  }
}

class FoodCategoryNotifier extends StateNotifier<FoodCategory> {
  final StateNotifierProviderRef ref;
  FoodCategoryNotifier({required this.ref})
      : super(FoodCategory(name: '', quantity: ''));
}
