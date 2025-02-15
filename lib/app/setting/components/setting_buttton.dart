import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; 
import 'package:flutter_svg/flutter_svg.dart';
import 'package:terra_time_app/utils/app_constant/app_colors.dart';
import 'package:terra_time_app/utils/app_text/app_text.dart';

class SettingButton extends StatelessWidget {
  final bool? value;
  final ValueChanged<bool?>? onChanged;
  final String? title;
  final bool? showSwitch;

  const SettingButton({
    super.key,
    this.value,
    this.onChanged,
    this.title,
    this.showSwitch = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 25.h), 
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppText(
            title: title.toString(),
            fontSize: 16.sp, 
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
          showSwitch == true
              ? SizedBox(
                  height: 18.h,
                  width: 18.w, 
                  child: Switch(
                    value: value ?? false,
                    activeColor: AppColors.mintLeaf,
                    onChanged: onChanged,
                    thumbColor: WidgetStateProperty.all(AppColors.white),
                  ),
                )
              : SvgPicture.asset(
                  "assets/svg/Path.svg",
                  height: 15.h,
                  width: 5.w,
                ),
        ],
      ),
    );
  }
}
