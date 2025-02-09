import 'package:flutter/material.dart';
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
        create: (context) => SettingsProvider(),
        child: Consumer<SettingsProvider>(
            builder: (context, settingsProvider, child) {
          return Scaffold(
            backgroundColor: AppColors.ghostWhite,
            appBar: AppBar(
              backgroundColor: AppColors.ghostWhite,
              automaticallyImplyLeading: false,
              title: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: AppText(
                  title: StringText.setting,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                children: [
                  Gap(30),
                  SettingButton(
                    title: StringText.notifications,
                    showSwitch: true,
                    value: settingsProvider.isnotificationSwitched,
                    onChanged: settingsProvider.notificationtoggleSwitch,
                  ),
                  Gap(10),
                  SettingButton(
                    title: StringText.hourTime,
                    showSwitch: true,
                    value: settingsProvider.ishourTimeSwitched,
                    onChanged: settingsProvider.hourTimetoggleSwitch,
                  ),
                  Gap(10),
                  SettingButton(
                    title: StringText.shareApp,
                  ),
                  Gap(10),
                  SettingButton(
                    title: StringText.privacyPolicy,
                  ),
                  Gap(116),
                  UpgradePremiumCard(
                    upGradeButtononTap: () {},
                  ),
                ],
              ),
            ),
          );
        }));
  }
}
