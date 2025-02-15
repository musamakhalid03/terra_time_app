import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:terra_time_app/utils/app_constant/app_colors.dart';
import 'package:terra_time_app/utils/app_constant/text.dart';
import 'package:terra_time_app/utils/app_text/app_text.dart';

class UpgradePremiumCard extends StatelessWidget {
  const UpgradePremiumCard({
    super.key,
    this.upGradeButtononTap,
  });
  final VoidCallback? upGradeButtononTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        image: const DecorationImage(
          image: AssetImage('assets/png/BG.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppText(
                  title: StringText.upgradePremium,
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
                Gap(8.h),
                AppText(
                  title: StringText.upgradePremiumSubTitle,
                  color: AppColors.lightGrayishBlue,
                  fontSize: 12.sp, 
                  fontWeight: FontWeight.w400,
                ),
                Gap(16.h), 
                GestureDetector(
                  onTap: upGradeButtononTap,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w, 
                      vertical: 12.h, 
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.deepPink,
                      borderRadius: BorderRadius.circular(12.r), 
                    ),
                    child: AppText(
                      title: StringText.upgrade,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.white,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
