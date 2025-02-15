import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:terra_time_app/app/home/components/clock_widget.dart';
import 'package:terra_time_app/app/home/home_controller.dart';
import 'package:terra_time_app/utils/app_constant/app_colors.dart';
import 'package:terra_time_app/utils/app_constant/images.dart';
import 'package:terra_time_app/utils/app_constant/text.dart';
import 'package:terra_time_app/utils/app_text/app_text.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeController(),
      child: Consumer<HomeController>(
        builder: (context, homeController, child) {
          return Scaffold(
            backgroundColor: AppColors.ghostWhite,
            appBar: AppBar(
              backgroundColor: AppColors.ghostWhite,
              automaticallyImplyLeading: false,
              title: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w), 
                child: AppText(
                  title: StringText.homepage,
                  fontSize: 18.sp, 
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const ClockWidget(),
                    Gap(30.h), 
                    AppText(
                      title: homeController.capitalCity,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.pink,
                    ),
                    Gap(6.h),
                    AppText(
                      title: homeController.timeZone,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.lightBlueColor,
                    ),
                    Gap(40.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(
                                  ImageConst.stormClouds,
                                  width: 20.w, 
                                  height: 20.h,
                                ),
                                Gap(5.w), 
                                AppText(
                                  title: homeController.weather,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.lightBlueColor,
                                ),
                              ],
                            ),
                            Gap(5.h),
                            AppText(
                              title: "${homeController.temperature}°",
                              fontSize: 28.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            AppText(
                              title: StringText.dollar,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.lightBlueColor,
                            ),
                            Gap(5.h),
                            AppText(
                              title: homeController.currencyConvert +
                                  homeController.currency,
                              fontSize: 24.sp, 
                              fontWeight: FontWeight.w400,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
