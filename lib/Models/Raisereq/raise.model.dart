import 'package:uuid/uuid.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Raisemodel {
  final String id;
  final String ngoName;
  final String requestType;
  final String mobileNumber;
  final String plotNo;
  final String streetNo;
  final String district;
  final String pincode;
  final String description;
  final String numberOfServings;
  final String requestsFulfilled;
  final Timestamp createdTime;
  final String raiseRequestStatus;
  final dynamic donationRequests;
  final dynamic ngoDetails;

  Raisemodel(
      {required this.id,
      required this.ngoName,
      required this.requestType,
      required this.mobileNumber,
      required this.plotNo,
      required this.streetNo,
      required this.district,
      required this.pincode,
      required this.description,
      required this.numberOfServings,
      required this.requestsFulfilled,
      required this.createdTime,
      required this.raiseRequestStatus,
      this.donationRequests,
      this.ngoDetails});

  factory Raisemodel.fromMap(Map<String, dynamic> json) {
    return Raisemodel(
        id: json['id'] ?? Uuid().v4(),
        // Generate a new id if not provided
        ngoName: json['ngoName'] ?? '',
        requestType: json['requestType'] ?? '',
        mobileNumber: json['mobileNumber'] ?? '',
        plotNo: json['plotNo'] ?? '',
        streetNo: json['streetNo'] ?? '',
        district: json['district'] ?? '',
        pincode: json['pincode'] ?? '',
        description: json['description'] ?? '',
        numberOfServings: json['numberOfServings'] ?? '',
        requestsFulfilled: json['requestsFulfilled'] ?? '',
        createdTime: json['createdTime'] ?? '',
        raiseRequestStatus: json['raiseRequestStatus'] ?? 'initial',
        donationRequests: json['donationRequests'] ?? '',
        ngoDetails: json['ngoDetails'] ?? '');
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'ngoName': ngoName,
      'requestType': requestType,
      'mobileNumber': mobileNumber,
      'plotNo': plotNo,
      'streetNo': streetNo,
      'district': district,
      'pincode': pincode,
      'description': description,
      'numberOfServings': numberOfServings,
      'requestsFulfilled': requestsFulfilled,
      'createdTime': createdTime,
      'raiseRequestStatus': raiseRequestStatus,
      'donationRequests': donationRequests,
      'ngoDetails': ngoDetails
    };
  }

  Raisemodel copyWith(
      {String? id,
      String? ngoName,
      String? requestType,
      String? mobileNumber,
      String? plotNo,
      String? streetNo,
      String? landmark,
      String? district,
      String? pincode,
      String? description,
      String? numberOfServings,
      String? requestsFulfilled,
      Timestamp? createdTime,
      String? raiseRequestStatus,
      dynamic donationRequests,
      dynamic ngoDetails}) {
    return Raisemodel(
        id: id ?? this.id,
        ngoName: ngoName ?? this.ngoName,
        requestType: requestType ?? this.requestType,
        mobileNumber: mobileNumber ?? this.mobileNumber,
        plotNo: plotNo ?? this.plotNo,
        streetNo: streetNo ?? this.streetNo,
        district: district ?? this.district,
        pincode: pincode ?? this.pincode,
        description: description ?? this.description,
        numberOfServings: numberOfServings ?? this.numberOfServings,
        requestsFulfilled: requestsFulfilled ?? this.requestsFulfilled,
        createdTime: createdTime ?? this.createdTime,
        raiseRequestStatus: raiseRequestStatus ?? this.raiseRequestStatus,
        donationRequests: donationRequests ?? this.donationRequests,
        ngoDetails: ngoDetails ?? this.ngoDetails);
  }
}
