import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:terra_time_app/app/setting/components/setting_buttton.dart';
import 'package:terra_time_app/app/setting/components/upgrade_premium_card.dart';
import 'package:terra_time_app/app/setting/setting_controller.dart';
import 'package:terra_time_app/utils/app_constant/app_colors.dart';
import 'package:terra_time_app/utils/app_constant/text.dart';
import 'package:terra_time_app/utils/app_text/app_text.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SettingsController(),
      child: Consumer<SettingsController>(
        builder: (context, settingsProvider, child) {
          return Scaffold(
            backgroundColor: AppColors.ghostWhite,
            appBar: AppBar(
              backgroundColor: AppColors.ghostWhite,
              automaticallyImplyLeading: false,
              title: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w), 
                child: AppText(
                  title: StringText.setting,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32.w), 
                  child: Column(
                    children: [
                      Gap(30.h), 
                      SettingButton(
                        title: StringText.notifications,
                        showSwitch: true,
                        value: settingsProvider.isnotificationSwitched,
                        onChanged: settingsProvider.notificationtoggleSwitch,
                      ),
                      Gap(10.h), 
                      SettingButton(
                        title: StringText.hourTime,
                        showSwitch: true,
                        value: settingsProvider.ishourTimeSwitched,
                        onChanged: settingsProvider.hourTimetoggleSwitch,
                      ),
                      Gap(10.h), 
                      SettingButton(
                        title: StringText.shareApp,
                      ),
                      Gap(10.h),
                      SettingButton(
                        title: StringText.privacyPolicy,
                      ),
                      Gap(116.h), 
                      UpgradePremiumCard(
                        upGradeButtononTap: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
