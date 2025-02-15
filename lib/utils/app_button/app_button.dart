import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:terra_time_app/utils/app_constant/app_colors.dart';
import 'package:terra_time_app/utils/app_text/app_text.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    this.height = 50,
    this.buttonWidth = 1.0,
    this.buttonColor,
    this.boxShadow,
    this.textColor,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.prefixWidget,
    this.suffixWidget,
    this.title,
    this.titleColor,
    this.ontap,
  });

  final double? height;
  final double buttonWidth;
  final Color? buttonColor;
  final List<BoxShadow>? boxShadow;
  final Color? textColor;
  final MainAxisAlignment mainAxisAlignment;
  final Widget? prefixWidget;
  final Widget? suffixWidget;
  final String? title;
  final Color? titleColor;
  final Function()? ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: height?.h ?? 50.h,
        width: MediaQuery.of(context).size.width * buttonWidth, 
        decoration: appBoxDecoration(innerShadow: boxShadow, color: buttonColor),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w), 
          child: Row(
            mainAxisAlignment: mainAxisAlignment,
            children: [
              if (prefixWidget != null) prefixWidget!,
              Expanded( 
                child: AppText(
                  title: title ?? '',
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w700,
                  color: titleColor ?? AppColors.white,
                  textAlign: TextAlign.center, 
                ),
              ),
              if (suffixWidget != null) suffixWidget!,
            ],
          ),
        ),
      ),
    );
  }
}

BoxDecoration appBoxDecoration({List<BoxShadow>? innerShadow, Color? color}) {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(12.r), 
    boxShadow: innerShadow,
    color: color,
  );
}
