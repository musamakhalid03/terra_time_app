import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:terra_time_app/app/search_result/search_result_controller.dart';
import 'package:terra_time_app/utils/app_constant/app_colors.dart';
import 'package:terra_time_app/utils/app_text/app_text.dart';

class ClockWeatherCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<SearchResultController>(
      builder: (context, clockController, child) {
        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.lightBlueShade,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFFD1DCEE).withOpacity(0.34),
                offset: const Offset(0, 8),
                blurRadius: 12,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        title: clockController.selectedCity,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                      AppText(
                        title: clockController.timeZone,
                        color: AppColors.lightBlueColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                      Gap(24),
                      Row(
                        children: [
                          SvgPicture.asset(
                            "assets/svg/rainingClouds.svg",
                            width: 24,
                            height: 24,
                          ),
                          Gap(8),
                          AppText(
                            title: clockController.weatherCondition,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: AppColors.lightBlueColor,
                          ),
                        ],
                      ),
                      AppText(
                        title: "${clockController.temperature}°",
                        fontSize: 32,
                        fontWeight: FontWeight.w400,
                      ),
                      AppText(
                        title: clockController.highLowTemp,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.lightBlueColor,
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      AppText(
                        title: clockController.currentTime,
                        fontSize: 32,
                        fontWeight: FontWeight.w400,
                      ),
                      Gap(30),
                      AppText(
                        title: clockController.currency,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: AppColors.lightBlueColor,
                      ),
                      Gap(10),
                      AppText(
                        title: clockController.currencyRate,
                        fontWeight: FontWeight.w400,
                        fontSize: 24,
                      ),
                    ],
                  ),
                ],
              ),
              Gap(15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: clockController.weeklyForecast.map((day) {
                  return Column(
                    children: [
                      AppText(
                        title: day["day"]!,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.lightBlueColor,
                      ),
                      SvgPicture.asset(
                        day["icon"]!,
                        fit: BoxFit.scaleDown,
                        width: 24,
                        height: 24,
                      ),
                      AppText(
                        title: day["temp"]!,
                        style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: AppColors.lightGrayishBlue),
                      ),
                    ],
                  );
                }).toList(),
              ),
              Gap(25),
              Image.asset("assets/png/Bitmap.png"),
            ],
          ),
        );
      },
    );
  }
}
