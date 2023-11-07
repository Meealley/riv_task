import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riv_task/common/utils/constants.dart';
import 'package:riv_task/common/widgets/appstyle.dart';
import 'package:riv_task/common/widgets/heightspacer.dart';
import 'package:riv_task/common/widgets/reusable_text.dart';
import 'package:riv_task/common/widgets/widthspacer.dart';

class BottomTitles extends StatelessWidget {
  final String text;
  final String text2;

  const BottomTitles({super.key, required this.text, required this.text2});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppConst.kWidth,
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Consumer(
              builder: (context, ref, child) {
                return Container(
                  height: 80,
                  width: 5,
                  decoration: BoxDecoration(
                    //TODO: add dynamic color
                    color: Colors.green,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                );
              },
            ),
            WidthSpacer(wdth: 10),
            Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ReusableText(
                    text: text,
                    style: appstyle(17, Colors.black, FontWeight.w300),
                  ),
                  HeightSpacer(hght: 10),
                  ReusableText(
                    text: text2,
                    style: appstyle(17, Colors.black, FontWeight.w300),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
