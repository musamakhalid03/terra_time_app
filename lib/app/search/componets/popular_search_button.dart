import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; 
import 'package:terra_time_app/utils/app_constant/app_colors.dart';
import 'package:terra_time_app/utils/app_text/app_text.dart';

class PopularSearchButton extends StatelessWidget {
  final String cityName;
  final VoidCallback onTap;

  const PopularSearchButton({
    super.key,
    required this.cityName,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: AppColors.brightGray,
          borderRadius: BorderRadius.circular(8.r),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFFD1DCEE).withOpacity(0.34),
              offset: Offset(0, 2.h), 
              blurRadius: 4.r,
            ),
          ],
        ),
        child: AppText(
          title: cityName,
          fontSize: 12.sp, 
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
