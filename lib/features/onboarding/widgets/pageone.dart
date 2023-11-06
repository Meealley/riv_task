import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:riv_task/common/utils/constants.dart';
import 'package:riv_task/common/widgets/appstyle.dart';
import 'package:riv_task/common/widgets/heightspacer.dart';
import 'package:riv_task/common/widgets/reusable_text.dart';

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: AppConst.kHeight,
        width: AppConst.kWidth,
        color: AppConst.kLight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 30.w,
              ),
              child: Image.asset(
                'assets/images/task_one.png',
              ),
            ),
            HeightSpacer(hght: 50),
            Column(
              children: [
                ReusableText(
                  text: "Stay ahead of your peers",
                  style: appstyle(25, Colors.black, FontWeight.w500),
                ),
                HeightSpacer(hght: 10),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 30.w,
                  ),
                  child: Text(
                    "Welcome, Do you want to create some tasks",
                    textAlign: TextAlign.center,
                    style: appstyle(17, Colors.black, FontWeight.normal),
                  ),
                )
              ],
            )
          ],
        ));
  }
}
