import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:terra_time_app/app/clocks/clocks_controller.dart';
import 'package:terra_time_app/app/clocks/components/clock_card.dart';
import 'package:terra_time_app/utils/app_constant/app_colors.dart';
import 'package:terra_time_app/utils/app_constant/text.dart';
import 'package:terra_time_app/utils/app_text/app_text.dart';
import 'package:terra_time_app/utils/app_text_field.dart/icon_text_field.dart';

class ClocksView extends StatelessWidget {
  const ClocksView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ClockController(),
      child: Consumer<ClockController>(
        builder: (context, clockController, child) {
          return Scaffold(
            backgroundColor: AppColors.ghostWhite,
            appBar: AppBar(
              backgroundColor: AppColors.ghostWhite,
              automaticallyImplyLeading: false,
              title: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w), 
                child: AppText(
                  title: StringText.clocks,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w), 
                  child: Column(
                    children: [
                      IconInputField(
                        hint: StringText.searchCities,
                      ),
                      Gap(26.h), 
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: clockController.cities.length,
                        itemBuilder: (context, index) {
                          final city = clockController.cities[index];
                          return ClockCard(
                            city: city,
                            time: clockController
                                .getTimeForCity(city["timezoneOffset"])
                                .toLocal()
                                .toString()
                                .substring(11, 16),
                          );
                        },
                      )
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
