import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:terra_time_app/app/bottom_nav_bar/bottom_nav_bar_controller.dart';
import 'package:terra_time_app/app/clocks/clocks_controller.dart';
import 'package:terra_time_app/app/onboarding/onboarding_controller.dart';
import 'package:terra_time_app/app/search/search_controller.dart';
import 'package:terra_time_app/app/search_result/search_result_controller.dart';
import 'package:terra_time_app/app/setting/setting_controller.dart';
import 'package:terra_time_app/app/splash/splash_controller.dart';
import 'package:terra_time_app/routes/app_pages.dart';
import 'package:terra_time_app/routes/app_routes.dart';
import 'app/home/home_controller.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SplashController()),
        ChangeNotifierProvider(create: (_) => MainController()),
        ChangeNotifierProvider(create: (_) => ClockController()),
        ChangeNotifierProvider(create: (_) => HomeController()),
        ChangeNotifierProvider(create: (_) => OnboardingController()),
        ChangeNotifierProvider(create: (_) => SearchsController()),
        ChangeNotifierProvider(create: (_) => SearchResultController()),
        ChangeNotifierProvider(create: (_) => SettingsController()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Terra Time App',
          theme: ThemeData(
            textTheme: GoogleFonts.poppinsTextTheme(),
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          debugShowCheckedModeBanner: false,
          initialRoute: AppRoutes.splashView,
          onGenerateRoute: AppPages.routes,
        );
      },
    );
  }
}
