import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:terra_time_app/utils/app_constant/app_colors.dart';
import 'package:terra_time_app/utils/app_constant/images.dart';
import 'package:terra_time_app/utils/app_text/app_text.dart';

class ClockCard extends StatelessWidget {
  final Map<String, dynamic>? city;
  final String? time;

  const ClockCard({
    super.key,
    this.city,
    this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w), 
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: const Color(0x56D1DCEE),
            offset: Offset(0, 8.h),
            blurRadius: 12.r,
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
                title: city!["name"].toString(),
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
              AppText(
                title: "${city!["timezoneOffset"].toString()}HRS | GMT",
                fontSize: 12.sp,
                color: AppColors.lightBlueColor,
                fontWeight: FontWeight.w400,
              ),
              Gap(25.h), 
              Row(
                children: [
                  SvgPicture.asset(
                    ImageConst.stormClouds,
                    width: 20.w,
                    height: 20.h, 
                  ),
                  Gap(6.w),
                  AppText(
                    title: city!["weather"].toString(),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.lightBlueColor,
                  ),
                ],
              ),
              AppText(
                title: city!["temperature"].toString(),
                fontSize: 28.sp,
                fontWeight: FontWeight.w400,
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              AppText(
                title: time!,
                fontSize: 32.sp, 
                fontWeight: FontWeight.w400,
              ),
              Gap(24.h),
              AppText(
                title: city!["currency"].toString(),
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.lightBlueColor,
              ),
              AppText(
                title: city!["exchangeRate"].toString(),
                fontSize: 24.sp, 
                fontWeight: FontWeight.w400,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
