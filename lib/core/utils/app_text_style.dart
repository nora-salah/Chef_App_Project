import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

TextStyle _textStyle({
  required Color color,
  required double fontSize,
  required FontWeight fontWeight,
}) {
  return GoogleFonts.lato(
    color: color,
    fontSize: fontSize,
    fontWeight: fontWeight,
  );
}

TextStyle boldStyle({
  Color color = AppColors.white,
  double fontSize = 24,
}) {
  return _textStyle(
    color: color,
    fontSize: fontSize.sp,
    fontWeight: FontWeight.bold,
  );
}

TextStyle regularStyle({
  Color color = AppColors.white,
  double fontSize = 24,
}) {
  return _textStyle(
    color: color,
    fontSize: fontSize,
    fontWeight: FontWeight.normal,
  );
}
