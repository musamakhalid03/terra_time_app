import 'package:flutter/material.dart';
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
      height: height,
      width: width ?? double.infinity,
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
      child: TextFormField(
        readOnly: readOnly,
        obscureText: obscure,
        controller: controller,
        onChanged: onChange,
        validator: validator,
        onFieldSubmitted: onFieldSubmitted,
        onTap: ontap,
        style: const TextStyle(
          color: AppColors.black,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          suffixIcon: hassuffix
              ? Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: SvgPicture.asset(
                    suffixIcon ?? "assets/svg/serach.svg",
                    width: 20,
                    height: 20,
                    colorFilter:
                        const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
                  ),
                )
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          hintText: hint,
          hintStyle: const TextStyle(
            color: Colors.grey,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
