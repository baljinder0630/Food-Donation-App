import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MySpacer extends StatelessWidget {
  double? height;
  MySpacer({this.height, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: this.height ?? 20.h,
    );
  }
}
