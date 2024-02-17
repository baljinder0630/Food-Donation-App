// import 'package:cloud_firestore/cloud_firestore.dart';
// import '../Models/Raisereq/raise.model.dart'; // Import your model

// Future<bool> uploadDonationRequest() async {
//   try {
//     raisemodel donationRequest = raisemodel(
//       id: Uuid().v4(),
//       ngoName: _ngoController.text,
//       requestType:
//           _selectedRequestType, // Assuming you have a variable to store the selected request type
//       mobileNumber: _mobileNumberController.text,
//       plotNo: _PlotnoController.text,
//       streetNo: _StreetnoController.text,
//       landmark: _LandmarkController.text,
//       district: _DistrictController.text,
//       pincode: _PincodeController.text,
//     );
//     final CollectionReference donationRequests =
//         FirebaseFirestore.instance.collection('donationRequests');

//     // Upload data to Firebase
//     await donationRequests.add(donationRequest.toMap());
//     return true;
//   } catch (e) {
//     print(e);
//     return false;
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_donation_app/Models/Raisereq/raise.model.dart';
import 'package:uuid/uuid.dart';

final raiseRequestProvider =
    StateNotifierProvider<RaiseRequestNotifier, Raisemodel>(
  (ref) => RaiseRequestNotifier(ref: ref),
);

class RaiseRequestNotifier extends StateNotifier<Raisemodel> {
  final StateNotifierProviderRef ref;
  final FirebaseFirestore firestore;
  RaiseRequestNotifier({required this.ref})
      : firestore = FirebaseFirestore.instance,
        super(Raisemodel(
            id: '',
            ngoName: '',
            plotNo: '',
            requestType: '',
            mobileNumber: '',
            streetNo: '',
            district: '',
            pincode: '',
            landmark: '',
            ));

  Future<bool> uploadDonationRequest(Raisemodel raise) async {
    try {
      // Raisemodel donationRequest = Raisemodel(
        // id: Uuid().v4(),
        // ngoName: _ngoController.text,
        // requestType:
        //     _selectedRequestType, // Assuming you have a variable to store the selected request type
        // mobileNumber: _mobileNumberController.text,
        // plotNo: _PlotnoController.text,
        // streetNo: _StreetnoController.text,
        // landmark: _LandmarkController.text,
        // district: _DistrictController.text,
        // pincode: _PincodeController.text,
      // );
      // final CollectionReference donationRequests =
          FirebaseFirestore.instance.collection('donationRequests');

      // Upload data to Firebase
      // await donationRequests.add(donationRequest.toMap());
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

}