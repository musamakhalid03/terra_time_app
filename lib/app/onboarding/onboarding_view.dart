import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; 
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:terra_time_app/app/onboarding/onboarding_controller.dart';
import 'package:terra_time_app/routes/app_routes.dart';
import 'package:terra_time_app/utils/app_button/app_button.dart';
import 'package:terra_time_app/utils/app_constant/app_colors.dart';
import 'package:terra_time_app/utils/app_constant/images.dart';
import 'package:terra_time_app/utils/app_constant/text.dart';
import 'package:terra_time_app/utils/app_text/app_text.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => OnboardingController(),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Center(
            child: AppText(
              title: StringText.splashText,
              fontSize: 24.sp, 
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 29.w), 
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    ImageConst.onboardingPicture,
                    fit: BoxFit.scaleDown,
                    height: 290.h, 
                    width: 290.w, 
                  ),
                  Gap(17.h), 
                  AppText(
                    title: StringText.onboardingTitle,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    textAlign: TextAlign.center,
                  ),
                  Gap(19.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18.w), 
                    child: AppText(
                      title: StringText.onboardingSubTitle,
                      fontSize: 14.sp, 
                      height: 1.4,
                      fontWeight: FontWeight.w400,
                      textAlign: TextAlign.center,
                      color: AppColors.dimGray,
                    ),
                  ),
                  Gap(18.h), 
                  AppButton(
                    title: StringText.onboardingButtonTitle,
                    buttonColor: AppColors.deepPink,
                    buttonWidth: 0.8.w, 
                    ontap: () {
                      Navigator.pushReplacementNamed(
                          context, AppRoutes.bottomNavBar);
                    },
                  ),
                  Gap(19.h),
                  Center(
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: StringText.pleaseReadOur,
                        style: TextStyle(
                          color: AppColors.dimGray,
                          fontSize: 14.sp, 
                          fontWeight: FontWeight.w400,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: StringText.termsConditions,
                            style: TextStyle(
                              color: AppColors.deepPink,
                              decoration: TextDecoration.underline,
                              fontSize: 14.sp, 
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
