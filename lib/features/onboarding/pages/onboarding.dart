import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:riv_task/common/utils/constants.dart';
import 'package:riv_task/common/widgets/appstyle.dart';
import 'package:riv_task/common/widgets/reusable_text.dart';
import 'package:riv_task/common/widgets/widthspacer.dart';
import 'package:riv_task/features/onboarding/widgets/pageone.dart';
import 'package:riv_task/features/onboarding/widgets/pagetwo.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController pageController = PageController();

  @override
  void dispose() {
    pageController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            physics: AlwaysScrollableScrollPhysics(),
            controller: pageController,
            children: [PageOne(), PageTwo()],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20.w,
                vertical: 30.h,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          pageController.nextPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.ease);
                        },
                        child: Icon(
                          FontAwesome.chevron_circle_right,
                          size: 25,
                          color: AppConst.kBkDark,
                        ),
                      ),
                      WidthSpacer(wdth: 6),
                      ReusableText(
                        text: "Skip",
                        style: appstyle(
                          15,
                          AppConst.kBkDark,
                          FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
// pageController.initialPage
                    },
                    child: SmoothPageIndicator(
                      controller: pageController,
                      count: 2,
                      effect: JumpingDotEffect(
                          jumpScale: .7,
                          verticalOffset: 15,
                          activeDotColor: Colors.orangeAccent.shade700),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
