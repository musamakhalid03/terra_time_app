import 'package:flutter/material.dart';
import 'package:terra_time_app/routes/app_routes.dart';

class SplashController extends ChangeNotifier {
  void navigateToOnboarding(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.pushReplacementNamed(context, AppRoutes.onboardingView);
  }
}
