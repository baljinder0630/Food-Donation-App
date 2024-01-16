import 'package:flutter/material.dart';
import 'package:food_donation_app/Pages/DonationRequest/requestCard.dart';


class DonationRequest extends StatefulWidget {
  const DonationRequest({Key? key}) : super(key: key);

  @override
  State<DonationRequest> createState() => _DonationRequestState();
}

class _DonationRequestState extends State<DonationRequest> {
  final List<String> filters = ["All", "Food Request", "Fund Request"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            return DonationCard();
          }),
    ));
  }
}

Widget filterCard() {
  final List<String> filters = ["All", "Food Request", "Fund Request"];
  return Container(
      child: Center(
    child: Text("${filters[0]}"),
  ));
}
