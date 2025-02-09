// ignore_for_file: use_super_parameters, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppText extends StatelessWidget {
  AppText(
      {this.title = "App",
      this.color = Colors.black,
      this.decoration = TextDecoration.none,
      this.style,
      this.fontSize,
      this.fontWeight,
      this.fontFamily,
      this.textAlign,
      this.height,
      this.letterSpacing,
      this.maxLines,
      this.wordSpacing,
      this.overFlow,
      this.fontStyle,
      super.key});
  final Color color;
  final TextStyle? style;
  final TextOverflow? overFlow;
  final String title;
  final double? fontSize;
  final double? height;
  final FontWeight? fontWeight;
  final TextDecoration decoration;
  final FontStyle? fontStyle;
  final String? fontFamily;
  final TextAlign? textAlign;
  final double? letterSpacing;
  final int? maxLines;
  final double? wordSpacing;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.inter(
          textStyle: style ??
              TextStyle(
                color: color,
                fontSize: fontSize,
                height: height ?? 0,
                fontStyle: fontStyle,
                fontWeight: fontWeight,
                decoration: decoration,
                decorationColor: color,
                letterSpacing: letterSpacing,
                wordSpacing: wordSpacing,
              )),
      overflow: overFlow,
      textAlign: textAlign,
      maxLines: maxLines,
    );
  }
}
