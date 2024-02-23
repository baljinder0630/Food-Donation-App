import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_donation_app/Provider/userProvider.dart';
import 'package:food_donation_app/Router/route.gr.dart';
import 'package:charts_flutter/flutter.dart' as charts; // Import charts_flutter

@RoutePage()
class Contributions extends ConsumerStatefulWidget {
  const Contributions({Key? key}) : super(key: key);

  @override
  ConsumerState<Contributions> createState() => _Contributions();
}

class _Contributions extends ConsumerState<Contributions> {
  @override
  Widget build(BuildContext context) {
    final data = [
      Contribution('Jan', 10),
      Contribution('Feb', 20),
      Contribution('Mar', 30),
      Contribution('Apr', 40),
    ];

    final series = [
      charts.Series<Contribution, String>(
        id: 'Contributions',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (Contribution contribution, _) => contribution.month,
        measureFn: (Contribution contribution, _) => contribution.amount,
        data: data,
      )
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Contributions'),
      ),
      body: Center(
        child: charts.BarChart(
          series,
          animate: true,
        ),
      ),
    );
  }
}

class Contribution {
  final String month;
  final int amount;

  Contribution(this.month, this.amount);
}
