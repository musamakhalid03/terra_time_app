import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; 
import 'package:flutter_svg/flutter_svg.dart';
import 'package:terra_time_app/utils/app_constant/app_colors.dart';

class IconInputField extends StatelessWidget {
  const IconInputField({
    super.key,
    this.controller,
    this.hint,
    this.obscure = false,
    this.readOnly = false,
    this.hassuffix = true,
    this.suffixIcon = 'assets/svg/serach.svg',
    this.validator,
    this.onChange,
    this.ontap,
    this.width,
    this.height = 55,
    this.onFieldSubmitted,
  });

  final ValueChanged<String>? onChange;
  final VoidCallback? ontap;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool obscure;
  final bool hassuffix;
  final String? suffixIcon;
  final String? hint;
  final bool readOnly;
  final double? width;
  final double? height;
  final ValueChanged<String>? onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height?.h ?? 55.h, 
      width: width ?? double.infinity, 
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
      child: TextFormField(
        readOnly: readOnly,
        obscureText: obscure,
        controller: controller,
        onChanged: onChange,
        validator: validator,
        onFieldSubmitted: onFieldSubmitted,
        onTap: ontap,
        style: TextStyle(
          color: AppColors.black,
          fontSize: 16.sp, 
          fontWeight: FontWeight.w400,
        ),
        decoration: InputDecoration(
          contentPadding:
              EdgeInsets.symmetric(vertical: 16.h, horizontal: 20.w), 
          suffixIcon: hassuffix
              ? Padding(
                  padding: EdgeInsets.only(right: 20.w), 
                  child: SvgPicture.asset(
                    suffixIcon ?? "assets/svg/serach.svg",
                    width: 20.w,
                    height: 20.h, 
                    colorFilter:
                        const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
                  ),
                )
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r), 
            borderSide: BorderSide.none,
          ),
          hintText: hint,
          hintStyle: TextStyle(
            color: Colors.grey,
            fontSize: 16.sp, 
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
