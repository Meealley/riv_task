import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WidthSpacer extends StatelessWidget {
  final double wdth;
  const WidthSpacer({super.key, required this.wdth});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: wdth.w,
    );
  }
}
