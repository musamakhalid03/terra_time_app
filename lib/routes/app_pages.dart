import 'package:flutter/material.dart';
import 'package:terra_time_app/app/bottom_nav_bar/bottom_nav_bar_view.dart';
import 'package:terra_time_app/app/clocks/clocks_view.dart';
import 'package:terra_time_app/app/home/home_view.dart';
import 'package:terra_time_app/app/onboarding/onboarding_view.dart';
import 'package:terra_time_app/app/search/search_view.dart';
import 'package:terra_time_app/app/search_result/search_result_view.dart';
import 'package:terra_time_app/app/setting/setting_view.dart';
import 'package:terra_time_app/app/splash/splash_view.dart';
import 'package:terra_time_app/routes/app_routes.dart';

class AppPages {
  static Route<dynamic> routes(RouteSettings setting) {
    switch (setting.name) {
      case AppRoutes.splashView:
        return MaterialPageRoute(builder: (_) => SplashView());
      case AppRoutes.onboardingView:
        return MaterialPageRoute(builder: (_) => OnboardingView());
      case AppRoutes.settingView:
        return MaterialPageRoute(builder: (_) => SettingView());
      case AppRoutes.bottomNavBar:
        return MaterialPageRoute(builder: (_) => BottomNavBarView());
      case AppRoutes.search:
        return MaterialPageRoute(builder: (_) => SearchView());
      case AppRoutes.searchResult:
        return MaterialPageRoute(builder: (_) => SearchResultView());
      case AppRoutes.home:
        return MaterialPageRoute(builder: (_) => HomeView());
      case AppRoutes.clocks:
        return MaterialPageRoute(builder: (_) => ClocksView());
    }
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              body: Center(child: Text('No route defined for ${setting.name}')),
            ));
  }
}
