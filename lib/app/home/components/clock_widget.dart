import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; 
import 'package:provider/provider.dart';
import 'package:terra_time_app/app/home/components/clock_hands_painter.dart';
import 'package:terra_time_app/app/home/home_controller.dart';
import 'package:terra_time_app/utils/app_constant/images.dart';

class ClockWidget extends StatelessWidget {
  const ClockWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeController>(
      builder: (context, homeController, child) {
        return SizedBox(
          child: Stack(
            alignment: Alignment.center,
            children: [
              SvgPicture.asset(
                ImageConst.clockBackGround,
                fit: BoxFit.scaleDown,
                width: 264.w, 
                height: 264.h,
              ),
              CustomPaint(
                size: Size(300.w, 300.h),
                painter: ClockHandsPainter(homeController.currentTime),
              ),
            ],
          ),
        );
      },
    );
  }
}
