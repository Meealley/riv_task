import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riv_task/common/utils/constants.dart';
import 'package:riv_task/common/widgets/appstyle.dart';
import 'package:riv_task/common/widgets/custom_btn.dart';
import 'package:riv_task/common/widgets/custom_textfield.dart';
import 'package:riv_task/common/widgets/heightspacer.dart';
import 'package:riv_task/common/widgets/reusable_text.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 30.w,
              ),
              child: Image.asset(
                'assets/images/login.webp',
              ),
            ),
            HeightSpacer(hght: 20),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 16.w),
              child: ReusableText(
                  text: "Please enter your phone number",
                  style: appstyle(17, Colors.black, FontWeight.w500)),
            ),
            HeightSpacer(hght: 20),
            CustomTextField(
                keyboardType: TextInputType.number,
                hintText: "Enter number",
                suffixIconColor: Colors.black,
                hintStyle: appstyle(15, Colors.black, FontWeight.w400)),
            HeightSpacer(hght: 20),
            CustomOutlnBtn(
                width: AppConst.kWidth * 0.9,
                height: AppConst.kHeight * 0.06,
                color: Colors.amber,
                color2: Colors.black,
                text: "Send Code",
                style: appstyle(15, Colors.black, FontWeight.normal))
          ],
        ),
      )),
    );
  }
}
