import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_donation_app/Models/DonationRequest/FundRequest.model.dart';
import 'package:food_donation_app/Provider/userProvider.dart';
import 'package:uuid/uuid.dart';

final fundRequestProvider =
    StateNotifierProvider<FundRequestNotifier, FundDonationRequestModel>(
  (ref) => FundRequestNotifier(ref: ref),
);

class FundRequestNotifier extends StateNotifier<FundDonationRequestModel> {
  final StateNotifierProviderRef ref;
  final FirebaseFirestore firestore;
  FundRequestNotifier({required this.ref})
      : firestore = FirebaseFirestore.instance,
        super(FundDonationRequestModel(
          uid: '',
          donationAmount: '',
          transactionId: '',
          status: '',
          createdTime: Timestamp.now(),
        ));

  Future<bool> uploadFundDonationRequest(
      String donationAmount, String transactionId) async {
    try {
      state = state.copyWith(status: 'processing');
      final userId = ref.read(authStateProvider.notifier).state.user!.uid;
      FundDonationRequestModel fundDonation = FundDonationRequestModel(
        uid: userId,
        donationAmount: donationAmount,
        transactionId: transactionId,
        createdTime: state.createdTime,
        status: state.status,
      );
      print(fundDonation);
      print(fundDonation.status);
      final id = const Uuid().v4();
      final doc = firestore.collection("fundRequests").doc(id);
      print(fundDonation.toJson());
      await doc.set(fundDonation.toJson());
      await Future.delayed(const Duration(seconds: 2));
      state = state.copyWith(status: 'processed');
      return true;
    } catch (e) {
      print(e);
      state = state.copyWith(status: 'error');
      return false;
    }
  }
}
