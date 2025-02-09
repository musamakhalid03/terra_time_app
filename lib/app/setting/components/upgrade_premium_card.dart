import 'package:flutter/material.dart';
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
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: AssetImage('assets/png/BG.png'),
            fit: BoxFit.cover,
          )),
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
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                Gap(8),
                AppText(
                  title: StringText.upgradePremiumSubTitle,
                  color: AppColors.lightGrayishBlue,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
                Gap(16),
                GestureDetector(
                  onTap: upGradeButtononTap,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                    decoration: BoxDecoration(
                      color: AppColors.deepPink,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: AppText(
                      title: StringText.upgrade,
                      fontSize: 14,
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
