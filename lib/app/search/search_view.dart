import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // Import ScreenUtil
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:terra_time_app/app/search/componets/popular_search_button.dart';
import 'package:terra_time_app/app/search/search_controller.dart';
import 'package:terra_time_app/utils/app_constant/app_colors.dart';
import 'package:terra_time_app/utils/app_constant/text.dart';
import 'package:terra_time_app/utils/app_text/app_text.dart';
import 'package:terra_time_app/utils/app_text_field.dart/icon_text_field.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SearchsController(),
      child: Consumer<SearchsController>(
        builder: (context, searchController, child) {
          return Scaffold(
            backgroundColor: AppColors.ghostWhite,
            appBar: AppBar(
              backgroundColor: AppColors.ghostWhite,
              automaticallyImplyLeading: false,
              title: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: AppText(
                  title: StringText.search,
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconInputField(
                        hint: StringText.searchHere,
                        controller: searchController.searchController,
                        ontap: () {
                          searchController.onSearch(context);
                        },
                        onFieldSubmitted: (value) {
                          searchController.onSearch(context);
                        },
                      ),
                      Gap(31.h),
                      AppText(
                        title: StringText.oplarSearches,
                        fontSize: 16.sp, 
                        fontWeight: FontWeight.w400,
                        color: AppColors.dimGray,
                      ),
                      Gap(10.h),
                      Wrap(
                        spacing: 10.w, 
                        runSpacing: 10.h,
                        children: searchController.popularSearches.map((city) {
                          return PopularSearchButton(
                            cityName: city,
                            onTap: () => searchController.setSearch(city),
                          );
                        }).toList(),
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
