import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:terra_time_app/utils/app_constant/app_colors.dart';
import 'package:terra_time_app/utils/app_constant/images.dart';
import 'package:terra_time_app/utils/app_constant/text.dart';
import 'package:terra_time_app/utils/app_text/app_text.dart';

class SplashLogo extends StatelessWidget {
  const SplashLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          ImageConst.splachLogo,
          height: 126.h,
          fit: BoxFit.scaleDown,
        ),
        Gap(6.28.h),
        AppText(
          title: StringText.splashText,
          color: AppColors.black,
          fontSize: 24.sp,
          fontWeight: FontWeight.w600,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
