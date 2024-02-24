import 'package:food_donation_app/Models/DonationRequest/FoodCategory.model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DonationRequestModel {
  String? name;
  String? phoneNumber;
  String? plotNo;
  String? streetController;
  String? districtController;
  Timestamp? postedTime;
  String? pincodeController;
  List<FoodCategoryModel>? foodCategory;
  // Timestamp? postedTime;

  DonationRequestModel(
      {this.name,
      this.phoneNumber,
      this.plotNo,
      this.streetController,
      this.districtController,
      this.pincodeController,
      this.foodCategory,
      this.postedTime});

  DonationRequestModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phoneNumber = json['phoneNumber'];
    plotNo = json['plotNo'];
    streetController = json['streetController'];
    districtController = json['districtController'];
    pincodeController = json['pincodeController'];
    postedTime = json['createdTime'];
    if (json['foodCategory'] != null) {}
    ;
  }

  // factory DonationRequestModel.fromJson(Map<String, dynamic> json) {
  //
  //   return DonationRequestModel(
  //       name: json['ngoName'] ?? '',
  //       phoneNumber: json['phoneNumber'] ?? '',
  //       plotNo: json['plotNo'] ?? '',
  //       streetController: json['streetController'] ?? '',
  //       districtController: json['districtController'] ?? '',
  //       pincodeController: json['pincodeController'] ?? '',
  //       // if (json['foodCategory'] != null) {},
  //       postedTime: json['createdTime'] ?? '');
  // }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['name'] = name;
    data['phoneNumber'] = phoneNumber;
    data['plotNo'] = plotNo;
    data['streetController'] = streetController;
    data['districtController'] = districtController;
    data['pincodeController'] = pincodeController;
    data['postedTime'] = postedTime;
    if (foodCategory != null) {
      data['foodCategory'] = foodCategory!.map((v) => v.toJson()).toList();
    }
    // data['postedTime'] = postedTime;
    return data;
    // return {
    //   'name': name,
    //   'phoneNumber': phoneNumber,
    //   'plotNo': plotNo,
    //   'streetController': streetController,
    //   'districtController': districtController,
    //   'pincodeController': pincodeController,
    //   'foodCategory': foodCategory,
    //   'postedTime': postedTime
    // };
  }

  DonationRequestModel copyWith(
      {String? name,
      String? phoneNumber,
      String? plotNo,
      String? streetController,
      String? districtController,
      String? pincodeController,
      List<FoodCategoryModel>? foodCategory,
      Timestamp? postedTime}) {
    return DonationRequestModel(
        name: name ?? this.name,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        plotNo: plotNo ?? this.plotNo,
        streetController: streetController ?? this.streetController,
        districtController: districtController ?? this.districtController,
        pincodeController: pincodeController ?? this.pincodeController,
        foodCategory: foodCategory ?? this.foodCategory,
        postedTime: postedTime ?? this.postedTime);
  }
}
