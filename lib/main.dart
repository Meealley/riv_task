import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riv_task/features/todo/pages/homepage.dart';
import 'package:riv_task/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // static final defaultLightColorScheme =
  //     ColorScheme.fromSwatch(primarySwatch: Colors.blue);
  // static final defaultDarkColorScheme =
  //     ColorScheme.fromSwatch(
  //       brightness: Brightness.dark,
  //       primarySwatch: Colors.blue);

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
          home: const HomePage(),
        );
      },
    );
  }
}
