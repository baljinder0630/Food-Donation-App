import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_donation_app/Pages/constants/constants.dart';
import 'package:food_donation_app/Router/route.gr.dart';
import 'package:charts_flutter_new/flutter.dart' as charts;

class Contribution extends ConsumerStatefulWidget {
  const Contribution({Key? key}) : super(key: key);

  @override
  ConsumerState<Contribution> createState() => _ContributionState();
}

class _ContributionState extends ConsumerState<Contribution> {
  final List<NewBooks> data = [
    NewBooks(
        year: "2008",
        books: 500,
        barColor: charts.ColorUtil.fromDartColor(Colors.greenAccent)),
    NewBooks(
        year: "2009",
        books: 1200,
        barColor: charts.ColorUtil.fromDartColor(Colors.greenAccent)),
    NewBooks(
        year: "2010",
        books: 250,
        barColor: charts.ColorUtil.fromDartColor(Colors.greenAccent)),
    NewBooks(
        year: "2011",
        books: 800,
        barColor: charts.ColorUtil.fromDartColor(Colors.greenAccent)),
    NewBooks(
        year: "2012",
        books: 900,
        barColor: charts.ColorUtil.fromDartColor(Colors.greenAccent)),
    NewBooks(
        year: "2013",
        books: 750,
        barColor: charts.ColorUtil.fromDartColor(Colors.greenAccent)),
    NewBooks(
        year: "2014",
        books: 900,
        barColor: charts.ColorUtil.fromDartColor(Colors.greenAccent)),
  ];

  @override
  Widget build(BuildContext context) {
    List<charts.Series<NewBooks, String>> series = [
      charts.Series(
        id: "Subscribers",
        data: data,
        domainFn: (NewBooks series, _) => series.year,
        measureFn: (NewBooks series, _) => series.books,
        colorFn: (NewBooks series, _) => series.barColor,
      ),
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
                  fontSize: 18,
                  color: const Color(0xff1c140c),
                  fontFamily: 'EpilogueRoman-Bold',
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 20.h),
              Container(
                padding: EdgeInsets.only(
                    top: 20.0.h), // Adjust the top padding as needed
                height: 300,
                child: charts.BarChart(series, animate: true),
              ),
              SizedBox(height: 20.h),

              SizedBox(height: 20.h),
              Container(
                 padding: EdgeInsets.only(top: 20.0.h),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                  ),
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return buildGridItem(context, index);
                  },
                ),
              ),
              SizedBox(height: 20.h,),
              Text(
                'Contributions History',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 18,
                  color: const Color(0xff1c140c),
                  fontFamily: 'EpilogueRoman-Bold',
                  fontWeight: FontWeight.bold,
                ),
              ),
              Stack(
                children: [
                  Positioned.fill(
                    child: Image.asset(
                      'assets/chatbot_background.png',
                      fit: BoxFit.cover,
                    ),
                  ),

                  
                  

                ],
              )
              
              
               
              
            ],
          ),
        ),
      ),
    );
  }

  Widget buildGridItem(BuildContext context, int index) {
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
      width: MediaQuery.of(context).size.width / 2,
      height: 150.0.r,
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
}

class NewBooks {
  late final String year;
  late final int books;
  late final charts.Color barColor;

  NewBooks({
    required this.year,
    required this.books,
    required this.barColor,
  });
}
