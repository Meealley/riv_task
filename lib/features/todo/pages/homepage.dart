import 'package:flutter/material.dart';
import 'package:riv_task/common/utils/constants.dart';
import 'package:riv_task/common/widgets/appstyle.dart';
import 'package:riv_task/common/widgets/reusable_text.dart';

import '../../../common/widgets/heightspacer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ReusableText(
            text: "Home Page of Riverpod Todo",
            style: appstyle(17, AppConst.kGreen, FontWeight.w500),
          ),
          HeightSpacer(
            hght: 20,
          ),
          ReusableText(
            text: "Home Page of Riverpod Todo",
            style: appstyle(17, AppConst.kGreen, FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
