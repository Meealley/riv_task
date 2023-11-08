import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:riv_task/common/utils/constants.dart';
import 'package:riv_task/common/widgets/appstyle.dart';
import 'package:riv_task/common/widgets/heightspacer.dart';
import 'package:riv_task/common/widgets/reusable_text.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        body: SafeArea(
            child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              HeightSpacer(hght: AppConst.kHeight * 0.15),
              Padding(
                padding: const EdgeInsets.all(12),
                child: ReusableText(
                    text: "Enter the otp sent to your phone",
                    style: appstyle(18, Colors.black, FontWeight.w600)),
              ),
              HeightSpacer(hght: AppConst.kHeight * 0.1),
              Pinput(
                length: 4,
                onCompleted: (value) {
                  if (value.length == 4) {}
                },
                onSubmitted: (value) {
                  if (value.length == 4) {}
                },
              )
            ],
          ),
        )));
  }
}
