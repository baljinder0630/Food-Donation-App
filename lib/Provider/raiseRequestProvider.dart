import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_donation_app/Models/Raisereq/raise.model.dart';
import 'package:food_donation_app/Provider/userProvider.dart';
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
          numberOfServings: '',
          description: '',
          requestsFulfilled: '',
          plotNo: '',
          requestType: '',
          mobileNumber: '',
          streetNo: '',
          district: '',
          pincode: '',
          createdTime: Timestamp.now(),
          raiseRequestStatus: 'initial',
        ));

  Future<bool> uploadFoodDonationRequest(
      String ngoName,
      String mobileNumber,
      String plotNo,
      String streetNo,
      String district,
      String pincode,
      String description,
      String numberOfServings,
      String requestsFulfilled) async {
    try {
      state = state.copyWith(raiseRequestStatus: 'processing');
      final ngoId = ref.read(authStateProvider.notifier).state.user!.uid;
      Raisemodel donationRequest = Raisemodel(
        id: ngoId,
        ngoName: ngoName,
        requestType: 'Food',
        mobileNumber: mobileNumber,
        plotNo: plotNo,
        streetNo: streetNo,
        district: district,
        pincode: pincode,
        description: description,
        numberOfServings: numberOfServings,
        requestsFulfilled: requestsFulfilled,
        createdTime: state.createdTime,
        raiseRequestStatus: state.raiseRequestStatus,
      );
      print(donationRequest);
      print(donationRequest.raiseRequestStatus);
      final id = const Uuid().v4();
      final doc = firestore.collection("ngoRequests").doc(id);
      print(donationRequest.toMap());
      await doc.set(donationRequest.toMap());
      await Future.delayed(Duration(seconds: 2));
      state = state.copyWith(raiseRequestStatus: 'processed');
      return true;
    } catch (e) {
      print(e);
      state = state.copyWith(raiseRequestStatus: 'error');
      return false;
    }
  }

  Future<bool> getDonationRequests() async {
    try {
      state = state.copyWith(raiseRequestStatus: 'processing');

      final collectionRef = firestore.collection("ngoRequests");

      final querySnapshot = await collectionRef.get();

      final List<Raisemodel> donationRequests = [];
      querySnapshot.docs.forEach((doc) {
        final data = doc.data();
        final donationRequest = Raisemodel(
          id: doc.id,
          ngoName: data['ngoName'] ?? '',
          requestType: data['requestType'] ?? '',
          mobileNumber: data['mobileNumber'] ?? '',
          plotNo: data['plotNo'] ?? '',
          streetNo: data['streetNo'] ?? '',
          district: data['district'] ?? '',
          pincode: data['pincode'] ?? '',
          description: data['description'] ?? '',
          numberOfServings: data['numberOfServings'] ?? '',
          requestsFulfilled: data['requestsFulfilled'] ?? '',
          createdTime: data['createdTime'] ?? Timestamp.now(),
          raiseRequestStatus: data['raiseRequestStatus'] ?? 'initial',
        );
        donationRequests.add(donationRequest);
      });

      state = state.copyWith(
        raiseRequestStatus: 'processed',
        donationRequests: donationRequests,
      );

      return true;
    } catch (e) {
      print(e);
      state = state.copyWith(raiseRequestStatus: 'error');
      return false;
    }
  }
}
