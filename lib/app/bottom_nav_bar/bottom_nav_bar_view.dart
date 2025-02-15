// ignore_for_file: prefer_const_constructors

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:terra_time_app/app/bottom_nav_bar/bottom_nav_bar_controller.dart';
import 'package:terra_time_app/app/clocks/clocks_view.dart';
import 'package:terra_time_app/app/home/home_view.dart';
import 'package:terra_time_app/app/search/search_view.dart';
import 'package:terra_time_app/app/setting/setting_view.dart';
import 'package:terra_time_app/utils/app_constant/app_colors.dart';
import 'package:terra_time_app/utils/app_text/app_text.dart';

class BottomNavBarView extends StatelessWidget {
  const BottomNavBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MainController(),
      child: Consumer<MainController>(
        builder: (context, provider, child) {
          final List<Widget> fragments = [
            const HomeView(),
            const ClocksView(),
            const SearchView(),
            const SettingView(),
          ];

          return WillPopScope(
            onWillPop: () => Future.value(false),
            child: Scaffold(
              extendBody: true,
              backgroundColor: AppColors.white,
              body: SafeArea(
                child: fragments[provider.bottomIndex],
              ),
              bottomNavigationBar: Container(
                decoration: BoxDecoration(
                  color: AppColors.white,
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFFEFF1F4).withOpacity(0.3),
                      offset: Offset(0, -4.h),
                      blurRadius: 20.r,
                      spreadRadius: 0.r,
                    ),
                  ],
                ),
                child: BottomAppBar(
                  color: AppColors.white,
                  shape: const CircularNotchedRectangle(),
                  height: Platform.isAndroid
                      ? 65.h
                      : MediaQuery.of(context).size.height * 0.1.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Expanded(
                        child: buildNavigationBarItem(
                            context, provider, 0, "assets/svg/home.svg", 'Home'),
                      ),
                      Expanded(
                        child: buildNavigationBarItem(
                            context, provider, 1, "assets/svg/clock.svg", 'Clocks'),
                      ),
                      Expanded(
                        child: buildNavigationBarItem(
                            context, provider, 2, "assets/svg/serach.svg", 'Search'),
                      ),
                      Expanded(
                        child: buildNavigationBarItem(
                            context, provider, 3, "assets/svg/setting.svg", 'Settings'),
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

  Widget buildNavigationBarItem(BuildContext context, MainController provider,
      int index, String activeIcon, String label) {
    return GestureDetector(
      onTap: () {
        provider.updateIndex(index);
      },
      child: Container(
        color: AppColors.white,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                activeIcon,
                width: 24.w,
                height: 24.h,
                color: provider.bottomIndex == index
                    ? AppColors.deepPink
                    : AppColors.mediumGray,
              ),
              Gap(4.h),
              Flexible( 
                child: AppText(
                  title: label,
                  color: provider.bottomIndex == index
                      ? AppColors.deepPink
                      : AppColors.mediumGray,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
