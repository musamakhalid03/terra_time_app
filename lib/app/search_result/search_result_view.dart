import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:terra_time_app/app/search_result/componets/clock_weather_card.dart';
import 'package:terra_time_app/app/search_result/search_result_controller.dart';
import 'package:terra_time_app/utils/app_button/app_button.dart';
import 'package:terra_time_app/utils/app_constant/app_colors.dart';
import 'package:terra_time_app/utils/app_constant/text.dart';
import 'package:terra_time_app/utils/app_text/app_text.dart';
import 'package:terra_time_app/utils/app_text_field.dart/icon_text_field.dart';

class SearchResultView extends StatelessWidget {
  const SearchResultView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SearchResultController(),
      child: Consumer<SearchResultController>(
        builder: (context, searchResultController, child) {
          return Scaffold(
            backgroundColor: AppColors.ghostWhite,
            appBar: AppBar(
              backgroundColor: AppColors.ghostWhite,
              title: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: AppText(
                  title: StringText.search,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: [
                      IconInputField(
                        hint: StringText.searchHere,
                        controller: searchResultController.searchController,
                      ),
                      Gap(32),
                      ClockWeatherCard(),
                      Gap(23),
                      AppButton(
                        title: "ADD CLOCK",
                        buttonColor: AppColors.deepPink,
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
