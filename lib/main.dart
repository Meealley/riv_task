import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riv_task/common/utils/constants.dart';
import 'package:riv_task/features/onboarding/pages/onboarding.dart';
import 'package:riv_task/features/todo/pages/homepage.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      useInheritedMediaQuery: true,
      designSize: const Size(375, 825),
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
          title: "Rive Todo",
          theme: ThemeData(
              // scaffoldBackgroundColor: AppConst.kBkDark,
              // useMaterial3: true,
              ),
          debugShowCheckedModeBanner: false,
          // themeMode: ThemeMode.dark,
          home: OnboardingPage(),
        );
      },
    );
  }
}
