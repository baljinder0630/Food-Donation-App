// ignore_for_file: file_names

import 'dart:io';
import 'package:food_donation_app/Models/DonationRequest/FoodCategory.model.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_donation_app/Models/DonationRequest/Request.model.dart';
import 'package:food_donation_app/Provider/foodCategoryProvider.dart';
import 'package:uuid/uuid.dart';

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
  final FirebaseFirestore firestore;
  DonationRequestNotifier({required this.ref})
      : firestore = FirebaseFirestore.instance,
        super(DonationRequest(
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

  DonationRequest updatePersonalDetails(
      String name,
      String phoneNumber,
      String plotNo,
      String streetController,
      String districtController,
      String pincodeController) {
    state = state.copyWith(
        name: name,
        phoneNumber: phoneNumber,
        plotNo: plotNo,
        streetController: streetController,
        districtController: districtController,
        pincodeController: pincodeController);

    return state;
  }

  DonationRequest editFoodCategory(
      int index, String foodName, String quantity, File img) {
    if (state.foodCategory == null ||
        index < 0 ||
        index >= state.foodCategory!.length) {
      return state;
    }

    String path = img.path;
    print("here: $path");
    FoodCategory updatedFoodCategory =
        FoodCategory(name: foodName, quantity: quantity, imageFile: img);

    final List<FoodCategory> updatedFoodCategories =
        List<FoodCategory>.from(state.foodCategory!);
    updatedFoodCategories[index] = updatedFoodCategory;

    state = state.copyWith(
        foodCategory: updatedFoodCategories,
        foodCategoryStatus: FoodCategoryStatus.processed);

    print("State changed");
    print(state.foodCategory?.length);

    return state;
  }

  void deleteFoodCategory(int index) {
    if (state.foodCategory != null && state.foodCategory!.isNotEmpty) {
      final updatedFoodCategories =
          List<FoodCategory>.from(state.foodCategory!);
      updatedFoodCategories.removeAt(index);
      state = state.copyWith(foodCategory: updatedFoodCategories);
    }
  }

  List<FoodCategory> getFoodCategories() {
    return state.foodCategory ?? [];
  }

  FoodCategoryStatus getStatus() {
    return state.foodCategoryStatus ?? FoodCategoryStatus.initial;
  }

  Future<bool> raiseRequest() async {
    try {
      state = state.copyWith(foodCategoryStatus: FoodCategoryStatus.processing);
      print(state.foodCategoryStatus);
      List<FoodCategoryModel> foodList = [];

      for (FoodCategory foodCategory in state.foodCategory ?? []) {
        String name = foodCategory.name!;
        String quantity = foodCategory.quantity!;
        String imgURL = await uploadImage(foodCategory.imageFile);
        FoodCategoryModel food =
            FoodCategoryModel(name: name, quantity: quantity, imageURL: imgURL);
        foodList.add(food);
      }

      DonationRequestModel donationRequestModel = DonationRequestModel(
        name: state.name,
        phoneNumber: state.phoneNumber,
        plotNo: state.plotNo,
        streetController: state.streetController,
        districtController: state.districtController,
        pincodeController: state.pincodeController,
        foodCategory: foodList,
        // postedTime: Timestamp.now()
      );

      final id = const Uuid().v4();
      final doc = firestore.collection("requests").doc(id);
      await doc.set(donationRequestModel.toJson());
      print("Data uploaded Successfully");

      state = state.copyWith(foodCategoryStatus: FoodCategoryStatus.processed);
      print(state.foodCategoryStatus);
      return true;
    } catch (e) {
      state = state.copyWith(foodCategoryStatus: FoodCategoryStatus.processed);
      print(e.toString());
      return false;
    }
  }

  Future<String> uploadImage(File? file) async {
    try {
      final ref =
          FirebaseStorage.instance.ref().child("request/${Uuid().v4()}");
      final uploadTask = ref.putFile(File(file!.path));
      final snapshot = await uploadTask.whenComplete(() => null);
      final url = await snapshot.ref.getDownloadURL();
      print(url);
      return url;
    } catch (e) {
      print(e.toString());
      return "";
    }
  }
}

enum FoodCategoryStatus { initial, processing, processed }
