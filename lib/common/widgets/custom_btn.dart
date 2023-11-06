import 'package:flutter/material.dart';
import 'package:riv_task/common/widgets/reusable_text.dart';

class CustomOutlnBtn extends StatelessWidget {
  final double width;
  final double height;
  final void Function()? onTap;
  final Color? color;
  final Color color2;
  final String text;
  final TextStyle style;

  const CustomOutlnBtn(
      {super.key,
      required this.width,
      required this.height,
      this.onTap,
      required this.color,
      required this.color2,
      required this.text,
      required this.style});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(
            Radius.circular(9),
          ),
          border: Border.all(width: 1, color: color2),
        ),
        child: Center(
          child: ReusableText(text: text, style: style),
        ),
      ),
    );
  }
}
