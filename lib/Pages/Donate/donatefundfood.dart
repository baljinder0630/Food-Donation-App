import 'package:flutter/material.dart';

import 'package:food_donation_app/Router/route.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:food_donation_app/Pages/Community/Widgets/myAppBar.dart';


@RoutePage()
class LandingDonation extends StatefulWidget {
  const LandingDonation({super.key});

  @override
  State<LandingDonation> createState() => BeautifulScreen();
}

class BeautifulScreen extends State<LandingDonation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Beautiful Screen'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20),
            _buildAnimation(),
            SizedBox(height: 20),
            _buildDonationButtons(),
            SizedBox(height: 20),
            _buildSectionHeading('Our Other Features'),
            SizedBox(height: 20),
            _buildOtherFeatureButtons(),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildAnimation() {
    // Implement your animation widget here
    return Container(
      width: 200,
      height: 200,
      color: Colors.blue,
      child: Center(
        child: Text(
          'Animation',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildDonationButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: () {
            // Add functionality for fund donation
          },
          child: Text('Fund Donation'),
        ),
        ElevatedButton(
          onPressed: () {
            // Add functionality for food donation
          },
          child: Text('Food Donation'),
        ),
      ],
    );
  }

  Widget _buildSectionHeading(String title) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildOtherFeatureButtons() {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            // Add functionality for Community button
          },
          child: Text('Community'),
        ),
        ElevatedButton(
          onPressed: () {
            // Add functionality for Be a Volunteer button
          },
          child: Text('Be a Volunteer'),
        ),
        ElevatedButton(
          onPressed: () {
            // Add functionality for Your Contribution button
          },
          child: Text('Your Contribution'),
        ),
        ElevatedButton(
          onPressed: () {
            // Add functionality for Raise a Query button
          },
          child: Text('Raise a Query'),
        ),
        ElevatedButton(
          onPressed: () {
            // Add functionality for Chatbot button
          },
          child: Text('Chatbot'),
        ),
        ElevatedButton(
          onPressed: () {
            // Add functionality for Display Volunteers Around button
          },
          child: Text('Display Volunteers Around'),
        ),
      ],
    );
  }
}
