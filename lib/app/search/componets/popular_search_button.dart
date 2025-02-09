import 'package:flutter/material.dart';
import 'package:terra_time_app/utils/app_constant/app_colors.dart';
import 'package:terra_time_app/utils/app_text/app_text.dart';

class PopularSearchButton extends StatelessWidget {
  final String cityName;
  final VoidCallback onTap;

  const PopularSearchButton(
      {super.key, required this.cityName, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: AppColors.brightGray,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFFD1DCEE).withOpacity(0.34),
              offset: const Offset(0, 2),
              blurRadius: 4,
            ),
          ],
        ),
        child:
            AppText(title: cityName, fontSize: 12, fontWeight: FontWeight.w600),
      ),
    );
  }
}
