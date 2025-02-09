import 'dart:math';
import 'package:flutter/material.dart';
import 'package:terra_time_app/utils/app_constant/app_colors.dart';

class ClockHandsPainter extends CustomPainter {
  final DateTime time;
  ClockHandsPainter(this.time);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    final paintHourHand = Paint()
      ..color = AppColors.black
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round;

    final paintMinuteHand = Paint()
      ..color = AppColors.mediumLight
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round;

    final paintSecondHand = Paint()
      ..color = AppColors.deepPink
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;

    double hourAngle = ((time.hour % 12) + (time.minute / 60)) * 30 * pi / 180;
    double minuteAngle = (time.minute + (time.second / 60)) * 6 * pi / 180;
    double secondAngle = (time.second * 6) * pi / 180;

    final hourHandLength = radius * 0.4;
    final minuteHandLength = radius * 0.55;
    final secondHandLength = radius * 0.65;

    final hourHandEnd = center +
        Offset(
            hourHandLength * sin(hourAngle), -hourHandLength * cos(hourAngle));
    final minuteHandEnd = center +
        Offset(minuteHandLength * sin(minuteAngle),
            -minuteHandLength * cos(minuteAngle));
    final secondHandEnd = center +
        Offset(secondHandLength * sin(secondAngle),
            -secondHandLength * cos(secondAngle));

    canvas.drawLine(center, hourHandEnd, paintHourHand);
    canvas.drawLine(center, minuteHandEnd, paintMinuteHand);
    canvas.drawLine(center, secondHandEnd, paintSecondHand);

    final paintCenter = Paint()..color = AppColors.deepPink;
    canvas.drawCircle(center, 4, paintCenter);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
