import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_donation_app/Pages/constants/constants.dart';
import 'package:food_donation_app/Router/route.gr.dart';




import 'package:fl_chart/fl_chart.dart'; // Import the fl_chart package



class Contribution extends ConsumerStatefulWidget {
  const Contribution({super.key});
  @override
  ConsumerState<Contribution> createState() => _ContributionState();
}

class _ContributionState extends ConsumerState<Contribution> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
                 child: Column(children: [
                 SizedBox(height: 50,),
                 Text(
                    'Your Contributions',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 18,
                        color: const Color(0xff1c140c),
                        fontFamily: 'EpilogueRoman-Bold',
                        fontWeight: FontWeight.bold),
                    maxLines: 9999,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height:20.h),
                   ScatterPlotExample(),
                   SizedBox(height: 20.h),

                  GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Display two items in each row
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0,
                    ),
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return buildGridItem(context, index);
                    },
                  ),

                ]))));
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

// class BarGraphWidget extends StatelessWidget {
//   final List<Map<String, dynamic>> dailyData = [
//     {'day': 'Mon', 'value': 10},
//     {'day': 'Tue', 'value': 15},
//     {'day': 'Wed', 'value': 12},
//     {'day': 'Thu', 'value': 18},
//     {'day': 'Fri', 'value': 14},
//     {'day': 'Sat', 'value': 16},
//     {'day': 'Sun', 'value': 11},
//   ];

//   @override
//   Widget build(BuildContext context) {
//     List<BarChartGroupData> barChartData = [];

//     for (int i = 0; i < dailyData.length; i++) {
//       Map<String, dynamic> data = dailyData[i];

//       barChartData.add(
//         BarChartGroupData(
//           x: i,
//           barsSpace: 8.0.r,
//           barRods: [
//             BarChartRodData(
//               y: 0, // Set a dummy value or adjust as needed
//               toY: data['value'].toDouble(),
//               color: Colors.green,
//               width: 20.0.r,
//             ),
//           ],
//         ),
//       );
//     }

//     return SizedBox(
//       width: MediaQuery.of(context)
//           .size
//           .width, // Set the width to the device width
//       child: Container(
//         height: 200.0.r,
//         child: BarChart(
//           BarChartData(
//             alignment: BarChartAlignment.spaceAround,
//             minY: 0, // Set the minY value
//             maxY: 20,
//             barGroups: barChartData,
//           ),
//         ),
//       ),
//     );
//   }
// }




class ScatterPlotExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Create a list of scatter spots
    final spots = [
      ScatterSpot(0, 5),
      ScatterSpot(10, 25),
      ScatterSpot(12, 75),
      ScatterSpot(13, 225),
      ScatterSpot(16, 50),
      ScatterSpot(24, 75),
      ScatterSpot(25, 100),
      ScatterSpot(34, 150),
      ScatterSpot(37, 10),
      ScatterSpot(45, 300),
      ScatterSpot(52, 15),
      ScatterSpot(56, 200),
    ];

    // Create a scatter chart data object
    final data = ScatterChartData(
      scatterSpots: spots,
      minX: 0,
      maxX: 60,
      minY: 0,
      maxY: 300,
      gridData: FlGridData(
        show: true,
        drawHorizontalLine: true,
        drawVerticalLine: true,
        horizontalInterval: 50,
        verticalInterval: 10,
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: Colors.black, width: 1),
      ),
      
      
    );

    // Create a scatter chart widget
    final chart = ScatterChart(
      data,
      swapAnimationDuration: Duration(milliseconds: 150),
      swapAnimationCurve: Curves.linear,
    );

    // Wrap the chart in a sized box
    return SizedBox(
      height: 300,
      width: 400,
      child: chart,
    );
  }
}
