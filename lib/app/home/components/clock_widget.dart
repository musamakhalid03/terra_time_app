import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
              SvgPicture.asset(ImageConst.clockBackGround,
                  fit: BoxFit.scaleDown, width: 264, height: 264),
              CustomPaint(
                size: const Size(300, 300),
                painter: ClockHandsPainter(homeController.currentTime),
              ),
            ],
          ),
        );
      },
    );
  }
}
