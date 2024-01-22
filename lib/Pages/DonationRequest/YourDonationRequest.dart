import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:auto_route/auto_route.dart';
import 'package:food_donation_app/Pages/Community/Widgets/myBackButton.dart';
import 'package:food_donation_app/Router/route.gr.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: DonationTrackingPage(),
//     );
//   }
// }

@RoutePage()
class DonationTrackingPage extends StatefulWidget {
  @override
  _DonationTrackingPageState createState() => _DonationTrackingPageState();
}

class _DonationTrackingPageState extends State<DonationTrackingPage> {
  List donations = [];

  Future fetchDonations() async {
    var url = Uri.parse('https://example.com/api/donations');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var items = json.decode(response.body);
      setState(() {
        donations = items;
      });
    } else {
      throw Exception('Failed to load donations');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchDonations();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tracking Donation'),
        leading: MyBackButton(),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: DonationCard(
                  donationId: '1',
                  status: 'Delivered',
                  pickedUpAddress: '123 Main St, City1',
                  inTransitAddress: '456 Transit St, City2',
                  deliveryAddress: '789 Delivery St, City3',
                  recipientName: 'John Doe',
                  recipientContact: '123-456-7890',
                  deliveryTime: 'Today at 2:00 PM',
                  donatedItems: ['Item 1', 'Item 2', 'Item 3'],
                ),
              ),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.all(16),
                child: DonationCard(
                  donationId: '2',
                  status: 'In Transit',
                  pickedUpAddress: '111 Pickup St, City A',
                  inTransitAddress: '222 Transit St, City B',
                  deliveryAddress: '333 Delivery St, City C',
                  recipientName: 'Jane Smith',
                  recipientContact: '987-654-3210',
                  deliveryTime: 'Tomorrow at 10:00 AM',
                  donatedItems: ['Item A', 'Item B', 'Item C'],
                ),
              ),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.all(16),
                child: DonationCard(
                  donationId: '3',
                  status: 'Pending',
                  pickedUpAddress: '999 Pickup St, City X',
                  inTransitAddress: '888 Transit St, City Y',
                  deliveryAddress: '777 Delivery St, City Z',
                  recipientName: 'Bob Johnson',
                  recipientContact: '555-123-4567',
                  deliveryTime: 'Next week at 3:00 PM',
                  donatedItems: ['Item X', 'Item Y', 'Item Z'],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DonationCard extends StatelessWidget {
  final String donationId;
  final String status;
  final String pickedUpAddress;
  final String inTransitAddress;
  final String deliveryAddress;
  final String recipientName;
  final String recipientContact;
  final String deliveryTime;
  final List<String> donatedItems;

  DonationCard({
    required this.donationId,
    required this.status,
    required this.pickedUpAddress,
    required this.inTransitAddress,
    required this.deliveryAddress,
    required this.recipientName,
    required this.recipientContact,
    required this.deliveryTime,
    required this.donatedItems,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.lightBlue,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 4,
                  ),
                  child: Text(
                    'Donation ID - #$donationId',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 4,
                  ),
                  child: Text(
                    status,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildDeliveryStatus(
                        'Picked Up',
                        pickedUpAddress,
                        true,
                      ),
                      _buildDeliveryStatus(
                        'In Transit',
                        inTransitAddress,
                        false,
                      ),
                      _buildDeliveryStatus(
                        'Yet to be Delivered',
                        deliveryAddress,
                        false,
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        recipientName,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(recipientContact),
                      SizedBox(height: 4),
                      Text(deliveryTime),
                      SizedBox(height: 16),
                      Text(
                        'Donated Items',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: donatedItems
                            .map((item) => Row(
                                  children: [
                                    Icon(
                                      Icons.check_circle,
                                      color: Colors.green,
                                    ),
                                    SizedBox(width: 8),
                                    Text(item),
                                  ],
                                ))
                            .toList(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDeliveryStatus(
    String title,
    String address,
    bool isFirst,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isFirst ? Colors.green : Colors.grey,
          ),
        ),
        SizedBox(height: 4),
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 4),
        Text(address),
        SizedBox(height: 16),
      ],
    );
  }
}
