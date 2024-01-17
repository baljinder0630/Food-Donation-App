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
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: Text(
              "Donation Request",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.ellipsis),
            ),
          ),
          Container(
              child: Row(
            children: [
              Container(padding: EdgeInsets.all(10), child: Icon(Icons.search)),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: "Search Requests"),
                ),
              )
            ],
          )),
          Container(
            height: 60,
            child: filterCard(context),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              height: 500,
              child: ListView.builder(
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return DonationCard();
                  }),
            ),
          ),
        ],
      ),
    ));
  }
}

Widget filterCard(BuildContext context) {
  final List<String> filters = [
    "All",
    "Food Request",
    "Fund Request",
    "Food Request",
    "Fund Request"
  ];
  return ListView.builder(
    scrollDirection: Axis.horizontal,
    itemCount: filters.length,
    itemBuilder: (context, index) {
      return Container(
          // width: 30,
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.lightGreen),
          child: Center(
            child: Text("${filters[index]}"),
          ));
    },
  );
}
