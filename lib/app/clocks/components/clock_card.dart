import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:terra_time_app/utils/app_constant/app_colors.dart';
import 'package:terra_time_app/utils/app_constant/images.dart';
import 'package:terra_time_app/utils/app_text/app_text.dart';

class ClockCard extends StatelessWidget {
  final city;
  final String? time;

  const ClockCard({
    super.key,
    this.city,
    this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: const Color(0x56D1DCEE),
            offset: const Offset(0, 8),
            blurRadius: 12,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                title: city["name"].toString(),
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              AppText(
                title: "${city["timezoneOffset"].toString()}HRS | GMT",
                fontSize: 12,
                color: AppColors.lightBlueColor,
                fontWeight: FontWeight.w400,
              ),
              Gap(25),
              Row(
                children: [
                  SvgPicture.asset(
                    ImageConst.stormClouds,
                  ),
                  Gap(6),
                  AppText(
                    title: city["weather"].toString(),
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.lightBlueColor,
                  ),
                ],
              ),
              AppText(
                title: city["temperature"].toString(),
                fontSize: 28,
                fontWeight: FontWeight.w400,
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              AppText(
                title: time!,
                fontSize: 32,
                fontWeight: FontWeight.w400,
              ),
              Gap(24),
              AppText(
                title: city["currency"].toString(),
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColors.lightBlueColor,
              ),
              AppText(
                title: city["exchangeRate"].toString(),
                fontSize: 24,
                fontWeight: FontWeight.w400,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
