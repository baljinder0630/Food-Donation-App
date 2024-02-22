import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_donation_app/Pages/constants/constants.dart';
import 'package:food_donation_app/Router/route.gr.dart';
import 'package:charts_flutter/flutter.dart' as charts;


import 'package:fl_chart/fl_chart.dart';

@RoutePage()
class Contribution extends ConsumerStatefulWidget {
  const Contribution({super.key});
  @override
  ConsumerState<Contribution> createState() => _ContributionState();
}

class _ContributionState extends ConsumerState<Contribution> {
  @override
  Widget build(BuildContext context) {
    final data = [
      Contri('Jan', 10),
      Contri('Feb', 20),
      Contri('Mar', 30),
      Contri('Apr', 40),
    ];

    // Create a series object with the data and some properties
    final series = [
      charts.Series<Contri, String>(
        id: 'Contributions',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (Contri contri, _) => contri.month,
        measureFn: (Contri contri, _) => contri.amount,
        data: data,
      )
    ];

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 50),
              Text(
                'Your Contributions',
                textAlign: TextAlign.left,
                style: TextStyle(
                  decoration: TextDecoration.none,
                  fontSize: 18,
                  color: const Color(0xff1c140c),
                  fontFamily: 'EpilogueRoman-Bold',
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 9999,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 20.h),
              Padding(
                padding: EdgeInsets.all(16),
                child: charts.BarChart(
                  series, // Use charts.BarChart instead of BarChart
                  animate: true,
                ),
              ),
              SizedBox(height: 20.h),
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Display two items in each row
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                ),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return buildGridItem(context, index);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildGridItem(BuildContext context, int index) {
  // Define your data for each grid item
  List<Map<String, dynamic>> gridData = [
    {'category': 'Points', 'value': 500},
    {'category': 'Fund Donation', 'value': 10},
    {'category': 'Food Donation', 'value': 50},
    {'category': 'Ranking', 'value': 3},
  ];

  return Container(
    padding: EdgeInsets.all(10.0.r),
    decoration: BoxDecoration(
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 2,
          blurRadius: 5,
          offset: const Offset(0, 2),
        ),
      ],
      borderRadius: BorderRadius.circular(20.0.r),
    ),
    width: MediaQuery.of(context).size.width /
        2, // Set width to half of the screen
    height: 150.0.r, // Set the desired height
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          gridData[index]['category'],
          style: TextStyle(
            fontSize: 18.0.r,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8.0.r),
        Text(
          '${gridData[index]['value']}',
          style: TextStyle(
            fontSize: 24.0.r,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}

class Contri {
  final String month;
  final int amount;

  Contri(this.month, this.amount);
}