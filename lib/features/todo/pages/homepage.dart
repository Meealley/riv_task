import 'package:flutter/material.dart';
import 'package:riv_task/common/widgets/appstyle.dart';
import 'package:riv_task/common/widgets/reusable_text.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ReusableText(
        text: "Home Page of Riverpod Todo",
        style: appstyle(17, Colors.purple, FontWeight.w500),
      )),
    );
  }
}
