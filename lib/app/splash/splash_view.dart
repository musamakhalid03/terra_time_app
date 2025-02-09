import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:terra_time_app/app/splash/component/splash_logo.dart';
import 'package:terra_time_app/app/splash/splash_controller.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    final splashController =
        Provider.of<SplashController>(context, listen: false);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      splashController.navigateToOnboarding(context);
    });

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SplashLogo(),
          ],
        ),
      ),
    );
  }
}
