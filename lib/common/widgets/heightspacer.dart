import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeightSpacer extends StatelessWidget {
  final double hght;
  const HeightSpacer({
    super.key,
    required this.hght,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: hght.h,
    );
  }
}
