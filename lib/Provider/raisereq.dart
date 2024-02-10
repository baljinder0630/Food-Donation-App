import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import '../Models/Raisereq/raise.model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final raiseModelProvider = Provider<raisemodel>((ref) {
  return raisemodel(
    id: Uuid().v4(),
    ngoName: ref.watch(ngoNameProvider),
    requestType: ref.watch(selectedRequestTypeProvider),
    mobileNumber: ref.watch(mobileNumberProvider),
    plotNo: ref.watch(plotNoProvider),
    streetNo: ref.watch(streetNoProvider),
    landmark: ref.watch(landmarkProvider),
    district: ref.watch(districtProvider),
    pincode: ref.watch(pincodeProvider),
  );
});

final ngoNameProvider = StateProvider<String, String>((ref) => '');
final selectedRequestTypeProvider = StateProvider<String, String>((ref) => '');
final mobileNumberProvider = StateProvider<String, String>((ref) => '');
final plotNoProvider = StateProvider<String, String>((ref) => '');
final streetNoProvider = StateProvider<String, String>((ref) => '');
final landmarkProvider = StateProvider<String, String>((ref) => '');
final districtProvider = StateProvider<String, String>((ref) => '');
final pincodeProvider = StateProvider<String, String>((ref) => '');


final firebaseAuthProvider =
    Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);

// register others providers

final firebaseFirestoreProvider =
    Provider<FirebaseFirestore>((ref) => FirebaseFirestore.instance);

final firebaseStorageProvider =
    Provider<FirebaseStorage>((ref) => FirebaseStorage.instance);
