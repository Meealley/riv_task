import 'package:country_picker/country_picker.dart';
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
  final TextEditingController phone = TextEditingController();
  Country country = Country(
      phoneCode: '234',
      countryCode: 'NGN',
      e164Sc: 0,
      geographic: true,
      level: 1,
      name: 'Nigeria',
      example: 'Nigeria',
      displayName: "Nigeria",
      displayNameNoCountryCode: 'NG',
      e164Key: "");

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
            const HeightSpacer(hght: 20),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 16.w),
              child: ReusableText(
                  text: "Please enter your phone number",
                  style: appstyle(17, Colors.black, FontWeight.w500)),
            ),
            const HeightSpacer(hght: 20),
            CustomTextField(
              preffixIcon: Container(
                padding: const EdgeInsets.all(13),
                child: GestureDetector(
                  onTap: () {
                    showCountryPicker(
                        context: context,
                        countryListTheme: CountryListThemeData(
                            backgroundColor: AppConst.kLight,
                            textStyle:
                                appstyle(15, Colors.black, FontWeight.normal),
                            bottomSheetHeight: AppConst.kHeight * 0.6,
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10))),
                        onSelect: (code) {
                          setState(() {});
                        });
                  },
                  child: ReusableText(
                    text: '${country.flagEmoji} + ${country.phoneCode}',
                    style: appstyle(15, Colors.black, FontWeight.w500),
                  ),
                ),
              ),
              controller: phone,
              // onChanged: ,
              keyboardType: TextInputType.number,
              hintText: "Enter your number",
              suffixIconColor: Colors.black,
              hintStyle: appstyle(
                15,
                Colors.black,
                FontWeight.w400,
              ),
            ),
            const HeightSpacer(hght: 30),
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
