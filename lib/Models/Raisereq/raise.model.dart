import 'package:uuid/uuid.dart';

class raisemodel {
  final String id;
  final String ngoName;
  final String requestType;
  final String mobileNumber;
  final String plotNo;
  final String streetNo;
  final String landmark;
  final String district;
  final String pincode;

  raisemodel({
    required this.id,
    required this.ngoName,
    required this.requestType,
    required this.mobileNumber,
    required this.plotNo,
    required this.streetNo,
    required this.landmark,
    required this.district,
    required this.pincode,
  });

  factory raisemodel.fromMap(Map<String, dynamic> json) {
    return raisemodel(
      id: json['id'] ?? Uuid().v4(), // Generate a new id if not provided
      ngoName: json['ngoName'] ?? '',
      requestType: json['requestType'] ?? '',
      mobileNumber: json['mobileNumber'] ?? '',
      plotNo: json['plotNo'] ?? '',
      streetNo: json['streetNo'] ?? '',
      landmark: json['landmark'] ?? '',
      district: json['district'] ?? '',
      pincode: json['pincode'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'ngoName': ngoName,
      'requestType': requestType,
      'mobileNumber': mobileNumber,
      'plotNo': plotNo,
      'streetNo': streetNo,
      'landmark': landmark,
      'district': district,
      'pincode': pincode,
    };
  }
}
