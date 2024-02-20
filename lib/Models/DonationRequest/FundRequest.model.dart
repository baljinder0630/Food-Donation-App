import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class FundDonationRequestModel {
  final String uid;
  final String donationAmount;
  final String transactionId;
  final String status;
  final Timestamp createdTime;

  FundDonationRequestModel(
      {required this.uid,
      required this.donationAmount,
      required this.transactionId,
      required this.status,
      required this.createdTime});

  factory FundDonationRequestModel.fromJson(Map<String, dynamic> json) {
    return FundDonationRequestModel(
        // Generate a new id if not provided
        uid: json['uid'] ?? '',
        donationAmount: json['donationAmount'] ?? '',
        transactionId: json['transactionId'] ?? '',
        status: json['status'] ?? 'initial',
        createdTime: json['createdTime'] ?? '');
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['uid'] = uid;
    data['donationAmount'] = donationAmount;
    data['transactionId'] = transactionId;
    data['status'] = status;
    data['createdTime'] = createdTime;
    return data;
  }

  FundDonationRequestModel copyWith(
      {String? id,
      String? uid,
      String? donationAmount,
      String? transactionId,
      String? status,
      Timestamp? createdTime}) {
    return FundDonationRequestModel(
        uid: uid ?? this.uid,
        donationAmount: donationAmount ?? this.donationAmount,
        transactionId: transactionId ?? this.transactionId,
        status: status ?? this.status,
        createdTime: createdTime ?? this.createdTime);
  }
}
