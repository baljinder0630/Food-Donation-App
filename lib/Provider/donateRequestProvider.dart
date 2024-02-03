// ignore_for_file: file_names

import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_donation_app/Provider/foodCategoryProvider.dart';

final donationRequestProvider =
    StateNotifierProvider<DonationRequestNotifier, DonationRequest>(
  (ref) => DonationRequestNotifier(ref: ref),
);

class DonationRequest {
  String? name;
  String? phoneNumber;
  String? plotNo;
  String? streetController;
  String? districtController;
  String? pincodeController;
  List<FoodCategory>? foodCategory;
  FoodCategoryStatus? foodCategoryStatus;

  DonationRequest({
    this.name,
    this.phoneNumber,
    this.plotNo,
    this.streetController,
    this.districtController,
    this.pincodeController,
    this.foodCategory,
    this.foodCategoryStatus,
  });

  DonationRequest.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phoneNumber = json['phoneNumber'];
    plotNo = json['plotNo'];
    streetController = json['streetController'];
    districtController = json['districtController'];
    pincodeController = json['pincodeController'];
    if (json['foodCategory'] != null) {
      foodCategory = <FoodCategory>[];
      json['foodCategory'].forEach((v) {
        foodCategory!.add(new FoodCategory.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['name'] = name;
    data['phoneNumber'] = phoneNumber;
    data['plotNo'] = plotNo;
    data['streetController'] = streetController;
    data['districtController'] = districtController;
    data['pincodeController'] = pincodeController;
    if (foodCategory != null) {
      data['foodCategory'] = foodCategory!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  DonationRequest copyWith({
    String? name,
    String? phoneNumber,
    String? plotNo,
    String? streetController,
    String? districtController,
    String? pincodeController,
    List<FoodCategory>? foodCategory,
    FoodCategoryStatus? foodCategoryStatus,
  }) {
    return DonationRequest(
        name: name ?? this.name,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        plotNo: plotNo ?? this.plotNo,
        streetController: streetController ?? this.streetController,
        districtController: districtController ?? this.districtController,
        pincodeController: pincodeController ?? this.pincodeController,
        foodCategory: foodCategory ?? this.foodCategory,
        foodCategoryStatus: foodCategoryStatus ?? this.foodCategoryStatus);
  }
}

class DonationRequestNotifier extends StateNotifier<DonationRequest> {
  final StateNotifierProviderRef ref;
  DonationRequestNotifier({required this.ref})
      : super(DonationRequest(
            name: '',
            phoneNumber: '',
            plotNo: '',
            streetController: '',
            districtController: '',
            pincodeController: '',
            foodCategory: [],
            foodCategoryStatus: FoodCategoryStatus.initial));

  DonationRequest updateFoodCategory(
      String foodName, String quantity, File img) {
    String path = img.path;
    print("here: $path");
    FoodCategory newFoodCategory =
        FoodCategory(name: foodName, quantity: quantity, imageFile: img);
    state = state.copyWith(foodCategoryStatus: FoodCategoryStatus.processing);

    final foodCategory = [...state.foodCategory!, newFoodCategory];

    state = state.copyWith(foodCategory: foodCategory);
    state = state.copyWith(foodCategoryStatus: FoodCategoryStatus.processed);
    print("State changed");
    print(state.foodCategory?.length);

    return state;
  }

  List<FoodCategory> getFoodCategories() {
    return state.foodCategory ?? [];
  }
}

enum FoodCategoryStatus { initial, processing, processed }
