import 'package:food_donation_app/Models/DonationRequest/FoodCategory.model.dart';

class DonationRequestModel {
  String? name;
  String? phoneNumber;
  String? plotNo;
  String? streetController;
  String? districtController;
  String? pincodeController;
  List<FoodCategoryModel>? foodCategory;

  DonationRequestModel({
    this.name,
    this.phoneNumber,
    this.plotNo,
    this.streetController,
    this.districtController,
    this.pincodeController,
    this.foodCategory,
  });

  DonationRequestModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phoneNumber = json['phoneNumber'];
    plotNo = json['plotNo'];
    streetController = json['streetController'];
    districtController = json['districtController'];
    pincodeController = json['pincodeController'];
    if (json['foodCategory'] != null) {}
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

  DonationRequestModel copyWith({
    String? name,
    String? phoneNumber,
    String? plotNo,
    String? streetController,
    String? districtController,
    String? pincodeController,
    List<FoodCategoryModel>? foodCategory,
  }) {
    return DonationRequestModel(
      name: name ?? this.name,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      plotNo: plotNo ?? this.plotNo,
      streetController: streetController ?? this.streetController,
      districtController: districtController ?? this.districtController,
      pincodeController: pincodeController ?? this.pincodeController,
      foodCategory: foodCategory ?? this.foodCategory,
    );
  }
}
